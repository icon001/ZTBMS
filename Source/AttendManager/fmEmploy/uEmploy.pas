unit uEmploy;
 
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvEdit, AdvEdBtn, PlannerDatePicker, ExtCtrls, StdCtrls,
  Buttons, Grids, BaseGrid, AdvGrid, ComCtrls,DB,Jpeg, uSubForm,
  CommandArray, OoMisc, AdPort,WinSpool, AdPacket, ADODB,
  LMDCustomComponent, LMDFileCtrl,ActiveX,iniFiles, Gauges,ComObj, AdvObj;

type
  TfmEmploy = class(TfmASubForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    Panel3: TPanel;
    pn_Employ: TPanel;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Splitter1: TSplitter;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Panel5: TPanel;
    Image1: TImage;
    Label14: TLabel;
    btn_Image: TSpeedButton;
    Label16: TLabel;
    sg_Employ: TAdvStringGrid;
    btn_Insert: TSpeedButton;
    btn_Update: TSpeedButton;
    btn_Save: TSpeedButton;
    btn_Delete: TSpeedButton;
    btn_Search: TBitBtn;
    RzOpenDialog1: TOpenDialog;
    ed_EmpImg: TEdit;
    ReaderPort: TApdComPort;
    ApdDataPacket1: TApdDataPacket;
    SpeedButton1: TSpeedButton;
    chk_AutoSabun: TCheckBox;
    ADOQuery: TADOQuery;
    Panel12: TPanel;
    btn_Cancel: TSpeedButton;
    Label21: TLabel;
    Label22: TLabel;
    GroupBox1: TGroupBox;
    Label20: TLabel;
    Label23: TLabel;
    ed_payAmt: TEdit;
    lb_atType: TLabel;
    Label25: TLabel;
    cmb_PayGubun: TComboBox;
    lb_Pass: TLabel;
    FileCtrl: TLMDFileCtrl;
    pan_Hide: TPanel;
    Label11: TLabel;
    ed_sZipcode: TEdit;
    btn_ZipcodeSearch: TSpeedButton;
    ed_sAddr1: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    ed_sAddr2: TEdit;
    ed_sHomePhone: TEdit;
    Label15: TLabel;
    GroupBox5: TGroupBox;
    rg_CardReader: TRadioGroup;
    cmb_ComPort: TComboBox;
    Label19: TLabel;
    ed_CardNo: TEdit;
    chk_CardReg: TCheckBox;
    Label26: TLabel;
    cmb_RegGubun: TComboBox;
    Label44: TLabel;
    Panel4: TPanel;
    gb_sudang: TGroupBox;
    rg_ExtraType: TRadioGroup;
    PageControl1: TPageControl;
    WeekDayTab: TTabSheet;
    Label24: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    lb_wEalry: TLabel;
    lb_WExtend: TLabel;
    lb_WNight: TLabel;
    ed_WEarlyAmt: TEdit;
    ed_WExtendAmt: TEdit;
    ed_WNightAmt: TEdit;
    SaturdayTab: TTabSheet;
    Label32: TLabel;
    lb_sEalry: TLabel;
    lb_sExtend: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    lb_sNight: TLabel;
    ed_SEarlyAmt: TEdit;
    ed_SExtendAmt: TEdit;
    ed_SNightAmt: TEdit;
    HolidayTab: TTabSheet;
    Label38: TLabel;
    lb_hEalry: TLabel;
    lb_hExtend: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    lb_hNight: TLabel;
    ed_HEarlyAmt: TEdit;
    ed_HExtendAmt: TEdit;
    ed_HNightAmt: TEdit;
    Label18: TLabel;
    dt_sRetireDt: TDateTimePicker;
    Label17: TLabel;
    dt_sJoinDt: TDateTimePicker;
    ADOQuery1: TADOQuery;
    btn_Close: TSpeedButton;
    fdmsADOQuery: TADOQuery;
    ed_sEmpNo: TEdit;
    ed_sEmpNM: TEdit;
    cmb_sCompany: TComboBox;
    cmb_sJijum: TComboBox;
    cmb_sDepart: TComboBox;
    cmb_sPosi: TComboBox;
    ed_sCompanyPhone: TEdit;
    ed_sHandphone: TEdit;
    ed_PassNo: TEdit;
    cmb_AtType: TComboBox;
    cmb_Company: TComboBox;
    cmb_Jijum: TComboBox;
    cmb_Depart: TComboBox;
    cmb_Posi: TComboBox;
    ed_EmpNo: TEdit;
    ed_EmpNM: TEdit;
    btn_Excel: TSpeedButton;
    SaveDialog1: TSaveDialog;
    pan_gauge: TPanel;
    Label29: TLabel;
    Gauge1: TGauge;
    cmb_WorkerType: TComboBox;
    lb_WorkerType: TLabel;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure cmb_CompanyChange(Sender: TObject);
    procedure cmb_sCompanyChange(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure sg_EmployClick(Sender: TObject);
    procedure btn_InsertClick(Sender: TObject);
    procedure ed_sEmpNoKeyPress(Sender: TObject; var Key: Char);
    procedure cmb_sCompanyKeyPress(Sender: TObject; var Key: Char);
    procedure ed_sEmpNMKeyPress(Sender: TObject; var Key: Char);
    procedure cmb_sDepartKeyPress(Sender: TObject; var Key: Char);
    procedure cmb_sPosiKeyPress(Sender: TObject; var Key: Char);
    procedure ed_sCompanyPhoneKeyPress(Sender: TObject; var Key: Char);
    procedure dt_sJoinDtKeyPress(Sender: TObject; var Key: Char);
    procedure dt_sRetireDtKeyPress(Sender: TObject; var Key: Char);
    procedure ed_sZipcodeKeyPress(Sender: TObject; var Key: Char);
    procedure ed_sAddr1KeyPress(Sender: TObject; var Key: Char);
    procedure ed_sAddr2KeyPress(Sender: TObject; var Key: Char);
    procedure ed_sHomePhoneKeyPress(Sender: TObject; var Key: Char);
    procedure ed_sHandphoneKeyPress(Sender: TObject; var Key: Char);
    procedure chk_CardRegKeyPress(Sender: TObject; var Key: Char);
    procedure cmb_RegGubunKeyPress(Sender: TObject; var Key: Char);
    procedure btn_ImageClick(Sender: TObject);
    procedure btn_UpdateClick(Sender: TObject);
    procedure btn_DeleteClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure chk_CardRegClick(Sender: TObject);
    procedure btn_ZipcodeSearchClick(Sender: TObject);
    procedure CommandArrayCommandsTCommand0Execute(Command: TCommand;
      Params: TStringList);
    procedure cmb_ComPortChange(Sender: TObject);
    procedure ApdDataPacket1StringPacket(Sender: TObject; Data: String);
    procedure cmb_DepartChange(Sender: TObject);
    procedure cmb_PosiChange(Sender: TObject);
    procedure ed_EmpNoKeyPress(Sender: TObject; var Key: Char);
    procedure ed_EmpNMKeyPress(Sender: TObject; var Key: Char);
    procedure ed_sEmpNoExit(Sender: TObject);
    procedure chk_AutoSabunClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmb_JijumChange(Sender: TObject);
    procedure cmb_sJijumChange(Sender: TObject);
    procedure rg_CardReaderClick(Sender: TObject);
    procedure CommandArrayCommandsTCommand1Execute(Command: TCommand;
      Params: TStringList);
    procedure rg_ExtraTypeClick(Sender: TObject);
    procedure btn_ExcelClick(Sender: TObject);

  private
    CompanyCodeList : TStringList;
    sCompanyCodeList : TStringList;
    JijumCodeList : TStringList;
    sJijumCodeList : TStringList;
    PosiCodeList : TStringList;
    sPosiCodeList : TStringList;
    DepartCodeList : TStringList;
    sDepartCodeList : TStringList;
    ComPortList : TStringList;
    ATTYPECodeList : TStringList;
    DeviceCodeList : TStringList;
    WorkTypeCode : TStringList; //상시근무자 코드 타입
    State : string;
    L_OldCardNo : string;
    L_OldPassNo:string;
    AutoSabun : integer;
    ChangATType : integer; //교대근무타입 0:고정근무타입,1:사원별근무타입,2:교대근무타입 ,3: 혼합
    L_nAtTypePay : integer; //0:근태타입별,1:전체동일계산,2:개인별계산
    L_Close : Boolean;
    { Private declarations }
    procedure GetTB_CONFIG;

    procedure FormClear;
    procedure FormEnable(aState:string);
    procedure ButtonEnable(aState:string);
    procedure ShowEmployee(aCode : string;aTopRow:integer=0);

    procedure LoadATType(aStringList:TStringList;cmb_Box:TComboBox);
    procedure LoadDeviceList(cmb_Box:TComboBox);
    procedure LoadWorkType ;

    procedure pn_EmployInit;
    procedure pn_EmployInSertMode;
    procedure pn_EmployUpdateMode;
  private
    Function CheckPassNo(aPassNo:string; var aCompanyCode,aEmCode:string):Boolean;
    Function CheckTB_ATCARD(aCardNo:string):Boolean;
    Function CheckTB_ATEMPEXTRA(aCompanyCode,aEmCode:string):Boolean;
    Function CheckTB_ATPASS(aPassNo:string):Boolean;
    Function CheckTB_BASEPAY(aCompanyCode,aEmpID,aPayCode:string):Boolean;
    Function CheckTB_CARD(aCardNo,aCompanyCode,aEmpID,aCardType :string;var Mode:string) : Boolean;
    Function CheckTB_EMPLOYEE(aEmpID,aCompanyCode:string):Boolean;

    Function InsertTB_ATCARD(aCardNo,aAtReg,aAtLoad:string):Boolean;
    Function InsertIntoTB_ATEMPEXTRA(aCompanyCode,aEmCode,
                        aExtraType,aWEarlyAmt,aWExtendAmt,
                        aWNightAmt,aSEarlyAmt,aSExtendAmt,
                        aSNightAmt,aHEarlyAmt,aHExtendAmt,
                        aHNightAmt:string):Boolean;
    Function InsertTB_ATPASS(aPassNo,aAtReg,aAtLoad:string):Boolean;
    Function InsertTB_BASEPAY(aCompanyCode,aEmpID,aPayCode,aPayGubun,aPayAmt:string):Boolean;
    Function InsertTB_CARD(aCardNo,aCardGubun,aCardType,aEmpID,aCompanyCode:string) : Boolean;
    Function InsertTB_DEVICECARDNO_AllAtGrade(aCardNo:string):Boolean;
    Function InsertTB_EMPLOYEE(aEmpID,aEmpNM,aCompanyCode,aJijumCode,aDepartCode,aPosiCod,aCompanyPhone,
                                 aJoinDate,aRetireDate,aZipcode,aAddr1,aAddr2,aHomePhone,aHandphone,
                                 aRegGubun,aCardNo,aEmpImg,aATCode,aPayGubun,apayAmt,aPassNo,afdmsID,aWorkType:string):Boolean;
    Function TB_ATEMPEXTRAInsert(aCompanyCode,aEmCode,aExtraType,
                      aWEarlyAmt,aWExtendAmt,aWNightAmt,
                      aSEarlyAmt,aSExtendAmt,aSNightAmt,
                      aHEarlyAmt,aHExtendAmt,aHNightAmt:string):Boolean;

    Function UpdateTB_ATCARD(aCardNo,aAtReg,aAtLoad:string):Boolean;
    Function UpdateTB_ATEMPEXTRA(aCompanyCode,aEmCode,
                        aExtraType,aWEarlyAmt,aWExtendAmt,
                        aWNightAmt,aSEarlyAmt,aSExtendAmt,
                        aSNightAmt,aHEarlyAmt,aHExtendAmt,
                        aHNightAmt:string):Boolean;
    Function UpdateTB_ATPASS(aPassNo,aAtReg,aAtLoad:string):Boolean;
    Function UpdateTB_ACCESSEVENTCARDNO(OldCardNo,aCardNo:string):Boolean;
    Function UpdateTB_ATEVENTCARDNO(OldCardNo,aCardNo:string):Boolean;
    Function UpdateTB_BASEPAY(aCompanyCode,aEmpID,aPayCode,aPayGubun,aPayAmt:string):Boolean;
    Function UpdateTB_CARD(aCardNo,aCardGubun,aCardType,aEmpID,aCompanyCode:string) : Boolean;
    Function UpdateTB_DEVICECARDNO(aCardNo,aPermit:string):Boolean; //모든 카드 권한을 삭제 처리함
    Function UpdateTB_EMPLOYEE(aEmpID,aEmpNM,aCompanyCode,aJijumCode,aDepartCode,aPosiCod,aCompanyPhone,
                                 aJoinDate,aRetireDate,aZipcode,aAddr1,aAddr2,aHomePhone,aHandphone,
                                 aRegGubun,aCardNo,aEmpImg,aATCode,aPayGubun,apayAmt,aPassNo,aWorkType:string):Boolean;
    Function UpdateTB_FoodEventCARDNO(OldCardNo,aCardNo:string):Boolean;

    Function DeleteTB_ATEMPEXTRA(aCompanyCode,aEmCode:string):Boolean;
    Function DeleteTB_BASEPAY(aCompanyCode,aEmpID,aPayCode:string):Boolean;
    Function DeleteTB_CARD(aCardNo:string):Boolean;
    Function DeleteTB_DEVICECARDNO_Cardno(aCardNo:string):Boolean;
    Function DeleteTB_EMPLOYEE(aEmpID,aCompanyCode,aCardNo:string):Boolean;

  private

    Function GetMaxPositionNum : integer; //위치정보 입력을 위한 함수
    Function GetFdmsID:string;
    Function GetEmployeeFdmsID(aCompanyCode,aEmpID:string):string;
    Procedure RcvCardDataByReader(aData:String);
    procedure SetEmployeeSudang(aCompanyCode,aEmCode:string);
    procedure CardReaderFormatChange(aReaderType:string);
  public
    { Public declarations }
    function GetSerialPortList(List : TStringList; const doOpenTest : Boolean = True) : LongWord;
    function EncodeCommportName(PortNum : WORD) : String;
    function DecodeCommportName(PortName : String) : WORD;

  end;

var
  fmEmploy: TfmEmploy;

implementation

uses uDataModule1,
     uZipCode,
     uLomosUtil,
     uCompanyCodeLoad,
     uCommonSql,
     uMssql,
     uMDBSql,
     uPostGreSql,
     uZTBMSFunction,
     uExcelSave;

{$R *.dfm}

procedure TfmEmploy.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmEmploy.FormCreate(Sender: TObject);
begin
  self.ModuleID := 'Employ';

  CompanyCodeList := TStringList.Create;
  sCompanyCodeList := TStringList.Create;
  JijumCodeList := TStringList.Create;
  sJijumCodeList := TStringList.Create;
  PosiCodeList := TStringList.Create;
  sPosiCodeList := TStringList.Create;
  DepartCodeList := TStringList.Create;
  sDepartCodeList := TStringList.Create;
  ComPortList := TStringList.Create;
  ATTYPECodeList := TStringList.Create;
  DeviceCodeList := TStringList.Create;
  WorkTypeCode := TStringList.Create;

  State := '';
  AutoSabun := 1;
  GridInit(sg_Employ,6);

  L_Close := False;
end;

procedure TfmEmploy.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  L_Close := True;
  
  Try
    ApdDataPacket1.Enabled := False;
    //if ReaderPort.Open then
    ReaderPort.Open := False;
  Except
  End;
//  if ApdDataPacket1 <> nil then ApdDataPacket1.Free;
//  if ReaderPort <> nil then  ReaderPort.Free;

  CompanyCodeList.Free;
  sCompanyCodeList.Free;
  JijumCodeList.Free;
  sJijumCodeList.Free;
  PosiCodeList.Free;
  sPosiCodeList.Free;
  DepartCodeList.Free;
  sDepartCodeList.Free;
  ComPortList.Free;
  ATTYPECodeList.Free;
  DeviceCodeList.Free;
  WorkTypeCode.Free;
  
end;

procedure TfmEmploy.FormActivate(Sender: TObject);
var
  nIndex : integer;
begin
  LoadCompanyCode(CompanyCodeList,cmb_Company);
  cmb_CompanyChange(cmb_Company);
  cmb_JijumChange(cmb_Jijum);
  //LoadJijumCode('',JijumCodeList,cmb_Jijum);
  //LoadDepartCode('','',DepartCodeList,cmb_Depart);
  LoadsCompanyCode(sCompanyCodeList,cmb_sCompany);
  cmb_sCompanyChange(cmb_sCompany);
  LoadPosiCode('',PosiCodeList,cmb_Posi);
  LoadsPosiCode('',sPosiCodeList,cmb_sPosi);
  LoadATType(ATTypeCodeList,cmb_AtType);
  LoadWorkType;

  GridInit(sg_Employ,6);
  FormClear;
  //pn_EmployInit;

  btn_Update.Enabled := False;
  btn_Save.Enabled := False;
  btn_Delete.Enabled := False;

  if Not IsMaster then
  begin
    if strtoint(CompanyGrade) > 1 then
    begin
      nIndex := CompanyCodeList.IndexOf(MasterCompany);
      if nIndex > -1 then
      begin
        cmb_Company.ItemIndex := nIndex;
        LoadJijumCode(CompanyCodeList.Strings[nIndex],JijumCodeList,cmb_Jijum);
      end;
      cmb_Company.Enabled := False;
      LoadPosiCode(MasterCompany,PosiCodeList,cmb_Posi);
    end;
    if strtoint(CompanyGrade) > 2 then
    begin
      nIndex := JijumCodeList.IndexOf(MasterCompany + MasterJijum);
      if nIndex > -1 then cmb_Jijum.ItemIndex := nIndex;
      cmb_Jijum.Enabled := False;
    end;
  end;
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
  
  btn_SearchClick(Self);

  if L_nAtTypePay <> 2 then gb_sudang.Visible := False
  else gb_sudang.Visible := True;
end;



procedure TfmEmploy.cmb_CompanyChange(Sender: TObject);
begin
  LoadJijumCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],JijumCodeList,cmb_Jijum);
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
  LoadPosiCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],PosiCodeList,cmb_Posi);
  btn_SearchClick(Self);
end;


procedure TfmEmploy.cmb_sCompanyChange(Sender: TObject);
begin
  LoadsJijumCode(sCompanyCodeList.Strings[cmb_sCompany.ItemIndex],sJijumCodeList,cmb_sJijum);
  LoadsDepartCode(copy(sJijumCodeList.Strings[cmb_sJijum.ItemIndex],1,3),copy(sJijumCodeList.Strings[cmb_sJijum.ItemIndex],4,3),sDepartCodeList,cmb_sDepart);
  LoadsPosiCode(sCompanyCodeList.Strings[cmb_sCompany.ItemIndex],sPosiCodeList,cmb_sPosi);
  ed_sEmpNoExit(nil);
end;

procedure TfmEmploy.btn_SearchClick(Sender: TObject);
begin
  ShowEmployee('');
end;


procedure TfmEmploy.pn_EmployInit;
begin
{  ed_sEmpNo.Text := '';
  ed_sEmpNo.Enabled := False;
  chk_AutoSabun.Enabled := False;
  ed_sEmpNM.Text := '';
  ed_sEmpNM.Enabled := False;
  cmb_sCompany.ItemIndex := 0 ;
  cmb_sCompany.Enabled := False;
  cmb_sDepart.Clear;
  cmb_sDepart.Enabled := False;
  sDepartCodeList.Clear;
  cmb_sPosi.ItemIndex := 0;
  cmb_sPosi.Enabled := False;
  ed_sCompanyPhone.Text := '';
  ed_sCompanyPhone.Enabled := False;
  dt_sJoinDt.Date := Now;
  dt_sJoinDt.Enabled := False;
  dt_sRetireDt.Date := strToDate('9999-12-30');
  dt_sRetireDt.Enabled := False;
  ed_sZipcode.Text := '';
  ed_sZipcode.Enabled := False;
  btn_ZipcodeSearch.Enabled := False;
  ed_sAddr1.Text := '';
  ed_sAddr1.Enabled := False;
  ed_sAddr2.Text := '';
  ed_sAddr2.Enabled := False;
  ed_sHomePhone.Text := '';
  ed_sHomePhone.Enabled := False;
  ed_sHandphone.Text := '';
  ed_sHandphone.Enabled := False;
  chk_CardReg.Enabled := False;
  cmb_ComPort.Enabled := False;
  cmb_RegGubun.ItemIndex := 0;
  cmb_RegGubun.Enabled := False;
  ed_CardNo.Text := '';
  ed_CardNo.Enabled := False;
  Image1.Picture.Graphic := Nil;
  btn_Image.Enabled := False;
  ed_EmpImg.Text := '';}
end;

procedure TfmEmploy.sg_EmployClick(Sender: TObject);
var
  i : integer;
  stSql : string;
  MapJpg : TJpegImage;
  MapStream : TMemoryStream;
  BlobField : TBlobField;
  stTemp : string;
  TempAdoQuery : TADOQuery;
  nIndex : integer;
  stImage : string;
begin
  State := 'CLICK';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  with (Sender as TStringGrid) do
  begin
    if cells[4,Row] = '' then exit;    //사번

    ed_sEmpNo.Text := cells[4,Row];
    ed_sEmpNM.Text := cells[5,Row];
    nIndex := sCompanyCodeList.IndexOf(cells[6,Row]);
    if nIndex > -1 then  cmb_sCompany.ItemIndex := nIndex;

    if cmb_sCompany.ItemIndex > 0 then
    begin
      LoadsJijumCode(cells[6,Row],sJijumCodeList,cmb_sJijum);
      nIndex := sJijumCodeList.IndexOf(cells[6,Row] + cells[7,Row]);
      if nIndex > -1 then cmb_sJijum.ItemIndex := nIndex;
    end;

    if cmb_sJijum.ItemIndex > 0 then
    begin
      LoadsDepartCode(cells[6,Row],cells[7,Row],sDepartCodeList,cmb_sDepart);
      nIndex := sDepartCodeList.IndexOf(cells[6,Row] + cells[7,Row] + cells[8,Row]);
      if nIndex > -1 then cmb_sDepart.ItemIndex := nIndex;
    end;

    if cmb_sCompany.ItemIndex > 0 then
    begin
      LoadsPosiCode(cells[6,Row],sPosiCodeList,cmb_sPosi);
      nIndex := sPosiCodeList.IndexOf(cells[6,Row] + cells[9,Row]);
      if nIndex > -1 then cmb_sPosi.ItemIndex := nIndex;
    end;

    ed_sCompanyPhone.Text := cells[10,Row];
    if length(cells[11,Row]) = 14 then
      dt_sJoinDt.Date := strToDate(copy(cells[11,Row],1,4) + '-' + copy(cells[11,Row],5,2) + '-' + copy(cells[11,Row],7,2) ) ;
    if length(cells[12,Row]) = 14 then
      dt_sRetireDt.Date := strToDate(copy(cells[12,Row],1,4) + '-' + copy(cells[12,Row],5,2) + '-' + copy(cells[12,Row],7,2) ) ;
    ed_sZipcode.Text := cells[13,Row];
    ed_sAddr1.Text := cells[14,Row];
    ed_sAddr2.Text := cells[15,Row];
    ed_sHomePhone.Text := cells[16,Row];
    ed_sHandphone.Text := cells[17,Row];

    nIndex := ATTypeCodeList.IndexOf(cells[21,Row]);
    if nIndex > -1 then cmb_AtType.ItemIndex := nIndex;

    if Not IsDigit(Cells[22,Row]) then cmb_PayGubun.ItemIndex := 0
    else cmb_PayGubun.ItemIndex := strtoint(Cells[22,Row]);

    if Cells[23,Row] = '' then Cells[23,Row] := '0';
    ed_payAmt.Text := Cells[23,Row];
    ed_PassNo.Text := Cells[24,Row];
    L_OldPassNo := Cells[24,Row];

    if  cells[18,Row] = 'Y' then
    begin
      //여기서 이미지 로딩하자.

      MapJpg := TJpegImage.Create;
      MapStream := TMemoryStream.Create;

      stSql := ' select EM_IMAGE from TB_EMPLOYEE ';
      stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
      stSql := stSql + ' AND EM_CODE = ''' + cells[4,Row] + ''' ';
      stSql := stSql + ' AND CO_COMPANYCODE = ''' + cells[6,Row] + ''' ';

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
          //
        End;

        if RecordCount > 0 then
        begin
          if DBType = 'MSSQL' then
          begin
            JPEGLoadFromDB(FieldByName('EM_IMAGE'), Image1);
          end else
          begin
            stImage := FindField('EM_IMAGE').AsString;
            if FileExists(stImage) then
              Image1.Picture.LoadFromFile(stImage);
          end;
        end;

      end;
      TempAdoQuery.Free;
      CoUninitialize;
      MapJpg.Free;
      MapStream.Free;

    end;
    for i:= 1 to cmb_RegGubun.Items.Count - 1 do
    begin
      if L_Close then Exit;
      stTemp := copy(cmb_RegGubun.Items[i],1,1);
      if cells[20,Row] = copy(cmb_RegGubun.Items[i],1,1) then
      begin
        cmb_RegGubun.ItemIndex := i;
        break;
      end;
    end;
    ed_CardNo.Text := cells[19,Row];

    if L_nAtTypePay = 2 then
    begin
      SetEmployeeSudang(cells[6,Row],cells[4,Row]);
    end;
    cmb_WorkerType.ItemIndex := WorkTypeCode.IndexOf(Cells[25,Row]);

  end;

end;


procedure TfmEmploy.btn_InsertClick(Sender: TObject);
var
  nIndex : integer;
begin
  State := 'INSERT';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);
  with sg_Employ do
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

  if Not IsMaster then
  begin
    if strtoint(CompanyGrade) > 1 then
    begin
      nIndex := sCompanyCodeList.IndexOf(MasterCompany);
      if nIndex > -1 then cmb_sCompany.ItemIndex := nIndex;
      LoadsJijumCode(MasterCompany,sJijumCodeList,cmb_sJijum);
      LoadsPosiCode(MasterCompany,sPosiCodeList,cmb_sPosi);
    end;
    if strtoint(CompanyGrade) > 2 then
    begin
      nIndex := sJijumCodeList.IndexOf(MasterCompany + MasterJijum);
      if nIndex > -1 then cmb_sJijum.ItemIndex := nIndex;
      LoadsDepartCode(MasterCompany,MasterJijum,sDepartCodeList,cmb_sDepart);
    end;
  end;

  if chk_AutoSabun.Checked then
  begin
    ed_sEmpNo.Text := 'Z-' + FillZeroNumber(AutoSabun,5);
    chk_AutoSabun.Enabled := True;
    ed_sEmpNo.Enabled := False;
    ed_sEmpNm.SetFocus;
  end;

end;

procedure TfmEmploy.pn_EmployInSertMode;
begin
  ed_sEmpNo.Text := '';
  ed_sEmpNM.Text := '';
  cmb_sCompany.ItemIndex := 0 ;
  cmb_sDepart.Clear;
  sDepartCodeList.Clear;
  cmb_sPosi.ItemIndex := 0;
  ed_sCompanyPhone.Text := '';
  dt_sJoinDt.Date := Now;
  dt_sRetireDt.Date := strToDate('9999-12-30');
  ed_sZipcode.Text := '';
  ed_sAddr1.Text := '';
  ed_sAddr2.Text := '';
  ed_sHomePhone.Text := '';
  ed_sHandphone.Text := '';
  cmb_RegGubun.ItemIndex := 1;
  ed_CardNo.Text := '';
  Image1.Picture.Graphic := Nil;
  ed_EmpImg.Text := '';

  ed_sEmpNo.Enabled := True;
  chk_AutoSabun.Enabled := True;
  ed_sEmpNM.Enabled := True;
  cmb_sCompany.Enabled := True;
  cmb_sDepart.Enabled := True;
  cmb_sPosi.Enabled := True;
  ed_sCompanyPhone.Enabled := True;
  dt_sJoinDt.Enabled := True;
  dt_sRetireDt.Enabled := True;
  ed_sZipcode.Enabled := True;
  btn_ZipcodeSearch.Enabled := True;
  ed_sAddr1.Enabled := True;
  ed_sAddr2.Enabled := True;
  ed_sHomePhone.Enabled := True;
  ed_sHandphone.Enabled := True;
  chk_CardReg.Enabled := True;
  if chk_CardReg.Checked then cmb_ComPort.Enabled := True;
  cmb_RegGubun.Enabled := True;
  ed_CardNo.Enabled := True;
  btn_Image.Enabled := True;

end;

procedure TfmEmploy.ed_sEmpNoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    ed_sEmpNM.SetFocus;
  end;
end;

procedure TfmEmploy.cmb_sCompanyKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    cmb_sDepart.SetFocus;
  end;

end;

procedure TfmEmploy.ed_sEmpNMKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    cmb_sCompany.SetFocus;
  end;

end;

procedure TfmEmploy.cmb_sDepartKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    cmb_sPosi.SetFocus;
  end;

end;

procedure TfmEmploy.cmb_sPosiKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    ed_sCompanyPhone.SetFocus;
  end;

end;

procedure TfmEmploy.ed_sCompanyPhoneKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    dt_sJoinDt.SetFocus;
  end;

end;

procedure TfmEmploy.dt_sJoinDtKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    dt_sRetireDt.SetFocus;
  end;

end;

procedure TfmEmploy.dt_sRetireDtKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    ed_sZipcode.SetFocus;
  end;

end;

procedure TfmEmploy.ed_sZipcodeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    ed_sAddr1.SetFocus;
  end;

end;

procedure TfmEmploy.ed_sAddr1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    ed_sAddr2.SetFocus;
  end;

end;

procedure TfmEmploy.ed_sAddr2KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    ed_sHomePhone.SetFocus;
  end;

end;

procedure TfmEmploy.ed_sHomePhoneKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    ed_sHandphone.SetFocus;
  end;

end;

procedure TfmEmploy.ed_sHandphoneKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    chk_CardReg.SetFocus;
  end;

end;

procedure TfmEmploy.chk_CardRegKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    //cmb_ComPort.SetFocus;
  end;

end;

procedure TfmEmploy.cmb_RegGubunKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    ed_CardNo.SetFocus;
  end;

end;

procedure TfmEmploy.btn_ImageClick(Sender: TObject);
begin
  RzOpenDialog1.Title:= '사원 이미지 찾기';
  RzOpenDialog1.DefaultExt:= 'Jpg';
  RzOpenDialog1.Filter := 'Jpg files (*.Jpg)|*.Jpg';
  if RzOpenDialog1.Execute then
  begin
    ed_EmpImg.Text :=  RzOpenDialog1.FileName;
    if FileExists(ed_EmpImg.Text) then
    Image1.Picture.LoadFromFile(ed_EmpImg.Text);
  end;
end;

procedure TfmEmploy.btn_UpdateClick(Sender: TObject);
begin
  State := 'UPDATE';

  FormEnable(State);
  ButtonEnable(State);


  L_OldCardNo := ed_CardNo.Text ;
//  pn_EmployUpdateMode;
end;

procedure TfmEmploy.pn_EmployUpdateMode;
begin
  ed_sEmpNM.Enabled := True;
  cmb_sCompany.Enabled := True;
  cmb_sDepart.Enabled := True;
  cmb_sPosi.Enabled := True;
  ed_sCompanyPhone.Enabled := True;
  dt_sJoinDt.Enabled := True;
  dt_sRetireDt.Enabled := True;
  ed_sZipcode.Enabled := True;
  btn_ZipcodeSearch.Enabled := True;
  ed_sAddr1.Enabled := True;
  ed_sAddr2.Enabled := True;
  ed_sHomePhone.Enabled := True;
  ed_sHandphone.Enabled := True;
  chk_CardReg.Enabled := True;
  if chk_CardReg.Checked then cmb_ComPort.Enabled := True;
  cmb_RegGubun.Enabled := True;
  ed_CardNo.Enabled := True;
  btn_Image.Enabled := True;

end;

procedure TfmEmploy.btn_DeleteClick(Sender: TObject);
var
  bCardDelete : Boolean;
  bResult : Boolean;
  stCompanyCode : string;
begin
  if (Application.MessageBox(PChar('데이터를 삭제하시겠습니까?'),'삭제',MB_OKCANCEL) = ID_CANCEL)  then Exit;
  if (Application.MessageBox(PChar('근태 자료 삭제시 출입카드도 삭제 됩니다. 정말 삭제 하시겠습니까?'),'삭제',MB_OKCANCEL) = ID_CANCEL)  then Exit;

  UpdateTB_ATCARD(L_OldCardNo,'N','N');

  if ed_PassNo.Text <> '' then DeleteTB_CARD(ed_PassNo.Text);
  bCardDelete := True;
  if ed_CardNo.Text <> '' then
  begin
    if (Application.MessageBox(PChar('카드데이터(' + ed_CardNo.Text + ')를 삭제하시겠습니까?' ),'삭제',MB_OKCANCEL) = ID_OK)  then  DeleteTB_CARD(ed_CardNo.Text);
  end else bCardDelete := False;

  if cmb_sCompany.ItemIndex < 0 then stCompanyCode := ''
  else stCompanyCode := sCompanyCodeList.Strings[cmb_sCompany.ItemIndex];
  bResult := DeleteTB_EMPLOYEE(ed_sEmpNo.Text,stCompanyCode,ed_CardNo.Text);

  if Not bResult then Exit;
  DeleteTB_BASEPAY(stCompanyCode,ed_sEmpNo.Text,'001');
  DeleteTB_ATEMPEXTRA(stCompanyCode,ed_sEmpNo.Text);

  ShowEmployee('');

end;

function TfmEmploy.DeleteTB_CARD(aCardNo: string): Boolean;
var
  stSql : string;
  bResult : Boolean;
begin
  Result := False;
  if aCardNo = '' then Exit;
  bResult := UpdateTB_DEVICECARDNO(aCardNo,'N'); //모든 카드 권한을 삭제 처리함
  if Not bResult then Exit;

  stSql := 'Delete From TB_CARD ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' +  aCardNo + ''' ';

  with DataModule1.GetObject.ADOExecQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      EXECSQL;
    Except
      showmessage('카드 데이터를 삭제하는데 실패하였습니다.');
      Exit;
    End;
  end;
  Result := True;
end;

function TfmEmploy.UpdateTB_DEVICECARDNO(aCardNo,
  aPermit: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Update TB_DEVICECARDNO Set ';
  stSql := stSql + ' DE_PERMIT = ''' + aPermit + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  with DataModule1.GetObject.ADOExecQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      EXECSQL;
    Except
      showmessage('카드 권한 변경에 실패하였습니다.');
      Exit;
    End;

  end;
  result := True;
end;

function TfmEmploy.DeleteTB_EMPLOYEE(aEmpID,
  aCompanyCode,aCardNo: string): Boolean;
var
  stSql : string;
  stFdmsId : string;
begin
  Result := False;

  stFdmsId := GetEmployeeFdmsID(aCompanyCode,aEmpID);
  stSql := CommonSql.InsertIntoTB_EMPHIS(aCompanyCode,aEmpID,stFdmsId,'3',aCardNo,'2','','','','','','');//삭제
  result := DataModule1.ProcessExecSQL(stSql);

  stSql := 'Delete From TB_EMPLOYEE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' +  aEmpID + ''' ';
  if (aCompanyCode <> '') and (aCompanyCode <> '000') then
  begin
    stSql := stSql + ' AND CO_COMPANYCODE = ''' +  aCompanyCode + ''' ';
  end;

  with DataModule1.GetObject.ADOExecQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      EXECSQL;
    Except
      showmessage('사원 데이터를 삭제하는데 실패하였습니다.');
      Exit;
    End;
  end;
  Result := True;
end;

procedure TfmEmploy.btn_SaveClick(Sender: TObject);
var
  stDepartCode : string;
  stCompanyCode : string;
  stJijumCode : string;
  stPosiCode : string;
  bResult : Boolean;
  stATCode : string;
  stFdmsId : string;
  stWorkType : string;
begin
  if Trim(ed_sEmpNo.Text) = '' then
  begin
    Showmessage('사번이 등록되지 않았습니다.');
    ed_sEmpNo.SetFocus;
    Exit;
  end;

  stDepartCode := '000';
  stCompanyCode := '000';
  stJijumCode := '000';
  stPosiCode := '000';
  stATCode := '000';
  stWorkType := '001';
  if cmb_WorkerType.itemindex < 0 then cmb_WorkerType.itemindex := 0;
  if ChangATType = 3 then stWorkType := WorkTypeCode.Strings[cmb_WorkerType.itemindex];
  if cmb_sCompany.ItemIndex > 0 then stCompanyCode := copy(sCompanyCodeList.Strings[cmb_sCompany.itemIndex],1,3);
  if cmb_sJijum.ItemIndex > 0 then stJijumCode := copy(sJijumCodeList.Strings[cmb_sJijum.itemIndex],4,3);
  if cmb_sDepart.ItemIndex > 0 then  stDepartCode := copy(sDepartCodeList.Strings[cmb_sDepart.itemIndex],7,3);
  if cmb_sPosi.ItemIndex > 0 then  stPosiCode := copy(sPosiCodeList.Strings[cmb_sPosi.ItemIndex],4,3);
  if cmb_sPosi.ItemIndex > 0 then  stATCode := ATTypeCodeList.Strings[cmb_AtType.ItemIndex];

  if UpperCase(State) = 'INSERT' then
  begin
    stFdmsId := GetFdmsID;
    bResult := InsertTB_EMPLOYEE(ed_sEmpNo.Text,ed_sEmpNM.Text,stCompanyCode,stJijumCode,
                                 stDepartCode,stPosiCode,ed_sCompanyPhone.text,
                                 FormatDateTime('yyyymmdd',dt_sJoinDt.Date),FormatDateTime('yyyymmdd',dt_sRetireDt.Date),
                                 ed_sZipcode.Text,ed_sAddr1.Text,ed_sAddr2.Text,ed_sHomePhone.Text,ed_sHandphone.Text,
                                 intTostr(cmb_RegGubun.ItemIndex),ed_CardNo.Text,ed_EmpImg.Text,
                                 stATCode,inttostr(cmb_PayGubun.ItemIndex),ed_payAmt.text,ed_PassNo.text,stFdmsId,stWorkType);
    if bResult then
    begin
      if chk_AutoSabun.Checked then inc(AutoSabun);
    end;
  end  else if UpperCase(State) = 'UPDATE' then
    bResult := UpdateTB_EMPLOYEE(ed_sEmpNo.Text,ed_sEmpNM.Text,stCompanyCode,stJijumCode,
                                 stDepartCode,stPosiCode,ed_sCompanyPhone.text,
                                 FormatDateTime('yyyymmdd',dt_sJoinDt.Date),FormatDateTime('yyyymmdd',dt_sRetireDt.Date),
                                 ed_sZipcode.Text,ed_sAddr1.Text,ed_sAddr2.Text,ed_sHomePhone.Text,ed_sHandphone.Text,
                                 intTostr(cmb_RegGubun.ItemIndex),ed_CardNo.Text,ed_EmpImg.Text,
                                 stATCode,inttostr(cmb_PayGubun.ItemIndex),ed_payAmt.text,ed_PassNo.text,stWorkType);

  TB_ATEMPEXTRAInsert(stCompanyCode,ed_sEmpNo.Text,inttostr(rg_ExtraType.ItemIndex),
                      ed_WEarlyAmt.Text,ed_WExtendAmt.Text,ed_WNightAmt.Text,
                      ed_SEarlyAmt.Text,ed_SExtendAmt.Text,ed_SNightAmt.Text,
                      ed_HEarlyAmt.Text,ed_HExtendAmt.Text,ed_HNightAmt.Text);

  if G_bATtendPrivateServer then
  begin
    if ed_CardNo.Text <> '' then
    begin
      if cmb_RegGubun.ItemIndex = 1 then
      begin
        //여기에서 전체권한을 모두 부여하자.
        DeleteTB_DEVICECARDNO_Cardno(ed_CardNo.Text); //권한 테이블에서 해당 카드 권한 전체 삭제
        InsertTB_DEVICECARDNO_AllAtGrade(ed_CardNo.Text);
      end;
    end;
  end;
  if cmb_RegGubun.ItemIndex <> 1 then //정상등록 상태가 아니면
    UpdateTB_DEVICECARDNO(ed_CardNo.Text,'N');

  if Not bResult then
  begin
    showmessage('데이터 저장에 실패하였습니다.');
    Exit;
  end;
  ShowEmployee(stCompanyCode + ed_sEmpNo.Text,sg_Employ.TopRow);

end;

function TfmEmploy.InsertTB_EMPLOYEE(aEmpID, aEmpNM, aCompanyCode,aJijumCode,
  aDepartCode, aPosiCod, aCompanyPhone, aJoinDate, aRetireDate, aZipcode,
  aAddr1, aAddr2, aHomePhone, aHandphone, aRegGubun, aCardNo,
  aEmpImg,aATCode,aPayGubun,apayAmt,aPassNo,afdmsID,aWorkType: string): Boolean;
var
  stSql : string;
  bResult : Boolean;
  stMode : string;
  stCompanyCode,stEmCode : string;
  stImg : string;
begin
  Result := False;
  bResult := False;
  bResult := CheckTB_EMPLOYEE(aEmpID,aCompanyCode);
  if bResult then
  begin
    showmessage('이미 등록되어 있는 사번입니다. 사번을 확인하여 주세요.');
    ed_sEmpNo.SetFocus;
    Exit;
  end;

  if aPassNo <> '' then
  begin
    if Not CheckTB_CARD(aPassNo,stCompanyCode,stEmCode,'1',stMode) then
    begin
      Exit;
    end;
    if Not IsDigit(aPassNo) then
    begin
      showmessage('비밀번호는 숫자로만 등록 되어야 합니다.');
      Exit;
    end;
    if stMode = 'Insert' then  bResult := InsertTB_CARD(aPassNo,'1','1',aEmpID,aCompanyCode)
    else if stMode = 'Update' then bResult := UpdateTB_CARD(aPassNo,'1','1',aEmpID,aCompanyCode);
    if CheckTB_ATCARD(aPassNo) then UpdateTB_ATCARD(aPassNo,'Y','N')
    else InsertTB_ATCARD(aPassNo,'Y','N');
//    if CheckTB_ATPASS(aPassNo) then UpdateTB_ATPASS(aPassNo,'Y','N')
//    else InsertTB_ATPASS(aPassNo,'Y','N');
  end;

  bResult := False;
  if Length(aCardNo) <> 0 then
  begin
    bResult := CheckTB_CARD(aCardNo,aCompanyCode,aEmpID,aRegGubun,stMode);
  end;
  if bResult then //카드번호 입력하자.
  begin
    if stMode = 'Insert' then  bResult := InsertTB_CARD(aCardNo,'1',aRegGubun,aEmpID,aCompanyCode)
    else if stMode = 'Update' then bResult := UpdateTB_CARD(aCardNo,'1',aRegGubun,aEmpID,aCompanyCode);

    //여기에서 TB_ATCARD INSERT
    if Not bResult then
    begin
      showmessage('카드등록에 실패하였습니다.관리자에게 문의 주세요.');
      Exit;
    end;

    if CheckTB_ATCARD(aCardNo) then UpdateTB_ATCARD(aCardNo,'Y','N')
    else InsertTB_ATCARD(aCardNo,'Y','N');
  end;


  aPayAmt := StringReplace(aPayAmt,',','',[rfReplaceAll]);
  if CheckTB_BASEPAY(aCompanyCode,aEmpID,'001') then
      UpdateTB_BASEPAY(aCompanyCode,aEmpID,'001',aPayGubun,apayAmt)
  else InsertTB_BASEPAY(aCompanyCode,aEmpID,'001',aPayGubun,apayAmt);

  stSql := 'Insert Into TB_EMPLOYEE(';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'EM_CODE,';
  stSql := stSql + 'CO_COMPANYCODE,';
  stSql := stSql + 'CO_JIJUMCODE,';
  stSql := stSql + 'CO_DEPARTCODE,';
  stSql := stSql + 'PO_POSICODE,';
  stSql := stSql + 'EM_NAME,';
  stSql := stSql + 'EM_COPHONE,';
  stSql := stSql + 'EM_HOMEPHONE,';
  stSql := stSql + 'EM_HANDPHONE,';
  stSql := stSql + 'ZI_ZIPCODE,';
  stSql := stSql + 'EM_ADDR1,';
  stSql := stSql + 'EM_ADDR2,';
  stSql := stSql + 'EM_JOINDATE,';
  stSql := stSql + 'EM_RETIREDATE,';
  if FileExists(aEmpImg) then
  begin
    stSql := stSql + 'EM_IMAGE,';
  end;
  stSql := stSql + 'AT_ATCODE,';
  stSql := stSql + 'EM_PASS,';
  stSql := stSql + 'EM_UPDATETIME,';
  stSql := stSql + 'FDMS_ID,';
  stSql := stSql + 'FDMS_RELAY,';
  stSql := stSql + 'AW_CODE,';
  stSql := stSql + 'EM_UPDATEOPERATOR ) ';
  stSql := stSql + 'VALUES ( ';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aEmpID + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aJijumCode + ''',';
  stSql := stSql + '''' + aDepartCode + ''',';
  stSql := stSql + '''' + aPosiCod + ''',';
  stSql := stSql + '''' + aEmpNM + ''',';
  stSql := stSql + '''' + aCompanyPhone + ''',';
  stSql := stSql + '''' + aHomePhone + ''',';
  stSql := stSql + '''' + aHandphone + ''',';
  stSql := stSql + '''' + aZipcode + ''',';
  stSql := stSql + '''' + aAddr1 + ''',';
  stSql := stSql + '''' + aAddr2 + ''',';
  stSql := stSql + '''' + aJoinDate + ''',';
  stSql := stSql + '''' + aRetireDate + ''',';
  if FileExists(aEmpImg) then
  begin
    stSql := stSql + ':EM_IMAGE,';
  end;
  stSql := stSql + '''' + aATCode + ''',';
  stSql := stSql + '''' + aPassNo + ''',';
  stSql := stSql + '''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',';
  stSql := stSql + afdmsID + ',';
  stSql := stSql + '''N'',';
  stSql := stSql + '''' + aWorkType + ''',';
  stSql := stSql + '''' + Master_ID + ''' )';

  with DataModule1.ADOExecQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    if DBType = 'MSSQL' then
    begin
      if FileExists(aEmpImg) then
        Parameters.ParamByName( 'EM_IMAGE' ).LoadFromFile( aEmpImg, ftGraphic );
    end else
    begin
      if FileServerPath = '' then
      begin
        showmessage('파일서버 Path가 지정되지 않았습니다. 환경설정에서 파일서버 Path를 지정하세요.');
        Exit;
      end;
      if FileExists(aEmpImg) then
      begin
        if copy(FileServerPath,length(FileServerPath),1) = '\' then stImg := FileServerPath + aCompanyCode + aEmpID + '.jpg'
        else stImg := FileServerPath + '\' + aCompanyCode + aEmpID + '.jpg';
        if aEmpImg <> stImg then
          FileCtrl.CopyFiles(aEmpImg,stImg);
        Parameters.ParamByName( 'EM_IMAGE' ).Value := stImg;
      end;
    end;
    Try
      ExecSQL;
    Except
      Exit;
    End;

  end;                                                     
  stSql := CommonSql.InsertIntoTB_EMPHIS(aCompanyCode,aEmpID,afdmsID,'1',aCardNo,aRegGubun,
                                         aEmpNM,aHandphone,cmb_sCompany.text,cmb_sJijum.text,cmb_sDepart.text,
                                         cmb_sPosi.text);//입력
  result := DataModule1.ProcessExecSQL(stSql);

  Result := True;

end;

function TfmEmploy.UpdateTB_EMPLOYEE(aEmpID, aEmpNM, aCompanyCode,aJijumCode,
  aDepartCode, aPosiCod, aCompanyPhone, aJoinDate, aRetireDate, aZipcode,
  aAddr1, aAddr2, aHomePhone, aHandphone, aRegGubun, aCardNo,
  aEmpImg,aATCode,aPayGubun,apayAmt,aPassNo,aWorkType: string): Boolean;
var
  stMsg : string;
  bResult : Boolean;
  stMode : string;
  stSql : string;
  stCompanyCode,stEmCode:string;
  stImage:string;
  stFdmsID : string;
begin
  Result := False;


  if (Trim(L_OldPassNo) <> aPassNo) then
  begin
    if L_OldPassNo <> '' then
    begin
      UpdateTB_ATCARD(L_OldPassNo,'N','N');  //기존 비밀번호 삭제
      DeleteTB_CARD(L_OldPassNo);
    end;
    if aPassNo <> '' then
    begin
      if Not CheckTB_CARD(aPassNo,aCompanyCode,aEmpID,'1',stMode) then
      begin
        Exit;
      end;
      if Not IsDigit(aPassNo) then
      begin
        showmessage('비밀번호는 숫자로만 등록 되어야 합니다.');
        Exit;
      end;
      if stMode = 'Insert' then  bResult := InsertTB_CARD(aPassNo,'1','1',aEmpID,aCompanyCode)
      else if stMode = 'Update' then bResult := UpdateTB_CARD(aPassNo,'1','1',aEmpID,aCompanyCode);
      if CheckTB_ATCARD(aPassNo) then UpdateTB_ATCARD(aPassNo,'Y','N')
      else InsertTB_ATCARD(aPassNo,'Y','N');
    end;
  end;

  if (Trim(L_OldCardNo) <> '') and (Trim(L_OldCardNo) <> aCardNo) then
  begin
    stMsg := '(' + L_OldCardNo + ')카드번호 에서 (' +
        aCardNo + ') 으로 변경되었습니다. ' + #13 +
        '(' + L_OldCardNo + ')를 삭제 하시겠습니까 ';
    //if (Application.MessageBox(PChar(stMsg),'변경',MB_OKCANCEL) = ID_OK)  then
    //begin
      bResult := DeleteTB_CARD(L_OldCardNo);
      if Not bResult then showmessage(L_OldCardNo + ' 삭제에 실패하였습니다. 카드관리를 이용하여 삭제 하여 주세요.');
    //end;
    UpdateTB_ATCARD(L_OldCardNo,'N','N');
    //이벤트 데이터 변경
    //UpdateTB_ACCESSEVENTCARDNO(L_OldCardNo,aCardNo);
    //UpdateTB_ATEVENTCARDNO(L_OldCardNo,aCardNo);
    //UpdateTB_FoodEventCARDNO(L_OldCardNo,aCardNo);

    bResult := False;
    bResult := CheckTB_CARD(aCardNo,aCompanyCode,aEmpID,aRegGubun,stMode);
    if bResult then //카드번호 입력하자.
    begin
      if stMode = 'Insert' then  bResult := InsertTB_CARD(aCardNo,'1',aRegGubun,aEmpID,aCompanyCode)
      else if stMode = 'Update' then bResult := UpdateTB_CARD(aCardNo,'1',aRegGubun,aEmpID,aCompanyCode);

      if Not bResult then
      begin
        showmessage('카드등록에 실패하였습니다.관리자에게 문의 주세요.');
        Exit;
      end;
      if CheckTB_ATCARD(aCardNo) then UpdateTB_ATCARD(aCardNo,'Y','N')
      else InsertTB_ATCARD(aCardNo,'Y','N');
    end;
  end else
  begin
    bResult := False;
    bResult := CheckTB_CARD(aCardNo,aCompanyCode,aEmpID,aRegGubun,stMode);
    if bResult then //카드번호 입력하자.
    begin
      if stMode = 'Insert' then  bResult := InsertTB_CARD(aCardNo,'1',aRegGubun,aEmpID,aCompanyCode)
      else if stMode = 'Update' then bResult := UpdateTB_CARD(aCardNo,'1',aRegGubun,aEmpID,aCompanyCode);

      if Not bResult then
      begin
        showmessage('카드등록에 실패하였습니다.관리자에게 문의 주세요.');
        Exit;
      end;
    end;
    if CheckTB_ATCARD(aCardNo) then UpdateTB_ATCARD(aCardNo,'Y','N')
    else InsertTB_ATCARD(aCardNo,'Y','N');
  end;

  aPayAmt := StringReplace(aPayAmt,',','',[rfReplaceAll]);
  if CheckTB_BASEPAY(aCompanyCode,aEmpID,'001') then
      UpdateTB_BASEPAY(aCompanyCode,aEmpID,'001',aPayGubun,apayAmt)
  else InsertTB_BASEPAY(aCompanyCode,aEmpID,'001',aPayGubun,apayAmt);

  stSql := 'Update TB_EMPLOYEE Set ';
  stSql := stSql + 'CO_JIJUMCODE = ''' + aJijumCode + ''',';
  stSql := stSql + 'CO_DEPARTCODE = ''' + aDepartCode + ''',';
  stSql := stSql + 'PO_POSICODE = ''' + aPosiCod + ''',';
  stSql := stSql + 'EM_NAME = ''' + aEmpNM + ''',';
  stSql := stSql + 'EM_COPHONE = ''' + aCompanyPhone + ''',';
  stSql := stSql + 'EM_HOMEPHONE = ''' + aHomePhone + ''',';
  stSql := stSql + 'EM_HANDPHONE = ''' + aHandphone + ''',';
  stSql := stSql + 'ZI_ZIPCODE = ''' + aZipcode + ''',';
  stSql := stSql + 'EM_ADDR1 = ''' + aAddr1 + ''',';
  stSql := stSql + 'EM_ADDR2 = ''' + aAddr2 + ''',';
  stSql := stSql + 'EM_JOINDATE = ''' + aJoinDate + ''',';
  stSql := stSql + 'EM_RETIREDATE = ''' + aRetireDate + ''',';
  stSql := stSql + 'AT_ATCODE = ''' + aATCode + ''',';
  stSql := stSql + 'EM_PASS = ''' + aPassNo + ''',';
  stSql := stSql + 'AW_CODE = ''' + aWorkType + ''',';
  stSql := stSql + 'EM_UPDATETIME = ''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',';
  stSql := stSql + 'EM_UPDATEOPERATOR = ''' + Master_ID + ''' ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmpID + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';


  with DataModule1.ADOExecQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      ExecSQL;
    Except
      Exit;
    End;

    if FileExists(aEmpImg) then
    begin
      if DBTYPE = 'MSSQL' then
      begin
        stSql := 'Update TB_EMPLOYEE Set ';
        stSql := stSql + 'EM_IMAGE = :EM_IMAGE ';
        stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
        stSql := stSql + ' AND EM_CODE = ''' + aEmpID + '''';
        stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';

        Close;
        Sql.Clear;
        Sql.Text := stSql;
        Parameters.ParamByName( 'EM_IMAGE' ).LoadFromFile( aEmpImg, ftGraphic );
      end else
      begin
        if FileServerPath = '' then
        begin
          showmessage('파일서버 Path가 지정되지 않았습니다. 환경설정에서 파일서버 Path를 지정하세요.');
          Exit;
        end;
        if FileExists(aEmpImg) then
        begin
          if copy(FileServerPath,length(FileServerPath),1) = '\' then stImage := FileServerPath + aCompanyCode + aEmpID + '.jpg'
          else stImage := FileServerPath + '\' + aCompanyCode + aEmpID + '.jpg';
          if aEmpImg <> stImage then
            FileCtrl.CopyFiles(aEmpImg,stImage);
          if DBTYPE = 'PG' then
            stImage := stringReplace(stImage,'\','\\',[rfReplaceAll]);
          stSql := 'Update TB_EMPLOYEE Set ';
          stSql := stSql + 'EM_IMAGE = ''' + stImage + ''' ';
          stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
          stSql := stSql + ' AND EM_CODE = ''' + aEmpID + '''';
          stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';

          Close;
          Sql.Clear;
          Sql.Text := stSql;
        end;
      end;
      Try
        ExecSQL;
      Except
        Exit;
      End;
    end;

  end;

  stFdmsID := GetEmployeeFdmsID(aCompanyCode,aEmpID);                   
  stSql := CommonSql.InsertIntoTB_EMPHIS(aCompanyCode,aEmpID,stFdmsID,'2',aCardNo,aRegGubun,
                                         aEmpNM,aHandphone,cmb_sCompany.text,cmb_sJijum.text,
                                         cmb_sDepart.text,cmb_sPosi.text);//수정
  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmEmploy.CheckTB_CARD(aCardNo, aCompanyCode,
  aEmpID,aCardType: string;var Mode:string): Boolean;
var
  stSql : string;
  stMsg : string;
  TempAdoQuery : TADOQuery;
begin
  Result := True;
  Mode := '';
  stSql := 'Select * from TB_CARD ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = '''  + aCardNo + ''' ';

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
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;

    Mode := 'Insert';
    if RecordCount < 1 then
    begin
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    end;

    Mode := 'Update';

    if (FindField('CO_COMPANYCODE').AsString = aCompanyCode) AND
       (FindField('EM_CODE').AsString = aEmpID) then
    begin
      if FindField('CA_CARDTYPE').AsString = aCardType then  Result := False
      else Result := True;
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    end;
    
    stMsg := '(' + aCardNo + ')카드번호는 사번(' +
        FindField('EM_CODE').AsString + ') 으로 등록되어 있습니다. ' + #13 +
        '사번 (' + aEmpID + ') 으로 변경하시겠습니까? ';

    if (Application.MessageBox(PChar(stMsg),'변경',MB_OKCANCEL) = ID_CANCEL)  then
    begin
      Result := False;
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;

end;

function TfmEmploy.InsertTB_CARD(aCardNo, aCardGubun, aCardType, aEmpID,
  aCompanyCode: string): Boolean;
var
  stSql : string;
  nPositionNum : integer;
begin
  if Length(aCardNo) = 0 then Exit;
  if Not IsDigit(aCardGubun) then aCardGubun := '1';

  nPositionNum := GetMaxPositionNum;

  Result := False;
  Result := False;
  stSql := 'Insert Into TB_CARD(GROUP_CODE,CA_CARDNO,CA_GUBUN,CA_CARDTYPE,';
  stSql := stSql + 'EM_CODE,CO_COMPANYCODE,CA_UPDATETIME,POSITIONNUM,CA_UPDATEOPERATOR) ';
  stSql := stSql + ' Values ( ';
  stSql := stSql + '''' +  GROUPCODE + ''',';
  stSql := stSql + '''' + aCardNo + ''',' ;
  stSql := stSql + '''' + aCardGubun + ''',' ;
  stSql := stSql + '''' + aCardType + ''',' ;
  stSql := stSql + '''' + aEmpID + ''',' ;
  stSql := stSql + '''' + aCompanyCode + ''',' ;
  stSql := stSql + '''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',' ;
  stSql := stSql + inttostr(nPositionNum) + ',' ;
  stSql := stSql + '''' + MASTER_ID + ''')' ;

  result := DataModule1.ProcessExecSQL(stSql);
{
  stSql := 'Insert Into TB_CARD(GROUP_CODE,CA_CARDNO,CA_GUBUN,CA_CARDTYPE,';
  stSql := stSql + 'EM_CODE,CO_COMPANYCODE,CA_UPDATETIME,CA_UPDATEOPERATOR) ';
  stSql := stSql + ' Values ( ';
  stSql := stSql + '''' +  GROUPCODE + ''',';
  stSql := stSql + '''' + aCardNo + ''',' ;
  stSql := stSql + '''' + aCardGubun + ''',' ;
  stSql := stSql + '''' + aCardType + ''',' ;
  stSql := stSql + '''' + aEmpID + ''',' ;
  stSql := stSql + '''' + aCompanyCode + ''',' ;
  stSql := stSql + '''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',' ;
  stSql := stSql + '''' + MASTER_ID + ''')' ;

  with DataModule1.ADOExecQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      ExecSql;
    Except
      Exit;
    End;
  end;
  Result := True; }
end;

function TfmEmploy.UpdateTB_CARD(aCardNo, aCardGubun, aCardType, aEmpID,
  aCompanyCode: string): Boolean;
var
  stSql : string;
begin
  if Length(aCardNo) <> 10 then Exit;

  Result := False;
  stSql := 'Update TB_CARD SET ' ;
  stSql := stSql + ' CA_GUBUN = ''' +  aCardGubun + ''',';
  stSql := stSql + ' CA_CARDTYPE = ''' +  aCardType + ''',';
  stSql := stSql + ' EM_CODE = ''' +  aEmpID + ''',';
  stSql := stSql + ' CO_COMPANYCODE = ''' +  aCompanyCode + ''',';
  stSql := stSql + ' CA_UPDATETIME = ''' +  FormatDateTime('yyyymmddHHMMSS',Now) + ''',';
  stSql := stSql + ' CA_UPDATEOPERATOR = ''' +  MASTER_ID + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' +  GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' +  aCardNo + ''' ';

  with DataModule1.ADOExecQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      ExecSql;
    Except
      Exit;
    End;
  end;
  Result := True;
end;

function TfmEmploy.CheckTB_EMPLOYEE(aEmpID, aCompanyCode: string): Boolean;
var
  stSql: string;
  TempAdoQuery : TADOQuery;
begin
  Result := False;
  stSql := 'select * from TB_EMPLOYEE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmpID + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' +  aCompanyCode + ''' ';

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
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;
    if RecordCount > 0 then Result := True;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

procedure TfmEmploy.chk_CardRegClick(Sender: TObject);
var
  nCount : integer;
  i : integer;
  stTemp : string;
begin
  if chk_CardReg.Checked then
  begin
    ComPortList.Clear;
    nCount := GetSerialPortList(ComPortList);
    cmb_ComPort.Clear;
    if nCount = 0 then
    begin
      chk_CardReg.Checked := False;
      showmessage('시리얼 포트를 찾을 수 없습니다. 제어판에서 시리얼 포트를 확인하여 주세요.');
      Exit;
    end;

    for i:= 0 to nCount - 1 do
    begin
      if L_Close then Exit;
      cmb_ComPort.items.Add(ComPortList.Strings[i])
    end;
    cmb_ComPort.ItemIndex := 0;

    try
      ApdDataPacket1.AutoEnable := false;
      ApdDataPacket1.StartCond := scString;
      ApdDataPacket1.StartString := #$02;
      ApdDataPacket1.EndCond := [ecString];
      ApdDataPacket1.EndString := #$03;
      ApdDataPacket1.Timeout := 0;
      ReaderPort.ComNumber := Integer(ComPortList.Objects[cmb_ComPort.ItemIndex]);
      //ReaderPort.ComNumber := strtoint(copy(cmb_ComPort.text,4,Pos(':',cmb_ComPort.text) -4));
      ReaderPort.Open := true;
      ApdDataPacket1.Enabled := True;
    except
      MessageDlg('통신포트를 확인해 주세요', mtError, [mbOK], 0);
      chk_CardReg.Checked:= False;
      Exit;
    end;
    cmb_ComPort.Enabled := True;
    
  end else
  begin
    if ReaderPort.Open then
    begin
      ApdDataPacket1.Enabled := False;
      ReaderPort.Open:= False;
    end;

  end;

end;

procedure TfmEmploy.btn_ZipcodeSearchClick(Sender: TObject);
begin
  fmZipCode:= TfmZipCode.Create(Self);
  fmZipCode.CallingModuleID := 'TfmEmploy';
  fmZipCode.SHowmodal;
  fmZipCode.Free;

end;

procedure TfmEmploy.CommandArrayCommandsTCommand0Execute(Command: TCommand;
  Params: TStringList);
var
  stZipCode,stSido,stGuGun,stDong,stBunji : string;
  stAddr1 : string;
begin
  stZipCode := Params.Values['Code'];
  stSido  := Params.Values['Sido'];
  stGuGun := Params.Values['Gugun'];
  stDong  := Params.Values['Dong'];
  stBunji := Params.Values['Bunji'];
  stAddr1 := stSido + ' ' + stGuGun + ' ' + stDong ;
  ed_sZipcode.Text := stZipCode;
  ed_sAddr1.Text := stAddr1;
  ed_sAddr2.Text := Trim(stBunji);
  ed_sAddr2.SetFocus;
end;

function TfmEmploy.GetSerialPortList(List: TStringList;
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
  if L_Close then Exit;
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

function TfmEmploy.DecodeCommportName(PortName: String): WORD;
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

function TfmEmploy.EncodeCommportName(PortNum: WORD): String;
begin
 if PortNum < 10
    then Result := 'COM' + IntToStr(PortNum) + ':'
    else Result := '\\.\COM'+IntToStr(PortNum);

end;

procedure TfmEmploy.cmb_ComPortChange(Sender: TObject);
begin
  if rg_CardReader.ItemIndex = 0 then
  begin
    ReaderPort.Open := False;
    if cmb_ComPort.text = '' then Exit;
    ReaderPort.ComNumber := Integer(ComPortList.Objects[cmb_ComPort.ItemIndex]);
    //ReaderPort.ComNumber := strtoint(copy(cmb_ComPort.text,4,Pos(':',cmb_ComPort.text) -4));
    ReaderPort.Open := true;
  end;
end;

procedure TfmEmploy.ApdDataPacket1StringPacket(Sender: TObject;
  Data: String);
begin
  if rg_CardReader.ItemIndex <> 0 then Exit;
  if L_Close then Exit;
  RcvCardDataByReader(Data);
  ApdDataPacket1.Enabled := True;

end;

procedure TfmEmploy.RcvCardDataByReader(aData: String);
var
  aIndex: Integer;
  aCardNo:String;
  bCardNo: int64;
  stMsg : string;
  stReaderType : string;
begin
  //STX 삭제
  aIndex:= Pos(#$2,aData);
  if aIndex > 0 then Delete(aData,aIndex,1);
  //ETX삭제
  aIndex:= Pos(#$3,aData);
  if aIndex > 0 then Delete(aData,aIndex,1);
  if aData = 'F' then    //포맷 요청
  begin
    stReaderType := 'C';
    if G_nSpecialProgram = 1 then stReaderType := 'K';
    CardReaderFormatChange(stReaderType);
    Exit;
  end;
  if (aData = 'Y') OR (aData = 'N') then Exit;

  aCardNo := aData;
  if CARDLENGTHTYPE = 0 then  //고정길이 타입이면
  begin
    if IsNumericCardNo then  //숫자변환이면
    begin
      if G_nSpecialProgram = 3 then  //KTTELECOP 스피드게이트용 3자리만 사용.
      begin
        bCardNo:= Hex2Dec64(copy(aData,1,6) + '00');
        aCardNo := inttostr(bCardNo);
      end else
      begin
        bCardNo:= Hex2Dec64(aData);
        aCardNo := inttostr(bCardNo);
      end;
    end;
  end
  else
  begin
    if CARDLENGTHTYPE = 1 then
    begin
      if IsNumericCardNo then  //숫자변환이면
      begin
        bCardNo:= Hex2Dec64(aData);
        aCardNo := inttostr(bCardNo);
      end;
    end else if CARDLENGTHTYPE = 2 then
    begin
      aCardNo := aCardNo;  //ASCII 로 데이터를 받으니까 그냥 처리
    end;
  end;

  if (CARDLENGTHTYPE = 0) and IsNumericCardNo then  //고정이며 숫자변환이면
     aCardNo:= FillZeroNumber2(bCardNo,10);

  aCardNo := GetFixedCardNoCheck(aCardNo,G_bCardFixedUse,G_stCardFixedFillChar,G_nCardFixedPosition,G_nCardFixedLength);


  {
  bCardNo:= Hex2Dec64(aData);
  aCardNo:= FillZeroNumber2(bCardNo,10);  }
  if Trim(ed_CardNo.Text) <> '' then
  begin
    stMsg := '(' + ed_CardNo.Text + ')카드번호가 존재 합니다. (' +
        aCardNo + ') 으로 변경하시겠습니까? ' ;
    if Trim(ed_CardNo.Text) <> aCardNo then
    begin
      if (Application.MessageBox(PChar(stMsg),'변경',MB_OKCANCEL) = ID_CANCEL)  then Exit;
    end;
  end;
  ed_CardNo.Text := aCardNo;

end;

procedure TfmEmploy.cmb_DepartChange(Sender: TObject);
begin
  btn_SearchClick(Self);
end;

procedure TfmEmploy.cmb_PosiChange(Sender: TObject);
begin
  btn_SearchClick(Self);
end;

procedure TfmEmploy.ed_EmpNoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    btn_SearchClick(Self);
  end;
end;

procedure TfmEmploy.ed_EmpNMKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    btn_SearchClick(Self);
  end;

end;


procedure TfmEmploy.ed_sEmpNoExit(Sender: TObject);
var
  stSql : string;
  MapJpg : TJpegImage;
  MapStream : TMemoryStream;
  BlobField : TBlobField;
  stTemp : string;
  i:integer;
  nIndex : integer;
begin
  stSql := 'select * from TB_EMPLOYEE   ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + ed_sEmpNo.text + ''' ';

  if cmb_sCompany.ItemIndex < 1 then Exit;
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + sCompanyCodeList.Strings[cmb_sCompany.ItemIndex] + ''' ';

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
    if recordcount < 1 then Exit;
    ed_sEmpNo.Text := '';
    ed_sEmpNo.SetFocus;
    showmessage('중복된 사번이 존재합니다.');
  end;

end;

procedure TfmEmploy.chk_AutoSabunClick(Sender: TObject);
var
  stSql : string;
  stSabun : string;
begin
  if Not chk_AutoSabun.Checked then
  begin
    ed_sEmpNo.Text := '';
    ed_sEmpNo.Enabled := True;
    Exit;
  end;
  ed_sEmpNo.Enabled := False;
  stSql := 'select Max(EM_CODE) as EM_CODE from TB_EMPLOYEE ';
  stSql := stSql + ' where GROUP_CODE = '''  + GROUPCODE + ''' ';
  stSql := stSql + ' AND EM_CODE Like ''Z-%'' ';

  with AdoQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      inc(AutoSabun);
      ed_sEmpNo.Text := 'Z-' + FillZeroNumber(AutoSabun,5);
      Exit;
    End;
    if (recordCount < 1) or (Trim(FindField('EM_CODE').AsString) = '') then
    begin
      inc(AutoSabun);
      ed_sEmpNo.Text := 'Z-' + FillZeroNumber(AutoSabun,5);
      Exit;
    end;
    stSabun := FindField('EM_CODE').AsString;
    stSabun := copy(stSabun,3,Length(stSabun) - 2);
    AutoSabun := strtoint(stSabun) + 1;
    ed_sEmpNo.Text := 'Z-' + FillZeroNumber(AutoSabun,5);

  end;
end;

function TfmEmploy.UpdateTB_ACCESSEVENTCARDNO(OldCardNo,
  aCardNo: string): Boolean;
var
  stSql :string;
begin
  stSql := 'Update TB_ACCESSEVENT set CA_CARDNO = ''' + aCardNo + ''' ';
  stSql := stSql + ' Where CA_CARDNO = ''' + OldCardNo + ''' ';

  result := DataModule1.ProcessEventExecSQL(stSql);

end;

function TfmEmploy.UpdateTB_ATEVENTCARDNO(OldCardNo,
  aCardNo: string): Boolean;
var
  stSql :string;
begin
  stSql := 'Update TB_ATEVENT set CA_CARDNO = ''' + aCardNo + ''' ';
  stSql := stSql + ' Where CA_CARDNO = ''' + OldCardNo + ''' ';

  result := DataModule1.ProcessEventExecSQL(stSql);

end;

function TfmEmploy.UpdateTB_FoodEventCARDNO(OldCardNo,
  aCardNo: string): Boolean;
var
  stSql :string;
begin
  stSql := 'Update TB_FoodEvent set CA_CARDNO = ''' + aCardNo + ''' ';
  stSql := stSql + ' Where CA_CARDNO = ''' + OldCardNo + ''' ';

  result := DataModule1.ProcessEventExecSQL(stSql);

end;

procedure TfmEmploy.ButtonEnable(aState: string);
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
    if IsInsertGrade then  btn_Insert.Enabled := True;
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
    if IsInsertGrade then  btn_Insert.Enabled := True;
    if IsUpdateGrade then btn_Update.Enabled := True;
    btn_Save.Enabled := False;
    if IsDeleteGrade then btn_Delete.Enabled := True;
    btn_Cancel.Enabled := False;
  end;
end;

procedure TfmEmploy.FormClear;
begin
  ed_sEmpNo.Text := '';
  ed_sEmpNM.Text := '';
  cmb_sCompany.ItemIndex := 0 ;
  cmb_sJijum.Clear;
  sJijumCodeList.Clear;
  cmb_sDepart.Clear;
  sDepartCodeList.Clear;
  cmb_sPosi.ItemIndex := 0;
  ed_sCompanyPhone.Text := '';
  dt_sJoinDt.Date := Now;
  dt_sRetireDt.Date := strToDate('9999-12-30');
  ed_sZipcode.Text := '';
  ed_sAddr1.Text := '';
  ed_sAddr2.Text := '';
  ed_sHomePhone.Text := '';
  ed_sHandphone.Text := '';
  cmb_RegGubun.ItemIndex := 1;
  ed_CardNo.Text := '';
  Image1.Picture.Graphic := Nil;
  ed_EmpImg.Text := '';

  cmb_WorkerType.ItemIndex := 0;
  cmb_AtType.ItemIndex := 0;
  cmb_PayGubun.ItemIndex := 0;
  ed_payAmt.Text := '0';
  ed_PassNo.Text := '';

  ed_WEarlyAmt.Text := '0';
  ed_WExtendAmt.Text := '0';
  ed_WNightAmt.Text := '0';
  ed_SEarlyAmt.Text := '0';
  ed_SExtendAmt.Text := '0';
  ed_SNightAmt.Text := '0';
  ed_HEarlyAmt.Text := '0';
  ed_HExtendAmt.Text := '0';
  ed_HNightAmt.Text := '0';
  PageControl1.ActivePageIndex := 0;
end;

procedure TfmEmploy.FormEnable(aState: string);
begin
  if upperCase(aState) = 'INSERT'  then
  begin
    sg_Employ.Enabled := False;
    if Not chk_AutoSabun.Checked then ed_sEmpNo.Enabled := True;
    chk_AutoSabun.Enabled := True;
    ed_sEmpNM.Enabled := True;
    if (Not IsMaster) and ( strtoint(CompanyGrade) > 1) then cmb_sCompany.Enabled := False
    else cmb_sCompany.Enabled := True;
    if (Not IsMaster) and ( strtoint(CompanyGrade) > 2) then cmb_sJijum.Enabled := False
    else cmb_sJijum.Enabled := True;
    cmb_sDepart.Enabled := True;
    cmb_sPosi.Enabled := True;
    ed_sCompanyPhone.Enabled := True;
    dt_sJoinDt.Enabled := True;
    dt_sRetireDt.Enabled := True;
    ed_sZipcode.Enabled := True;
    btn_ZipcodeSearch.Enabled := True;
    ed_sAddr1.Enabled := True;
    ed_sAddr2.Enabled := True;
    ed_sHomePhone.Enabled := True;
    ed_sHandphone.Enabled := True;
    chk_CardReg.Enabled := True;
    cmb_ComPort.Enabled := True;
    cmb_RegGubun.Enabled := True;
    ed_CardNo.Enabled := True;
    btn_Image.Enabled := True;
    cmb_WorkerType.Enabled := True;
    cmb_AtType.Enabled := True;
    cmb_PayGubun.Enabled := True;
    ed_payAmt.Enabled := True;
    ed_PassNo.Enabled := True;
    gb_sudang.Enabled := True;
    rg_ExtraType.Enabled := True;
    PageControl1.Enabled := True;
    ed_WEarlyAmt.Enabled := True;
    ed_WExtendAmt.Enabled := True;
    ed_WNightAmt.Enabled := True;
    ed_SEarlyAmt.Enabled := True;
    ed_SExtendAmt.Enabled := True;
    ed_SNightAmt.Enabled := True;
    ed_HEarlyAmt.Enabled := True;
    ed_HExtendAmt.Enabled := True;
    ed_HNightAmt.Enabled := True;
  end else if upperCase(aState) = 'SEARCH' then
  begin
    sg_Employ.Enabled := True;
    ed_sEmpNo.Enabled := False;
    chk_AutoSabun.Enabled := False;
    ed_sEmpNM.Enabled := False;
    cmb_sCompany.Enabled := False;
    cmb_sJijum.Enabled := False;
    cmb_sDepart.Enabled := False;
    cmb_sPosi.Enabled := False;
    ed_sCompanyPhone.Enabled := False;
    dt_sJoinDt.Enabled := False;
    dt_sRetireDt.Enabled := False;
    ed_sZipcode.Enabled := False;
    btn_ZipcodeSearch.Enabled := False;
    ed_sAddr1.Enabled := False;
    ed_sAddr2.Enabled := False;
    ed_sHomePhone.Enabled := False;
    ed_sHandphone.Enabled := False;
    chk_CardReg.Enabled := False;
    cmb_ComPort.Enabled := False;
    cmb_RegGubun.Enabled := False;
    ed_CardNo.Enabled := False;
    btn_Image.Enabled := False;
    cmb_WorkerType.Enabled := False;
    cmb_AtType.Enabled := False;
    cmb_PayGubun.Enabled := False;
    ed_payAmt.Enabled := False;
    ed_PassNo.Enabled := False;
    gb_sudang.Enabled := False;
    rg_ExtraType.Enabled := False;
    PageControl1.Enabled := False;
    ed_WEarlyAmt.Enabled := False;
    ed_WExtendAmt.Enabled := False;
    ed_WNightAmt.Enabled := False;
    ed_SEarlyAmt.Enabled := False;
    ed_SExtendAmt.Enabled := False;
    ed_SNightAmt.Enabled := False;
    ed_HEarlyAmt.Enabled := False;
    ed_HExtendAmt.Enabled := False;
    ed_HNightAmt.Enabled := False;
  end else if upperCase(aState) = 'CLICK' then
  begin
    sg_Employ.Enabled := True;
    ed_sEmpNo.Enabled := False;
    chk_AutoSabun.Enabled := False;
    ed_sEmpNM.Enabled := False;
    cmb_sCompany.Enabled := False;
    cmb_sJijum.Enabled := False;
    cmb_sDepart.Enabled := False;
    cmb_sPosi.Enabled := False;
    ed_sCompanyPhone.Enabled := False;
    dt_sJoinDt.Enabled := False;
    dt_sRetireDt.Enabled := False;
    ed_sZipcode.Enabled := False;
    btn_ZipcodeSearch.Enabled := False;
    ed_sAddr1.Enabled := False;
    ed_sAddr2.Enabled := False;
    ed_sHomePhone.Enabled := False;
    ed_sHandphone.Enabled := False;
    chk_CardReg.Enabled := False;
    cmb_ComPort.Enabled := False;
    cmb_RegGubun.Enabled := False;
    ed_CardNo.Enabled := False;
    btn_Image.Enabled := False;
    cmb_WorkerType.Enabled := False;
    cmb_AtType.Enabled := False;
    cmb_PayGubun.Enabled := False;
    ed_payAmt.Enabled := False;
    ed_PassNo.Enabled := False;
    gb_sudang.Enabled := False;
    rg_ExtraType.Enabled := False;
    PageControl1.Enabled := False;
    ed_WEarlyAmt.Enabled := False;
    ed_WExtendAmt.Enabled := False;
    ed_WNightAmt.Enabled := False;
    ed_SEarlyAmt.Enabled := False;
    ed_SExtendAmt.Enabled := False;
    ed_SNightAmt.Enabled := False;
    ed_HEarlyAmt.Enabled := False;
    ed_HExtendAmt.Enabled := False;
    ed_HNightAmt.Enabled := False;
  end else if upperCase(aState) = 'UPDATE' then
  begin
    sg_Employ.Enabled := False;
    ed_sEmpNo.Enabled := False;
    chk_AutoSabun.Enabled := True;
    ed_sEmpNM.Enabled := True;
    cmb_sCompany.Enabled := False;
    if (Not IsMaster) and ( strtoint(CompanyGrade) > 2) then cmb_sJijum.Enabled := False
    else cmb_sJijum.Enabled := True;
    cmb_sDepart.Enabled := True;
    cmb_sPosi.Enabled := True;
    ed_sCompanyPhone.Enabled := True;
    dt_sJoinDt.Enabled := True;
    dt_sRetireDt.Enabled := True;
    ed_sZipcode.Enabled := True;
    btn_ZipcodeSearch.Enabled := True;
    ed_sAddr1.Enabled := True;
    ed_sAddr2.Enabled := True;
    ed_sHomePhone.Enabled := True;
    ed_sHandphone.Enabled := True;
    chk_CardReg.Enabled := True;
    cmb_ComPort.Enabled := True;
    cmb_RegGubun.Enabled := True;
    ed_CardNo.Enabled := True;
    btn_Image.Enabled := True;
    cmb_WorkerType.Enabled := True;
    cmb_AtType.Enabled := True;
    cmb_PayGubun.Enabled := True;
    ed_payAmt.Enabled := True;
    ed_PassNo.Enabled := True;
    gb_sudang.Enabled := True;
    rg_ExtraType.Enabled := True;
    PageControl1.Enabled := True;
    ed_WEarlyAmt.Enabled := True;
    ed_WExtendAmt.Enabled := True;
    ed_WNightAmt.Enabled := True;
    ed_SEarlyAmt.Enabled := True;
    ed_SExtendAmt.Enabled := True;
    ed_SNightAmt.Enabled := True;
    ed_HEarlyAmt.Enabled := True;
    ed_HExtendAmt.Enabled := True;
    ed_HNightAmt.Enabled := True;
  end;
end;

procedure TfmEmploy.ShowEmployee(aCode: string;aTopRow:integer=0);
var
  stSql : string;
  nRow : integer;
  i : integer;
  TempAdoQuery : TADOQuery;
begin
  GridInit(sg_Employ,6); //스트링그리드 초기화

  State := 'SEARCH';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  if DBTYPE = 'MSSQL' then stSql := MSSQL.SelectTB_EMPLOYEEATJoinBase
  else if DBType = 'PG' then stSql := PostGreSql.SelectTB_EMPLOYEEATJoinBase
  else if DBType = 'MDB' then stSql := MDBSql.SelectTB_EMPLOYEEATJoinBase
  else Exit;
   {
  stSql := 'select c.CO_NAME as COMPANYNAME,a.EM_PASS, ';
  stSql := stSql + ' d.CO_NAME as JIJUMNAME,e.CO_NAME as DEPARTNAME,f.PO_NAME,a.EM_CODE,a.AT_ATCODE,';
  stSql := stSql + ' a.EM_NAME,a.CO_COMPANYCODE,a.CO_JIJUMCODE,a.CO_DEPARTCODE,a.PO_POSICODE, ';
  stSql := stSql + ' a.EM_COPHONE,a.EM_JOINDATE,a.EM_RETIREDATE,a.ZI_ZIPCODE,';
  stSql := stSql + ' a.EM_ADDR1,a.EM_ADDR2,EM_HOMEPHONE,a.EM_HANDPHONE,a.EM_IMAGE,';
  stSql := stSql + ' b.CA_CARDNO,b.CA_CARDTYPE,G.PA_GUBUN,G.PA_AMT ';
  stSql := stSql + ' from TB_EMPLOYEE a ';
  stSql := stSql + ' Left Join TB_CARD b ';
  stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.EM_CODE = b.EM_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ) ';
  stSql := stSql + ' Left Join TB_COMPANY c ';
  stSql := stSql + ' ON ( a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = c.CO_COMPANYCODE ';
  stSql := stSql + ' AND c.CO_GUBUN = ''1'') ';
  stSql := stSql + ' Left Join TB_COMPANY d ';
  stSql := stSql + ' ON ( a.GROUP_CODE = d.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = d.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.CO_JIJUMCODE = d.CO_JIJUMCODE ';
  stSql := stSql + ' AND d.CO_GUBUN = ''2'') ';
  stSql := stSql + ' Left Join TB_COMPANY e ';
  stSql := stSql + ' ON ( a.GROUP_CODE = e.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = e.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.CO_JIJUMCODE = e.CO_JIJUMCODE ';
  stSql := stSql + ' AND a.CO_DEPARTCODE = e.CO_DEPARTCODE ';
  stSql := stSql + ' AND e.CO_GUBUN = ''3'') ';
  stSql := stSql + ' Left Join TB_POSI f ';
  stSql := stSql + ' ON ( a.GROUP_CODE = f.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = f.CO_COMPANYCODE  ';
  stSql := stSql + ' AND a.PO_POSICODE = f.PO_POSICODE ) ';
  stSql := stSql + ' Left Join TB_BASEPAY G ';
  stSql := stSql + ' ON ( a.GROUP_CODE = G.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = G.CO_COMPANYCODE  ';
  stSql := stSql + ' AND a.EM_CODE = G.EM_CODE  ';
  stSql := stSql + ' AND G.PA_CODE = ''001'' ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';   }

  if (Not IsMaster) and (CompanyGrade <> '0') then
  begin
    if CompanyGrade = '1' then
    begin
      if cmb_Company.ItemIndex < 1 then
      begin
        if CompanyCodeList.Count < 2 then
        begin
          showmessage('관리할수 있는 회사 권한이 없습니다.');
          Exit;
        end;
        for i:= 1 to CompanyCodeList.Count - 1 do
        begin
          if L_Close then Exit;
          if i = 1 then stSql := stSql + ' AND ( '
          else stSql := stSql + ' OR ';
          stSql := stSql + ' a.CO_COMPANYCODE = ''' + CompanyCodeList.Strings[i] + ''' ';
        end;
        stSql := stSql + ')'; 
      end else stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + CompanyCodeList.Strings[cmb_Company.ItemIndex] + ''' ';
      if cmb_Jijum.ItemIndex > 0 then stSql := stSql + ' AND a.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3) + ''' ';
      if cmb_Depart.ItemIndex > 0 then stSql := stSql + ' AND a.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],7,3) + ''' ';
    end else if CompanyGrade = '2' then
    begin
      if cmb_Company.ItemIndex < 1 then
      begin
        showmessage('관리자 소속 회사코드가 이상합니다.');
        Exit;
      end;
      stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + CompanyCodeList.Strings[cmb_Company.ItemIndex] + ''' ';
      if cmb_Jijum.ItemIndex < 1 then
      begin
        if JijumCodeList.Count < 2 then
        begin
          showmessage('관리할수 있는 지점 권한이 없습니다.');
          Exit;
        end;
        for i:= 1 to JijumCodeList.Count - 1 do
        begin
          if L_Close then Exit;
          if i = 1 then stSql := stSql + ' AND ( '
          else stSql := stSql + ' OR ';
          stSql := stSql + ' a.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[i],4,3) + ''' ';
        end;
        stSql := stSql + ')';
      end else stSql := stSql + ' AND a.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3) + ''' ';
      if cmb_Depart.ItemIndex > 0 then stSql := stSql + ' AND a.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],7,3) + ''' ';
    end else if CompanyGrade = '3' then
    begin
      if cmb_Company.ItemIndex < 1 then
      begin
        showmessage('관리자 소속 회사코드가 이상합니다.');
        Exit;
      end;
      stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + CompanyCodeList.Strings[cmb_Company.ItemIndex] + ''' ';
      if cmb_Jijum.ItemIndex < 1 then
      begin
        showmessage('관리자 소속 지점코드가 이상합니다.');
        Exit;
      end;
      stSql := stSql + ' AND a.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3) + ''' ';
      if cmb_Depart.ItemIndex < 1 then
      begin
        if DepartCodeList.Count < 2 then
        begin
          showmessage('관리할수 있는 부서 권한이 없습니다.');
          Exit;
        end;
        for i:= 1 to DepartCodeList.Count - 1 do
        begin
          if L_Close then Exit;
          if i = 1 then stSql := stSql + ' AND ( '
          else stSql := stSql + ' OR ';
          stSql := stSql + ' a.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[i],7,3) + ''' ';
        end;
        stSql := stSql + ')';
      end else stSql := stSql + ' AND a.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],7,3) + ''' '; 
    end;
  end else
  begin
    if cmb_Depart.ItemIndex > 0 then
    begin
      stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],1,3) + ''' ' ;
      stSql := stSql + ' AND a.CO_JIJUMCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],4,3) + ''' ' ;
      stSql := stSql + ' AND a.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],7,3) + ''' ' ;
    end else if cmb_Jijum.ItemIndex > 0 then
    begin
      stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3) + ''' ' ;
      stSql := stSql + ' AND a.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3) + ''' ' ;
    end else if cmb_Company.ItemIndex > 0 then
    begin
      stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + CompanyCodeList.Strings[cmb_Company.ItemIndex] + ''' ' ;
    end;
  end;

  if cmb_Posi.ItemIndex > 0 then
    stSql := stSql + ' AND a.PO_POSICODE = ''' + copy(PosiCodeList.Strings[cmb_Posi.ItemIndex],4,3) + ''' ';
  if Trim(ed_EmpNo.Text) <> '' then
    stSql := stSql + ' AND a.EM_CODE Like ''%' + Trim(ed_EmpNo.Text)  + '%'' ';
  if Trim(ed_EmpNM.Text) <> '' then
    stSql := stSql + ' AND a.EM_NAME LIKE ''%' + Trim(ed_EmpNM.Text)  + '%'' ';

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
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;

    if RecordCount < 1 then
    begin
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    end;

    sg_Employ.RowCount := RecordCount + 1;
    nRow := 1;
    First;
    while Not Eof do
    begin
      with sg_Employ do
      begin
        if L_Close then Exit;
        cells[0,nRow] := FindField('COMPANYNAME').AsString;
        cells[1,nRow] := FindField('JIJUMNAME').AsString;
        cells[2,nRow] := FindField('DEPARTNAME').AsString;
        cells[3,nRow] := FindField('PO_NAME').AsString;
        cells[4,nRow] := FindField('EM_CODE').AsString;
        cells[5,nRow] := FindField('EM_NAME').AsString;
        cells[6,nRow] := FindField('CO_COMPANYCODE').AsString;
        cells[7,nRow] := FindField('CO_JIJUMCODE').AsString;
        cells[8,nRow] := FindField('CO_DEPARTCODE').AsString;
        cells[9,nRow] := FindField('PO_POSICODE').AsString;
        cells[10,nRow] := FindField('EM_COPHONE').AsString;
        cells[11,nRow] := FindField('EM_JOINDATE').AsString;
        cells[12,nRow] := FindField('EM_RETIREDATE').AsString;
        cells[13,nRow] := FindField('ZI_ZIPCODE').AsString;
        cells[14,nRow] := FindField('EM_ADDR1').AsString;
        cells[15,nRow] := FindField('EM_ADDR2').AsString;
        cells[16,nRow] := FindField('EM_HOMEPHONE').AsString;
        cells[17,nRow] := FindField('EM_HANDPHONE').AsString;
        if FindField('EM_IMAGE').IsNull then  cells[18,nRow] := 'N'
        else cells[18,nRow] := 'Y';
        cells[19,nRow] := FindField('CA_CARDNO').AsString;
        cells[20,nRow] := FindField('CA_CARDTYPE').AsString;
        cells[21,nRow] := FindField('AT_ATCODE').AsString;
        cells[22,nRow] := FindField('PA_GUBUN').AsString;
        cells[23,nRow] := FindField('PA_AMT').AsString;
        cells[24,nRow] := FindField('EM_PASS').AsString;
        cells[25,nRow] := FindField('AW_CODE').AsString;
        cells[26,nRow] := FindField('CT_NAME').AsString;
        if (FindField('CO_COMPANYCODE').AsString + FindField('EM_CODE').AsString)  = aCode then
        begin
          SelectRows(nRow,1);
        end;
      end;
      nRow := nRow + 1;
      Next;
    end;
  end;
  if aTopRow <> 0 then sg_Employ.TopRow := aTopRow;
  TempAdoQuery.Free;
  CoUninitialize;
  sg_EmployClick(sg_Employ);

end;

procedure TfmEmploy.btn_CancelClick(Sender: TObject);
var
  stCompanyCode : string;
begin
  stCompanyCode := '000';
  if cmb_sCompany.ItemIndex > 0 then stCompanyCode := copy(sCompanyCodeList.Strings[cmb_sCompany.itemIndex],1,3);
  ShowEmployee(stCompanyCode + ed_sEmpNo.Text);
end;

procedure TfmEmploy.FormShow(Sender: TObject);
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

  GetTB_Config;
  cmb_WorkerType.Visible := False;
  lb_WorkerType.Visible := False;
  if (ChangATType = 1) then      //0:고정근무타입,1:사원별근무타입,2:교대근무타입 ,3: 혼합
  begin
    lb_atType.Visible := True;
    cmb_atType.Visible := True;
  end else
  begin
    if (ChangATType = 2) or (ChangATType = 3) then
    begin
      cmb_WorkerType.Visible := True;
      lb_WorkerType.Visible := True;
    end;
    lb_atType.Visible := False;
    cmb_atType.Visible := False;
  end;

  LoadDeviceList(cmb_ComPort);
  if CARDTYPE = '2' then
  begin
    rg_CardReader.ItemIndex := 1;
    rg_CardReader.Enabled := False;
    lb_Pass.Visible := True;
    ed_PassNo.Visible := True;
  end else
  begin
    rg_CardReader.ItemIndex := 1;
    rg_CardReader.Enabled := True;
    lb_Pass.Visible := False;
    ed_PassNo.Visible := False;
  end;

end;

procedure TfmEmploy.cmb_JijumChange(Sender: TObject);
begin
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
  btn_SearchClick(Self);
end;


procedure TfmEmploy.cmb_sJijumChange(Sender: TObject);
begin
  LoadsDepartCode(copy(sJijumCodeList.Strings[cmb_sJijum.ItemIndex],1,3),copy(sJijumCodeList.Strings[cmb_sJijum.ItemIndex],4,3),sDepartCodeList,cmb_sDepart);

end;

procedure TfmEmploy.LoadATType(aStringList: TStringList;
  cmb_Box: TComboBox);
var
  stSql :string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  aStringList.Clear;
  cmb_Box.Items.Add('');
  aStringList.Add('');
  cmb_Box.ItemIndex := 0;

  stSql := 'select * from TB_ATCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';

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
      TempAdoQuery.Free;
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
      if L_Close then Exit;
      cmb_Box.Items.Add(FindField('AT_CODENAME').AsString);
      aStringList.Add(FindField('AT_ATCODE').AsString);
      Next;
    end;

  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

function TfmEmploy.CheckTB_BASEPAY(aCompanyCode, aEmpID,
  aPayCode: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := False;
  stSql := ' select * from TB_BASEPAY ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmpID + ''' ';
  stSql := stSql + ' AND PA_CODE = ''' + aPayCode + ''' ';

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
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;

    if RecordCount > 0 then result := True;

  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

function TfmEmploy.InsertTB_BASEPAY(aCompanyCode, aEmpID, aPayCode,
  aPayGubun, aPayAmt: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_BASEPAY(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' CO_COMPANYCODE,';
  stSql := stSql + ' EM_CODE,';
  stSql := stSql + ' PA_CODE,';
  stSql := stSql + ' PA_GUBUN,';
  stSql := stSql + ' PA_AMT) ';
  stSql := stSql + ' Values(';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aEmpID + ''',';
  stSql := stSql + '''' + aPayCode + ''',';
  stSql := stSql + '''' + aPayGubun + ''',';
  stSql := stSql + '''' + aPayAmt + ''')';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmEmploy.UpdateTB_BASEPAY(aCompanyCode, aEmpID, aPayCode,
  aPayGubun, aPayAmt: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_BASEPAY set ';
  stSql := stSql + ' PA_GUBUN = ''' + aPayGubun + ''',';
  stSql := stSql + ' PA_AMT = ''' + aPayAmt + ''' ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmpID + ''' ';
  stSql := stSql + ' AND PA_CODE = ''' + aPayCode + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmEmploy.DeleteTB_BASEPAY(aCompanyCode, aEmpID,
  aPayCode: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Delete From TB_BASEPAY ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmpID + ''' ';
  stSql := stSql + ' AND PA_CODE = ''' + aPayCode + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmEmploy.GetTB_CONFIG;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin

  stSql := ' select * from TB_CONFIG ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND ( CO_CONFIGGROUP = ''ATTEND'' ';
  stSql := stSql + ' OR CO_CONFIGGROUP = ''PAY'' ) ';

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
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;

    While Not Eof do
    begin
      if L_Close then Exit;
      if FindField('CO_CONFIGCODE').AsString = 'ATTYPE' then ChangATType := FindField('CO_CONFIGVALUE').AsInteger;
      if FindField('CO_CONFIGCODE').AsString = 'ATTYPEPAY' then L_nAtTypePay := FindField('CO_CONFIGVALUE').AsInteger;
      Next;
    end;

  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

procedure TfmEmploy.rg_CardReaderClick(Sender: TObject);
var
  nCount : integer;
  i : integer;
begin
  if rg_CardReader.ItemIndex = 0 then
  begin
    ComPortList.Clear;
    nCount := GetSerialPortList(ComPortList);
    cmb_ComPort.Clear;
    if nCount = 0 then
    begin
      chk_CardReg.Checked := False;
      showmessage('시리얼 포트를 찾을 수 없습니다. 제어판에서 시리얼 포트를 확인하여 주세요.');
      Exit;
    end;

    for i:= 0 to nCount - 1 do
    begin
      if L_Close then Exit;
      cmb_ComPort.items.Add(ComPortList.Strings[i])
    end;
    cmb_ComPort.ItemIndex := 0;

    try
      ApdDataPacket1.AutoEnable := false;
      ApdDataPacket1.StartCond := scString;
      ApdDataPacket1.StartString := #$02;
      ApdDataPacket1.EndCond := [ecString];
      ApdDataPacket1.EndString := #$03;
      ApdDataPacket1.Timeout := 0;
      ReaderPort.ComNumber := Integer(ComPortList.Objects[cmb_ComPort.ItemIndex]);
      //ReaderPort.ComNumber := strtoint(copy(cmb_ComPort.text,4,Pos(':',cmb_ComPort.text) -4));
      ReaderPort.Open := true;
      ApdDataPacket1.Enabled := True;
    except
      MessageDlg('통신포트를 확인해 주세요', mtError, [mbOK], 0);
      chk_CardReg.Checked:= False;
      Exit;
    end;
    cmb_ComPort.Enabled := True;
  end else
  begin
    if ReaderPort.Open then
    begin
      ApdDataPacket1.Enabled := False;
      ReaderPort.Open:= False;
    end;
    LoadDeviceList(cmb_ComPort);
  end;

end;

procedure TfmEmploy.LoadDeviceList(cmb_Box: TComboBox);
var
  stSql :string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  DeviceCodeList.Clear;

  stSql := ' select * from TB_ACCESSDEVICE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';

  cmb_Box.Items.Add(' ');
  DeviceCodeList.Add('');
  cmb_Box.ItemIndex := 0;

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
      TempAdoQuery.Free;
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
      if L_Close then Exit;
      cmb_Box.Items.Add(FindField('AC_DEVICENAME').AsString);
      DeviceCodeList.Add(FillZeroNumber(FindField('AC_NODENO').AsInteger,3) +
                       FindField('AC_ECUID').asstring);
      Next;
    end;

  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

function TfmEmploy.CheckTB_ATCARD(aCardNo: string): Boolean;
var
  stSql :string;
  TempAdoQuery : TADOQuery;
begin

  result := False;

  stSql := ' select * from TB_ATCARD ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

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
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;

    if RecordCount > 0  then result := True;

  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

function TfmEmploy.CheckTB_ATPASS(aPassNo: string): Boolean;
var
  stSql :string;
  TempAdoQuery : TADOQuery;
begin

  result := False;

  stSql := ' select * from TB_ATPASS ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND EM_PASS = ''' + aPassNo + ''' ';

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
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;

    if RecordCount > 0  then result := True;

  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

function TfmEmploy.InsertTB_ATCARD(aCardNo, aAtReg,
  aAtLoad: string): Boolean;
var
  stSql :string;
begin
  stSql := ' insert Into TB_ATCARD(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' CA_CARDNO,';
  stSql := stSql + ' AT_REG,';
  stSql := stSql + ' AT_LOAD) ';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aCardNo + ''',';
  stSql := stSql + '''' + aAtReg + ''',';
  stSql := stSql + '''' + aAtLoad + ''') ';
  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmEmploy.InsertTB_ATPASS(aPassNo, aAtReg,
  aAtLoad: string): Boolean;
var
  stSql :string;
begin
  stSql := ' insert Into TB_ATPASS(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' EM_PASS,';
  stSql := stSql + ' AT_REG,';
  stSql := stSql + ' AT_LOAD) ';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aPassNo + ''',';
  stSql := stSql + '''' + aAtReg + ''',';
  stSql := stSql + '''' + aAtLoad + ''') ';
  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmEmploy.UpdateTB_ATCARD(aCardNo, aAtReg,
  aAtLoad: string): Boolean;
var
  stSql :string;
begin
  stSql := ' Update TB_ATCARD set ';
  stSql := stSql + ' AT_REG = ''' + aAtReg + ''',';
  stSql := stSql + ' AT_LOAD = ''' + aAtLoad + ''' ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + '''';
  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmEmploy.UpdateTB_ATPASS(aPassNo, aAtReg,
  aAtLoad: string): Boolean;
var
  stSql :string;
begin
  stSql := ' Update TB_ATPASS set ';
  stSql := stSql + ' AT_REG = ''' + aAtReg + ''',';
  stSql := stSql + ' AT_LOAD = ''' + aAtLoad + ''' ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND EM_PASS = ''' + aPassNo + '''';
  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmEmploy.CheckPassNo(aPassNo: string; var aCompanyCode,
  aEmCode: string): Boolean;
var
  stSql :string;
  TempAdoQuery : TADOQuery;
begin

  result := False;

  stSql := ' select * from TB_EMPLOYEE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND EM_PASS = ''' + aPassNo + ''' ';

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
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;

    if RecordCount > 0  then
    begin
      aCompanyCode := FindField('CO_COMPANYCODE').AsString;
      aEmCode := FindField('EM_CODE').AsString;
      result := True;
    end;

  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

procedure TfmEmploy.CommandArrayCommandsTCommand1Execute(Command: TCommand;
  Params: TStringList);
var
  stReceiveData: string;
  stNodeNo,stECUID,stDoorNo,stReaderNo : string;
  stTYPE : string;
  stACTION:string;
  nLength : integer;
  stData : string;
  stDevice : string;
  stDeviceID : string;
  stCardNo : string;
begin
//'R'  //기기 수신'R' 송신 'S'
//'E'  //SERVER 'S',ECU 'E',Door 'D',Reader 'R'
//000  //NodeNo
//00   //ECUID
//00    //DoorNo
//00    //ReaderNo
//'AT' //타입 출입'AC',식수 'FD',서버 'SR',기기 'DV'
//'C'  //카드 'C' 버튼 'B',  'R' 서버 재시작
//000   //Length
//DATA

  stReceiveData := Params.Values['Data'];
  stDevice := stReceiveData[2];
  stNodeNo := copy(stReceiveData,3,3);
  stECUID := copy(stReceiveData,6,2);
  stDoorNo := copy(stReceiveData,8,2);
  stReaderNo := copy(stReceiveData,10,2);
  stTYPE := copy(stReceiveData,12,2);
  stACTION := copy(stReceiveData,14,1);
  nLength := strtoint(copy(stReceiveData,15,3));
  stData := copy(stReceiveData,18,nLength);
  stCardNo := copy(stData,16,Length(stData) - 15);
  stCardNo := FindCharCopy(stCardNo,0,';');

  if stDevice = 'E' then
  begin
    if stTYPE = 'AT' then
    begin
      if stACTION = 'C' then   //카드 데이터
      begin
        if rg_CardReader.ItemIndex = 1 then
        begin
          if cmb_ComPort.ItemIndex > 0 then
          begin
            stDeviceID := DeviceCodeList.Strings[cmb_ComPort.ItemIndex];
            if (stNodeNo + stECUID) = stDeviceID then
            begin
              if (State = 'INSERT') or (State ='UPDATE') then
                ed_CardNo.Text := stCardNo;
            end;
          end;
        end;
      end;
    end;
  end;

end;

procedure TfmEmploy.SetEmployeeSudang(aCompanyCode, aEmCode: string);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  if DBTYPE = 'MSSQL' then stSql :=  Mssql.SelectTB_EMPLOYEEATJoinExtraBase
  else if DBTYPE = 'PG' then stSql := PostGreSql.SelectTB_EMPLOYEEATJoinExtraBase
  else if DBTYPE = 'MDB' then stSql := MDBSql.SelectTB_EMPLOYEEATJoinExtraBase
  else Exit;
  stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND a.EM_CODE = ''' + aEmCode + ''' ';

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
      TempAdoQuery.Free;
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
    if Not IsDigit(Trim(FindField('EX_TYPE').AsString)) then rg_ExtraType.ItemIndex := 0
    else rg_ExtraType.ItemIndex := strtoint(FindField('EX_TYPE').AsString);
    if Trim(FindField('EX_WEARLYAMT').AsString) = '' then ed_WEarlyAmt.Text := '0'
    else ed_WEarlyAmt.Text := FindField('EX_WEARLYAMT').AsString;
    if Trim(FindField('EX_WEXTENDAMT').AsString) = '' then ed_WExtendAmt.Text := '0'
    else ed_WExtendAmt.Text := FindField('EX_WEXTENDAMT').AsString;
    if Trim(FindField('EX_WNIGHTAMT').AsString) = '' then ed_WNightAmt.Text := '0'
    else ed_WNightAmt.Text := FindField('EX_WNIGHTAMT').AsString;
    if Trim(FindField('EX_SEARLYAMT').AsString) = '' then ed_SEarlyAmt.Text := '0'
    else ed_SEarlyAmt.Text := FindField('EX_SEARLYAMT').AsString;
    if Trim(FindField('EX_SEXTENDAMT').AsString) = '' then ed_SExtendAmt.Text := '0'
    else ed_SExtendAmt.Text := FindField('EX_SEXTENDAMT').AsString;
    if Trim(FindField('EX_SNIGHTAMT').AsString) = '' then ed_SNightAmt.Text := '0'
    else ed_SNightAmt.Text := FindField('EX_SNIGHTAMT').AsString;
    if Trim(FindField('EX_HEARLYAMT').AsString) = '' then ed_HEarlyAmt.Text := '0'
    else ed_HEarlyAmt.Text := FindField('EX_HEARLYAMT').AsString;
    if Trim(FindField('EX_HEXTENDAMT').AsString) = '' then ed_HExtendAmt.Text := '0'
    else ed_HExtendAmt.Text := FindField('EX_HEXTENDAMT').AsString;
    if Trim(FindField('EX_HNIGHTAMT').AsString) = '' then ed_HNightAmt.Text := '0'
    else ed_HNightAmt.Text := FindField('EX_HNIGHTAMT').AsString;

  end;
  TempAdoQuery.Free;
  CoUninitialize;
  rg_ExtraTypeClick(self);


end;

function TfmEmploy.TB_ATEMPEXTRAInsert(aCompanyCode, aEmCode, aExtraType,
  aWEarlyAmt, aWExtendAmt, aWNightAmt, aSEarlyAmt, aSExtendAmt, aSNightAmt,
  aHEarlyAmt, aHExtendAmt, aHNightAmt: string): Boolean;
begin
  if Not IsDigit(aExtraType) then aExtraType := '0';
  aWEarlyAmt := StringReplace(aWEarlyAmt,',','',[rfReplaceAll]);
  if Not IsDigit(aWEarlyAmt) then aWEarlyAmt := '0';
  aWExtendAmt := StringReplace(aWExtendAmt,',','',[rfReplaceAll]);
  if Not IsDigit(aWExtendAmt) then aWExtendAmt := '0';
  aWNightAmt := StringReplace(aWNightAmt,',','',[rfReplaceAll]);
  if Not IsDigit(aWNightAmt) then aWNightAmt := '0';

  aSEarlyAmt := StringReplace(aSEarlyAmt,',','',[rfReplaceAll]);
  if Not IsDigit(aSEarlyAmt) then aSEarlyAmt := '0';
  aSExtendAmt := StringReplace(aSExtendAmt,',','',[rfReplaceAll]);
  if Not IsDigit(aSExtendAmt) then aSExtendAmt := '0';
  aSNightAmt := StringReplace(aSNightAmt,',','',[rfReplaceAll]);
  if Not IsDigit(aSNightAmt) then aSNightAmt := '0';

  aHEarlyAmt := StringReplace(aHEarlyAmt,',','',[rfReplaceAll]);
  if Not IsDigit(aHEarlyAmt) then aHEarlyAmt := '0';
  aHExtendAmt := StringReplace(aHExtendAmt,',','',[rfReplaceAll]);
  if Not IsDigit(aHExtendAmt) then aHExtendAmt := '0';
  aHNightAmt := StringReplace(aHNightAmt,',','',[rfReplaceAll]);
  if Not IsDigit(aHNightAmt) then aHNightAmt := '0';

  if CheckTB_ATEMPEXTRA(aCompanyCode,aEmCode) then
  begin
    UpdateTB_ATEMPEXTRA(aCompanyCode,aEmCode,
                        aExtraType,
                        aWEarlyAmt,
                        aWExtendAmt,
                        aWNightAmt,
                        aSEarlyAmt,
                        aSExtendAmt,
                        aSNightAmt,
                        aHEarlyAmt,
                        aHExtendAmt,
                        aHNightAmt);

  end else
  begin
    InsertIntoTB_ATEMPEXTRA(aCompanyCode,aEmCode,
                        aExtraType,
                        aWEarlyAmt,
                        aWExtendAmt,
                        aWNightAmt,
                        aSEarlyAmt,
                        aSExtendAmt,
                        aSNightAmt,
                        aHEarlyAmt,
                        aHExtendAmt,
                        aHNightAmt);
  end;
end;

function TfmEmploy.CheckTB_ATEMPEXTRA(aCompanyCode,
  aEmCode: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' select * from TB_ATEMPEXTRA ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';

  With AdoQuery1 do
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

function TfmEmploy.InsertIntoTB_ATEMPEXTRA(aCompanyCode, aEmCode,
  aExtraType, aWEarlyAmt, aWExtendAmt, aWNightAmt, aSEarlyAmt, aSExtendAmt,
  aSNightAmt, aHEarlyAmt, aHExtendAmt, aHNightAmt: string): Boolean;
var
  stSql :string;
begin
  stSql := ' Insert Into TB_ATEMPEXTRA(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' CO_COMPANYCODE,';
  stSql := stSql + ' EM_CODE,';
  stSql := stSql + ' EX_TYPE,';
  stSql := stSql + ' EX_WEARLYAMT,';
  stSql := stSql + ' EX_WEXTENDAMT,';
  stSql := stSql + ' EX_WNIGHTAMT,';
  stSql := stSql + ' EX_SEARLYAMT,';
  stSql := stSql + ' EX_SEXTENDAMT,';
  stSql := stSql + ' EX_SNIGHTAMT,';
  stSql := stSql + ' EX_HEARLYAMT,';
  stSql := stSql + ' EX_HEXTENDAMT,';
  stSql := stSql + ' EX_HNIGHTAMT ) ';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + GROUPCODE + ''', ';
  stSql := stSql + '''' + aCompanyCode + ''', ';
  stSql := stSql + '''' + aEmCode + ''', ';
  stSql := stSql + '''' + aExtraType + ''', ';
  stSql := stSql + '''' + aWEarlyAmt + ''', ';
  stSql := stSql + '''' + aWExtendAmt + ''', ';
  stSql := stSql + '''' + aWNightAmt + ''', ';
  stSql := stSql + '''' + aSEarlyAmt + ''', ';
  stSql := stSql + '''' + aSExtendAmt + ''', ';
  stSql := stSql + '''' + aSNightAmt + ''', ';
  stSql := stSql + '''' + aHEarlyAmt + ''', ';
  stSql := stSql + '''' + aHExtendAmt + ''', ';
  stSql := stSql + '''' + aHNightAmt + ''') ';

  Result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmEmploy.UpdateTB_ATEMPEXTRA(aCompanyCode, aEmCode, aExtraType,
  aWEarlyAmt, aWExtendAmt, aWNightAmt, aSEarlyAmt, aSExtendAmt, aSNightAmt,
  aHEarlyAmt, aHExtendAmt, aHNightAmt: string): Boolean;
var
  stSql :string;
begin
  stSql := ' Update TB_ATEMPEXTRA set ';
  stSql := stSql + ' EX_TYPE = ''' + aExtraType + ''', ';
  stSql := stSql + ' EX_WEARLYAMT = ''' + aWEarlyAmt + ''', ';
  stSql := stSql + ' EX_WEXTENDAMT = ''' + aWExtendAmt + ''', ';
  stSql := stSql + ' EX_WNIGHTAMT = ''' + aWNightAmt + ''', ';
  stSql := stSql + ' EX_SEARLYAMT = ''' + aSEarlyAmt + ''', ';
  stSql := stSql + ' EX_SEXTENDAMT = ''' + aSExtendAmt + ''', ';
  stSql := stSql + ' EX_SNIGHTAMT = ''' + aSNightAmt + ''', ';
  stSql := stSql + ' EX_HEARLYAMT = ''' + aHEarlyAmt + ''', ';
  stSql := stSql + ' EX_HEXTENDAMT = ''' + aHExtendAmt + ''', ';
  stSql := stSql + ' EX_HNIGHTAMT = ''' + aHNightAmt + ''' ';
  stSql := stSql + ' WHERE GROUP_CODE =''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';

  Result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmEmploy.DeleteTB_ATEMPEXTRA(aCompanyCode,
  aEmCode: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Delete From TB_ATEMPEXTRA ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmEmploy.rg_ExtraTypeClick(Sender: TObject);
begin
  if rg_ExtraType.ItemIndex = 0 then
  begin
    lb_wEalry.Caption := '원/시간';
    lb_WExtend.Caption := '원/시간';
    lb_WNight.Caption := '원/시간';
    lb_sEalry.Caption := '원/시간';
    lb_sExtend.Caption := '원/시간';
    lb_sNight.Caption := '원/시간';
    lb_hEalry.Caption := '원/시간';
    lb_hExtend.Caption := '원/시간';
    lb_hNight.Caption := '원/시간';
  end else
  begin
    lb_wEalry.Caption := '원/정액';
    lb_WExtend.Caption := '원/정액';
    lb_WNight.Caption := '원/정액';
    lb_sEalry.Caption := '원/정액';
    lb_sExtend.Caption := '원/정액';
    lb_sNight.Caption := '원/정액';
    lb_hEalry.Caption := '원/정액';
    lb_hExtend.Caption := '원/정액';
    lb_hNight.Caption := '원/정액';
  end;

end;

function TfmEmploy.GetEmployeeFdmsID(aCompanyCode, aEmpID: string): string;
var
  stSql : string;
  nFdms_id : integer;
begin
  result := '0';
  stSql := 'select fdms_id from TB_EMPLOYEE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmpID + ''' ';

  with fdmsADOQuery do
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
    Try
      nFdms_id := FindField('fdms_id').AsInteger;
      if nFdms_id = 0 then Exit;
    Except
      Exit;
    End;
    result := inttostr(nFdms_id);
  end;
end;

function TfmEmploy.GetFdmsID: string;
var
  stSql : string;
  nFdms_id : integer;
begin
  result := '31';
  stSql := 'select Max(Fdms_id) as fdms_id from TB_EMPLOYEE ';
  with fdmsADOQuery do
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
    Try
      nFdms_id := FindField('fdms_id').AsInteger;
      if nFdms_id = 0 then Exit;
    Except
      Exit;
    End;
    result := inttostr(nFdms_id + 1);
  end;
end;

function TfmEmploy.GetMaxPositionNum: integer;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := 1;

  stSql := 'Select Max(PositionNum) as MaxPosition From TB_CARD ';

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
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;

    if RecordCount < 1 then
    begin
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    end;
    if Not IsDigit(FindField('MaxPosition').AsString) then
    begin
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    end;
    result := FindField('MaxPosition').AsInteger + 1;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

function TfmEmploy.DeleteTB_DEVICECARDNO_Cardno(aCardNo: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Delete From TB_DEVICECARDNO where CA_CARDNO = ''' + aCardNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmEmploy.InsertTB_DEVICECARDNO_AllAtGrade(
  aCardNo: string): Boolean;
var
  stSql : string;
begin
    stSql := ' Insert INTO TB_DEVICECARDNO (GROUP_CODE, ';
    stSql := stSql + ' AC_NODENO, ';
    stSql := stSql + ' AC_ECUID, ';
    stSql := stSql + ' CA_CARDNO, ';
    stSql := stSql + ' DE_DOOR1, ';
    stSql := stSql + ' DE_DOOR2, ';
    stSql := stSql + ' DE_USEACCESS, ';
    stSql := stSql + ' DE_USEALARM, ';
    stSql := stSql + ' DE_TIMECODE, ';
    stSql := stSql + ' DE_PERMIT, ';
    stSql := stSql + ' DE_RCVACK, ';
    stSql := stSql + ' DE_UPDATETIME, ';
    stSql := stSql + ' DE_UPDATEOPERATOR) ';
    stSql := stSql + ' select ''' + GROUPCODE + ''', ';
    stSql := stSql + ' b.AC_NODENO, ';
    stSql := stSql + ' b.AC_ECUID, ';
    stSql := stSql + ' ''' + aCardNO + ''', ';
    stSql := stSql + ' ''Y'', ';
    stSql := stSql + ' ''Y'', ';
    stSql := stSql + ' ''Y'', ';
    stSql := stSql + ' ''Y'', ';
    stSql := stSql + ' ''0'', ';
    stSql := stSql + ' ''L'', ';
    stSql := stSql + ' ''N'', ';
    stSql := stSql + ' '''+ formatDateTime('yyyymmddHHMMSS',Now) + ''', ';
    stSql := stSql + ' '''+ Master_ID + ''' ';
    stSql := stSql + ' From TB_ACCESSDEVICE B  ';
    stSql := stSql + ' where B.GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND B.AC_ATTYPE = ''1'' ';

    result := DataModule1.ProcessExecSQL(stSql);

end;

procedure TfmEmploy.btn_ExcelClick(Sender: TObject);
var
  stRefFileName,stSaveFileName:String;
  stPrintRefPath : string;
  nExcelRowStart:integer;
  ini_fun : TiniFile;
  aFileName : string;
  stTitle : string;
begin
  btn_Excel.Enabled := False;
  stTitle := '';
  ini_fun := TiniFile.Create(ExeFolder + '\print.ini');
  stPrintRefPath := ExeFolder + '\..\PrintOutRef\' ;
  stPrintRefPath := ini_fun.ReadString('환경설정','PrintRefPath',stPrintRefPath);
  stRefFileName  := ini_fun.ReadString('사원현황','참조파일','Employee.xls');
  stRefFileName := stPrintRefPath + stRefFileName;
  nExcelRowStart := ini_fun.ReadInteger('사원현황','시작위치',6);
  ini_fun.Free;

  aFileName:='사원현황';
  SaveDialog1.FileName := aFileName;
  if SaveDialog1.Execute then
  begin
    stSaveFileName := SaveDialog1.FileName;

    if SaveDialog1.FileName <> '' then
    begin
      pan_gauge.Visible := True;
      Screen.Cursor:= crHourGlass;
      dmExcelSave.ExcelPrintOut(sg_Employ,stRefFileName,stSaveFileName,True,nExcelRowStart,stTitle,False,False,Gauge1);
    end;
  end;
  pan_gauge.Visible := False;
  Screen.Cursor:= crDefault;
  btn_Excel.Enabled := True;
end;


procedure TfmEmploy.LoadWorkType;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  WorkTypeCode.Clear;
  cmb_WorkerType.Clear;

  stSql := 'Select * from TB_ATWORKTYPE  ';
  stSql := stSql + ' Order by AW_CODE ';

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
      While Not Eof do
      begin
        WorkTypeCode.Add(FindField('AW_CODE').AsString);
        cmb_WorkerType.Items.Add(FindField('AW_NAME').AsString);
        Next;
      end;
      cmb_WorkerType.ItemIndex := 0;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmEmploy.CardReaderFormatChange(aReaderType: string);
begin
  if ReaderPort.Open then
    ReaderPort.PutString(STX + aReaderType + ETX);

end;

initialization
  RegisterClass(TfmEmploy);
Finalization
  UnRegisterClass(TfmEmploy);

end.
