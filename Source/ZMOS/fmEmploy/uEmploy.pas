unit uEmploy;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvEdit, AdvEdBtn, PlannerDatePicker, ExtCtrls, StdCtrls,
  Buttons, Grids, BaseGrid, AdvGrid, ComCtrls,DB,Jpeg, uSubForm,
  CommandArray, OoMisc, AdPort,WinSpool, AdPacket, ADODB,ActiveX,
  LMDCustomComponent, LMDFileCtrl,iniFiles, Gauges,ComObj,Imm, AdvObj;

type
  TfmEmploy = class(TfmASubForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    pn_Employ: TPanel;
    GroupBox2: TGroupBox;
    lb_CompanyName: TLabel;
    lb_DepartName: TLabel;
    lb_PosiName: TLabel;
    Label4: TLabel;
    lb_search: TLabel;
    Splitter1: TSplitter;
    lb_sabun: TLabel;
    lb_Name: TLabel;
    lb_CompanyName1: TLabel;
    lb_DepartName1: TLabel;
    lb_PosiName1: TLabel;
    Panel5: TPanel;
    Image1: TImage;
    Label11: TLabel;
    lb_Addr1: TLabel;
    btn_ZipcodeSearch: TSpeedButton;
    lb_Addr2: TLabel;
    lb_CompanyPhone: TLabel;
    btn_Image: TSpeedButton;
    Label15: TLabel;
    lb_handphone: TLabel;
    lb_inDate: TLabel;
    lb_OutDate: TLabel;
    GroupBox3: TGroupBox;
    chk_CardReg: TCheckBox;
    Label19: TLabel;
    ed_CardNo: TEdit;
    Label20: TLabel;
    cmb_RegGubun: TComboBox;
    sg_Employ: TAdvStringGrid;
    btn_Insert: TSpeedButton;
    btn_Update: TSpeedButton;
    btn_Save: TSpeedButton;
    btn_Delete: TSpeedButton;
    btn_Close: TSpeedButton;
    btn_Search: TBitBtn;
    RzOpenDialog1: TOpenDialog;
    ed_EmpImg: TEdit;
    SpeedButton1: TSpeedButton;
    chk_AutoSabun: TCheckBox;
    ADOQuery: TADOQuery;
    Panel12: TPanel;
    btn_Cancel: TSpeedButton;
    lb_JijumName1: TLabel;
    FileCtrl: TLMDFileCtrl;
    fdmsADOQuery: TADOQuery;
    lb_JijumName: TLabel;
    cmb_Company: TComboBox;
    cmb_Jijum: TComboBox;
    cmb_Depart: TComboBox;
    cmb_Posi: TComboBox;
    ed_searchText: TEdit;
    ed_sEmpNo: TEdit;
    ed_sEmpNM: TEdit;
    cmb_sCompany: TComboBox;
    cmb_sJijum: TComboBox;
    cmb_sDepart: TComboBox;
    cmb_sPosi: TComboBox;
    ed_sCompanyPhone: TEdit;
    dt_sJoinDt: TDateTimePicker;
    dt_sRetireDt: TDateTimePicker;
    ed_sZipcode: TEdit;
    ed_sAddr1: TEdit;
    ed_sAddr2: TEdit;
    ed_sHomePhone: TEdit;
    ed_sHandphone: TEdit;
    cmb_emType: TComboBox;
    lb_emType: TLabel;
    Label1: TLabel;
    lb_Count: TLabel;
    btn_Excel: TSpeedButton;
    SaveDialog1: TSaveDialog;
    pan_gauge: TPanel;
    Label2: TLabel;
    Gauge1: TGauge;
    lb_fdmsno: TLabel;
    ed_fdmsNo: TEdit;
    cmb_SearchType: TComboBox;
    ADOQuery1: TADOQuery;
    cmb_regGubun1: TComboBox;
    chk_CardRegSearch: TCheckBox;
    TempADOQuery: TADOQuery;
    gb_TimeCode: TGroupBox;
    pan_TimeCode: TPanel;
    Panel6: TPanel;
    rg_TimeCodeNotUse: TRadioButton;
    rg_TimeGroup1: TRadioButton;
    rg_TimeGroup2: TRadioButton;
    Panel7: TPanel;
    Panel8: TPanel;
    chk_TimeSun: TCheckBox;
    chk_TimeMon: TCheckBox;
    chk_TimeTue: TCheckBox;
    chk_TimeWed: TCheckBox;
    chk_TimeThu: TCheckBox;
    chk_TimeFri: TCheckBox;
    chk_TimeSat: TCheckBox;
    chk_Time1: TCheckBox;
    chk_Time2: TCheckBox;
    chk_Time3: TCheckBox;
    chk_Time4: TCheckBox;
    ActiveTimer: TTimer;
    chk_Master: TCheckBox;
    Label3: TLabel;
    cmb_WorkGubun: TComboBox;
    lb_KTNumber: TLabel;
    ed_CardNumber: TEdit;
    btn_Finger: TSpeedButton;
    lb_FingerCaption: TLabel;
    lb_FingerState: TLabel;
    ed_SelectEmCode: TEdit;
    ed_SelectCompanyCode: TEdit;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
    procedure cmb_ComPortKeyPress(Sender: TObject; var Key: Char);
    procedure cmb_RegGubunKeyPress(Sender: TObject; var Key: Char);
    procedure btn_ImageClick(Sender: TObject);
    procedure btn_UpdateClick(Sender: TObject);
    procedure btn_DeleteClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure chk_CardRegClick(Sender: TObject);
    procedure btn_ZipcodeSearchClick(Sender: TObject);
    procedure CommandArrayCommandsTCommand0Execute(Command: TCommand;
      Params: TStringList);
    procedure ApdDataPacket1StringPacket(Sender: TObject; Data: String);
    procedure cmb_DepartChange(Sender: TObject);
    procedure cmb_PosiChange(Sender: TObject);
    procedure ed_EmpNoKeyPress(Sender: TObject; var Key: Char);
    procedure ed_searchTextKeyPress(Sender: TObject; var Key: Char);
    procedure ed_sEmpNoExit(Sender: TObject);
    procedure chk_AutoSabunClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmb_JijumChange(Sender: TObject);
    procedure cmb_sJijumChange(Sender: TObject);
    procedure Panel2Resize(Sender: TObject);
    procedure btn_ExcelClick(Sender: TObject);
    procedure cmb_SearchTypeChange(Sender: TObject);
    procedure dt_sRetireDtChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ed_searchTextEnter(Sender: TObject);
    procedure cmb_regGubun1Change(Sender: TObject);
    procedure rg_TimeCodeNotUseClick(Sender: TObject);
    procedure rg_TimeGroup1Click(Sender: TObject);
    procedure rg_TimeGroup2Click(Sender: TObject);
    procedure ActiveTimerTimer(Sender: TObject);
    procedure chk_Time1Click(Sender: TObject);
    procedure chk_MasterClick(Sender: TObject);
    procedure cmb_WorkGubunChange(Sender: TObject);
    procedure cmb_RegGubunChange(Sender: TObject);
    procedure ed_CardNumberKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_FingerClick(Sender: TObject);
    procedure CommandArrayCommandsTCloseExecute(Command: TCommand;
      Params: TStringList);

  private
    L_bDupPositionNumber : Boolean;
    L_nTopRow : integer;
    L_bValidateUpdate : Boolean;
    L_stOldCardNumber : string;
    L_stOldFdmsNo : string;
    CompanyCodeList : TStringList;
    sCompanyCodeList : TStringList;
    JijumCodeList : TStringList;
    sJijumCodeList : TStringList;
    PosiCodeList : TStringList;
    sPosiCodeList : TStringList;
    DepartCodeList : TStringList;
    sDepartCodeList : TStringList;
    ComPortList : TStringList;
    EmpTypeCodeList : TStringList;
    sEmpTypeCodeList : TStringList;
    sWorkGubunCodeList : TStringList;

    State : string;
    L_stOldCardNo : string;
    AutoSabun : integer;
    { Private declarations }

    procedure FormClear;
    procedure FormEnable(aState:string);
    procedure ButtonEnable(aState:string);
    procedure ShowEmployee(aCode : string;aTopRow:integer = 0);
    procedure CheckTimeGroupView(aTimeGroup:string);
    Function CheckPositionNumber(aCardNo,aPositionNumber:string):Boolean;
    procedure ChangeFPDataApply;

//    procedure LoadsPosiCode(aCompanyCode:string;cmb_Box:TComboBox);
    procedure GridInit(sg:TStringGrid;aCol:integer);
    procedure pn_EmployInit;
    procedure pn_EmployInSertMode;
    procedure pn_EmployUpdateMode;
    Function DeleteTB_CARD(aCardNo:string):Boolean;
    Function UpdateTB_DEVICECARDNO(aCardNo,aPermit:string):Boolean; //모든 카드 권한을 삭제 처리함
    Function UpdateTB_DEVICECARDNORcvAck(aCardNo,aRcvAck:string):Boolean;
    Function DeleteTB_FingerDeviceCard_FingerNo(aFingerNo:string):Boolean;

    Function InsertTB_EMPLOYEE(aEmpID,aEmpNM,aCompanyCode,aJijumCode,aDepartCode,aPosiCod,aCompanyPhone,
                                 aJoinDate,aRetireDate,aZipcode,aAddr1,aAddr2,aHomePhone,aHandphone,
                                 aRegGubun,aCardNo,aEmpImg,afdmsId,aEmTypeCode,aTimeCodeUse,aTimeCodeGroup,
                                 aTime1,aTime2,aTime3,aTime4,aTimeWeek,aMaster,aWorkCode:string):Boolean;
    Function UpdateTB_EMPLOYEE(aEmpID,aEmpNM,aCompanyCode,aJijumCode,aDepartCode,aPosiCode,aCompanyPhone,
                                 aJoinDate,aRetireDate,aZipcode,aAddr1,aAddr2,aHomePhone,aHandphone,
                                 aRegGubun,aCardNo,aEmpImg,aEmTypeCode,aFdmsID,aTimeCodeUse,aTimeCodeGroup,
                                 aTime1,aTime2,aTime3,aTime4,aTimeWeek,aMaster,aWorkCode:string):Boolean;
    Function CheckTB_CARD(aCardNo,aCompanyCode,aEmpID,aCardType :string;var Mode:string) : Boolean;
    Function InsertTB_CARD(aCardNo,aCardGubun,aCardType,aEmpID,aCompanyCode:string) : Boolean;
    Function UpdateTB_CARD(aCardNo,aCardGubun,aCardType,aEmpID,aCompanyCode:string) : Boolean;
    Function UpdatTB_CARD_Change(aOldCardNo,aNewCardNo:string):Boolean;
    Function DeleteTB_DEVICECARDNOCardNo(aCardNo:string):Boolean;
    Function InsertTB_DEVICECARDNONotExist(aOldCardNO,aNewCardNO:string):Boolean;
    Function CopyGradeOldCard(aOldCard,aNewCard:string):Boolean;
    Function InsertTB_EMPHISCardStop(aCardNo:string):Boolean;
    Function CheckTB_EMPLOYEE(aEmpID,aCompanyCode:string):Boolean;
    Procedure RcvCardDataByReader(aData:String);
    Function UpdateTB_ACCESSEVENTCARDNO(aOldCardNo,aCardNo:string):Boolean;
    Function UpdateTB_ATEVENTCARDNO(aOldCardNo,aCardNo:string):Boolean;
    Function UpdateTB_FoodEventCARDNO(aOldCardNo,aCardNo:string):Boolean;
    Function GetFdmsID:string;
    Function GetEmployeeFdmsID(aCompanyCode,aEmpID:string):string;
    procedure FormNameSet;
    Function CheckTB_CARDFromEmployeeID(aCompanyCode,aEmpID:string):Boolean;
    Function CheckFdmsID(aFdmsNo:string):Boolean;

    Function GetMaxPositionNum : integer;
  private
    procedure iniConfigRead;
    procedure iniConfigWrite;
  public
    { Public declarations }
    function GetSerialPortList(List : TStringList; const doOpenTest : Boolean = True) : LongWord;
    function EncodeCommportName(PortNum : WORD) : String;
    function DecodeCommportName(PortName : String) : WORD;

    procedure CardReadProcess(aCardNo:string;aCheckBox:Boolean=True);
    function GetEmployeeInfo(aCardNo:string; var aCompanyCode,aEmCode:string):Boolean;
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
     uFireBird,
     uExcelSave,
     uFingerRegistDevice,
     udmAdoQuery,
     uSHFingerRegistDevice,
     DIMime,
     uSHFingerDeviceReg, uDBFunction;

{$R *.dfm}

procedure TfmEmploy.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmEmploy.FormCreate(Sender: TObject);
begin
  self.ModuleID := 'Employ';

  L_nTopRow := 1;

  if CARDLENGTHTYPE = 2 then
  begin
    lb_FingerCaption.Visible := False;
    lb_FingerState.Visible := False;
    btn_Finger.Visible := False;
  end;
end;

procedure TfmEmploy.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  iniConfigWrite;
  
  CompanyCodeList.Free;
  sCompanyCodeList.Free;
  JijumCodeList.Free;
  sJijumCodeList.Free;
  PosiCodeList.Free;
  sPosiCodeList.Free;
  DepartCodeList.Free;
  sDepartCodeList.Free;
  EmpTypeCodeList.Free;
  sEmpTypeCodeList.Free;
  sWorkGubunCodeList.Free;

//  if ApdDataPacket1 <> nil then ApdDataPacket1.Free;
//  if ReaderPort <> nil then  ReaderPort.Free;
  ComPortList.Free;
//  Delay(500);


  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'EMPLOY';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;

  Action := caFree;

end;
{
procedure TfmEmploy.LoadsPosiCode(aCompanyCode:string;cmb_Box: TComboBox);
var
  stSql :string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  sPosiCodeList.Clear;

  cmb_Box.Items.Add('');
  sPosiCodeList.Add('');
  cmb_Box.ItemIndex := 0;

  stSql := 'select * from TB_POSI ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  if (aCompanyCode = '') or (aCompanyCode = '000') then Exit;
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';

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
      cmb_Box.Items.Add(FindField('PO_NAME').AsString);
      sPosiCodeList.Add(FindField('CO_COMPANYCODE').AsString + FindField('PO_POSICODE').AsString);
      Next;
    end;

  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;
}

procedure TfmEmploy.cmb_CompanyChange(Sender: TObject);
begin
  LoadJijumCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],JijumCodeList,cmb_Jijum);
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
  LoadPosiCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],PosiCodeList,cmb_Posi);
  if G_nSearchIndex = 0 then btn_SearchClick(Self);
end;


procedure TfmEmploy.cmb_sCompanyChange(Sender: TObject);
begin
  LoadsJijumCode(sCompanyCodeList.Strings[cmb_sCompany.ItemIndex],sJijumCodeList,cmb_sJijum);
  if cmb_sJijum.ItemIndex > -1 then
  LoadsDepartCode(copy(sJijumCodeList.Strings[cmb_sJijum.ItemIndex],1,3),copy(sJijumCodeList.Strings[cmb_sJijum.ItemIndex],4,3),sDepartCodeList,cmb_sDepart);
  LoadsPosiCode(sCompanyCodeList.Strings[cmb_sCompany.ItemIndex],sPosiCodeList,cmb_sPosi);
  ed_sEmpNoExit(nil);
end;

procedure TfmEmploy.btn_SearchClick(Sender: TObject);
begin
  ShowEmployee('');
end;

procedure TfmEmploy.GridInit(sg: TStringGrid;aCol:integer);
var
  i:integer;
begin
  with sg do
  begin
    RowCount := 2;
    for i:= 0 to ColCount - 1 do
    begin
      Cells[i,1] := '';
    end;

    for i := aCol to ColCount - 1 do
    begin
      ColWidths[i] := 0;
    end;
  end;

end;

procedure TfmEmploy.pn_EmployInit;
begin
  ed_sEmpNo.Text := '';
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
  cmb_RegGubun.ItemIndex := 0;
  cmb_RegGubun.Enabled := False;
  ed_CardNo.Text := '';
  ed_CardNo.Enabled := False;
  Image1.Picture.Graphic := Nil;
  btn_Image.Enabled := False;
  btn_Finger.Enabled := False;
  ed_EmpImg.Text := '';
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
  L_stOldFdmsNo := '';

  with (Sender as TStringGrid) do
  begin
    if cells[1,Row] = '' then exit;    //사번

    ed_sEmpNo.Text := cells[1,Row];
    ed_SelectEmCode.Text := cells[1,Row];
    ed_sEmpNM.Text := cells[2,Row];
    nIndex := sCompanyCodeList.IndexOf(cells[6,Row]);
    if nIndex > -1 then  cmb_sCompany.ItemIndex := nIndex;
    ed_SelectCompanyCode.Text := cells[6,Row];

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

    nIndex := sEmpTypeCodeList.IndexOf(cells[21,Row]);
    if nIndex > -1 then cmb_emType.ItemIndex := nIndex;

    nIndex := sWorkGubunCodeList.IndexOF(cells[31,Row]);
    if nIndex > -1 then cmb_WorkGubun.ItemIndex := nIndex;

    ed_sCompanyPhone.Text := cells[10,Row];
    if length(cells[11,Row]) = 8 then
      dt_sJoinDt.Date := strToDate(copy(cells[11,Row],1,4) + '-' + copy(cells[11,Row],5,2) + '-' + copy(cells[11,Row],7,2) ) ;
    if length(cells[12,Row]) = 8 then
      dt_sRetireDt.Date := strToDate(copy(cells[12,Row],1,4) + '-' + copy(cells[12,Row],5,2) + '-' + copy(cells[12,Row],7,2) ) ;
    ed_sZipcode.Text := cells[13,Row];
    ed_sAddr1.Text := cells[14,Row];
    ed_sAddr2.Text := cells[15,Row];
    ed_sHomePhone.Text := cells[16,Row];
    ed_sHandphone.Text := cells[17,Row];

    //if  cells[18,Row] = 'Y' then
    //begin
      //여기서 이미지 로딩하자.
      MapJpg := TJpegImage.Create;
      MapStream := TMemoryStream.Create;
      stSql := ' select * from TB_EMPLOYEE ' ;
      stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
      stSql := stSql + ' AND EM_CODE = ''' + cells[1,Row] + ''' ';
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
          if Not FindField('EM_IMAGE').IsNull then
          begin
            if DBType = 'MSSQL' then
            begin
              JPEGLoadFromDB(FieldByName('EM_IMAGE'), Image1);
            end else
            begin
              stImage := FindField('EM_IMAGE').AsString;
              stImage := stringReplace(stImage,'\\','\',[rfReplaceAll]);

              if FileExists(stImage) then
                Image1.Picture.LoadFromFile(stImage);
            end;
          end;
        end;

      end;
      TempAdoQuery.Free;
      CoUninitialize;
      MapJpg.Free;
      MapStream.Free;

    //end;
    for i:= 1 to cmb_RegGubun.Items.Count - 1 do
    begin
      stTemp := copy(cmb_RegGubun.Items[i],1,1);
      if cells[20,Row] = copy(cmb_RegGubun.Items[i],1,1) then
      begin
        cmb_RegGubun.ItemIndex := i;
        break;
      end;
    end;
    ed_CardNo.Text := Trim(cells[19,Row]);
    ed_fdmsNo.Text := cells[22,Row];
    L_stOldFdmsNo := cells[22,Row];

    if DataModule1.DupCheckTB_CARDFINGER(cells[22,Row],'1') then lb_FingerState.Caption := '등록'
    else lb_FingerState.Caption := '미등록';
    

    if cells[24,Row] = '0' then rg_TimeGroup1.Checked := True
    else if cells[24,Row] = '1' then rg_TimeGroup2.Checked := True;

    if cells[23,Row] <> 'Y' then rg_TimeCodeNotUse.Checked := True;
    if cells[25,Row] = 'Y' then chk_Time1.Checked := True
    else chk_Time1.Checked := False;
    if cells[26,Row] = 'Y' then chk_Time2.Checked := True
    else chk_Time2.Checked := False;
    if cells[27,Row] = 'Y' then chk_Time3.Checked := True
    else chk_Time3.Checked := False;
    if cells[28,Row] = 'Y' then chk_Time4.Checked := True
    else chk_Time4.Checked := False;
    stTemp := cells[29,Row];
    if stTemp <> '' then
    begin
      if stTemp[7] = '1' then chk_TimeSun.Checked := True
      else chk_TimeSun.Checked := False;
      if stTemp[6] = '1' then chk_TimeMon.Checked := True
      else chk_TimeMon.Checked := False;
      if stTemp[5] = '1' then chk_TimeTue.Checked := True
      else chk_TimeTue.Checked := False;
      if stTemp[4] = '1' then chk_TimeWed.Checked := True
      else chk_TimeWed.Checked := False;
      if stTemp[3] = '1' then chk_TimeThu.Checked := True
      else chk_TimeThu.Checked := False;
      if stTemp[2] = '1' then chk_TimeFri.Checked := True
      else chk_TimeFri.Checked := False;
      if stTemp[1] = '1' then chk_TimeSat.Checked := True
      else chk_TimeSat.Checked := False;
    end;
    stTemp := cells[30,Row];
    if stTemp = 'Y' then chk_Master.Checked := True
    else chk_Master.Checked := False;
    ed_CardNumber.Text := cells[32,Row];
    L_stOldCardNumber := ed_CardNumber.Text;
  end;

end;


procedure TfmEmploy.btn_InsertClick(Sender: TObject);
var
  nIndex : integer;
  stCompanyCode : string;
begin
  L_nTopRow := sg_Employ.TopRow;
  L_bDupPositionNumber := False;

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
  if cmb_Company.ItemIndex > 0 then
  begin
    stCompanyCode := CompanyCodeList.Strings[cmb_Company.ItemIndex];
    nIndex := sCompanyCodeList.IndexOf(stCompanyCode);
    if nIndex > -1 then
    begin
      cmb_sCompany.ItemIndex := nIndex;
      LoadsJijumCode(stCompanyCode,sJijumCodeList,cmb_sJijum);
      if cmb_sJijum.ItemIndex > -1 then
        LoadsDepartCode(copy(sJijumCodeList.Strings[cmb_sJijum.ItemIndex],1,3),copy(sJijumCodeList.Strings[cmb_sJijum.ItemIndex],4,3),sDepartCodeList,cmb_sDepart);
      LoadsPosiCode(stCompanyCode,sPosiCodeList,cmb_sPosi);
    end;
  end;

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

  if chk_AutoSabun.Checked then
  begin
    ed_sEmpNo.Text := 'Z-' + FillZeroNumber(AutoSabun,5);
    chk_AutoSabun.Enabled := True;
    ed_sEmpNo.Enabled := False;
    ed_sEmpNm.SetFocus;
  end;
  
  //if Not fdmsNoAuto then
  //begin
    ed_fdmsNo.Text := GetFdmsID;
    L_stOldFdmsNo := ed_fdmsNo.Text;
  //end;
  
  L_stOldCardNo := '';
  if G_bAutoFdmsCardNo then
  begin
    ed_CardNo.Text := dmDBFunction.GetFdmsCardNo;
    L_stOldCardNo := ed_CardNo.Text;
  end;

  ed_CardNumber.Text := inttostr(GetMaxPositionNum);

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
  cmb_RegGubun.Enabled := True;
  ed_CardNo.Enabled := True;
  btn_Image.Enabled := True;
  btn_Finger.Enabled := True;
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

procedure TfmEmploy.cmb_ComPortKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    cmb_RegGubun.SetFocus;
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
    ed_EmpImg.Text := stringReplace(ed_EmpImg.Text,'\\','\',[rfReplaceAll]);

    if FileExists(ed_EmpImg.Text) then
    Image1.Picture.LoadFromFile(ed_EmpImg.Text);
  end;
end;

procedure TfmEmploy.btn_UpdateClick(Sender: TObject);
begin
  if ed_sEmpNo.Text = '' then Exit;
  
  L_bDupPositionNumber := False;

  L_nTopRow := sg_Employ.TopRow;
  
  State := 'UPDATE';

  FormEnable(State);
  ButtonEnable(State);


  L_stOldCardNo := Trim(ed_CardNo.Text) ;
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
  cmb_RegGubun.Enabled := True;
  ed_CardNo.Enabled := True;
  btn_Image.Enabled := True;
  btn_Finger.Enabled := True;
end;

procedure TfmEmploy.btn_DeleteClick(Sender: TObject);
var
  bCardDelete : Boolean;
  bResult : Boolean;
  stCompanyCode : string;
  stSql : string;
begin
  if Trim(ed_sEmpNo.Text) = '' then Exit;

  if (Application.MessageBox(PChar('데이터를 삭제하시겠습니까?'),'삭제',MB_OKCANCEL) = ID_CANCEL)  then Exit;

  bCardDelete := True;
  if ed_CardNo.Text <> '' then
  begin
    // if (Application.MessageBox(PChar('카드데이터(' + ed_CardNo.Text + ')를 삭제하시겠습니까?' ),'삭제',MB_OKCANCEL) = ID_CANCEL)  then  bCardDelete := False;
  end else bCardDelete := False;
  if DataModule1.DupCheckTB_CARDFINGER(L_stOldFdmsNo) then   //만약 지문 데이터가 있으면 다시 한번 현재 카드로 변경 해 주자
  begin
    dmAdoQuery.UpdateTB_CARDFINGER(L_stOldFdmsNo,Trim(ed_CardNo.Text),'','0','Y');
  end;

  if bCardDelete then
  begin
    if cmb_RegGubun.ItemIndex = 1 then
    begin
      ShowMessage('카드데이터를 삭제 하시려면 카드의 등록상태를 정지 시키셔야 합니다.');
      Exit;
    end;
    bResult := DeleteTB_CARD(Trim(ed_CardNo.Text));
    if Not bResult then Exit;
  end;


  if cmb_sCompany.ItemIndex < 0 then stCompanyCode := '000'
  else stCompanyCode := sCompanyCodeList.Strings[cmb_sCompany.ItemIndex];

  if Trim(stCompanyCode) = '' then stCompanyCode := '000';

  if CheckTB_CARDFromEmployeeID(stCompanyCode,ed_sEmpNo.Text) then
  begin
    ShowEmployee('',sg_Employ.TopRow);
    Exit;
  end;

  bResult := dmAdoQuery.DeleteTB_EMPLOYEE(ed_sEmpNo.Text,stCompanyCode,Trim(ed_CardNo.Text));
  //DeleteTB_FingerDeviceCard_FingerNo(sg_Employ.cells[22,sg_Employ.Row]);
  //DeleteTB_CardFinger_FingerNo(sg_Employ.cells[22,sg_Employ.Row]);

  if Not bResult then Exit;

  if G_nSearchIndex = 0 then
  begin
    ShowEmployee('',sg_Employ.TopRow);
  end else
  begin
    cmb_SearchType.ItemIndex := 0;
    ed_searchText.Text := ed_sEmpNo.Text;
    ShowEmployee('');
  end;

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
  stSql := stSql + ' DE_PERMIT = ''' + aPermit + ''', ';
  stSql := stSql + ' DE_RCVACK = ''N'' ';
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

procedure TfmEmploy.btn_SaveClick(Sender: TObject);
var
  stDepartCode : string;
  stCompanyCode : string;
  stJijumCode : string;
  stPosiCode : string;
  bResult : Boolean;
  stFdmsId : string;
  stEmTypeCode : string;
  stTimeCodeUse : string;
  stTimeCodeGroup : string;
  stTime1 : string;
  stTime2 : string;
  stTime3 : string;
  stTime4 : string;
  stTimeWeek : string;
  stMaster : string;
  stWorkCode : string;
  stCophone : string;
  stSql : string;
  bEmCodeChange : Boolean;
begin
  if Trim(ed_sEmpNo.Text) = '' then
  begin
    Showmessage(FM101 + '이 등록되지 않았습니다.');
    ed_sEmpNo.SetFocus;
    Exit;
  end;

  if Trim(ed_CardNo.Text) <> '' then
  begin
    if G_bCardFixedUse then
    begin
      if Length(Trim(ed_CardNo.Text)) <> G_nCardFixedLength then
      begin
        ed_CardNo.Text := GetFixedCardNoCheck(ed_CardNo.Text,G_bCardFixedUse,G_stCardFixedFillChar,G_nCardFixedPosition,G_nCardFixedLength);
        //showmessage('카드길이가 ' + inttostr(G_nCardFixedLength) + '자리가 아닙니다.');
        //Exit;
      end;
    end;
  end;
  if CARDLENGTHTYPE = 0 then
  begin
    if IsNumericCardNo then
    begin
      if ed_CardNo.Text <> '' then
      begin
        if Not IsDigit(ed_CardNo.Text) then
        begin
          showmessage('카드번호가 숫자가 아닙니다.');
          Exit;
        end;
        if strtoint64(ed_CardNo.Text) > 4294967295 then
        begin
          showmessage('유효하지 않은 카드번호입니다.');
          Exit;
        end;
      end;
    end else
    begin
      if ed_CardNo.Text > 'FFFFFFFF' then
      begin
        showmessage('유효하지 않은 카드번호입니다.');
        Exit;
      end;
    end;
  end;
  if L_bDupPositionNumber then
  begin
    showmessage(lb_KTNumber.caption + ' 중복입니다.');
    Exit;
  end;

  stDepartCode := '000';
  stCompanyCode := '000';
  stJijumCode := '000';
  stPosiCode := '000';
  if cmb_sCompany.ItemIndex > 0 then stCompanyCode := copy(sCompanyCodeList.Strings[cmb_sCompany.itemIndex],1,3)
  else if UpperCase(State) = 'INSERT' then
  begin
    showmessage('회사코드는 반드시 선택하셔야 합니다.');
    Exit;
  end;
  if cmb_sJijum.ItemIndex > 0 then stJijumCode := copy(sJijumCodeList.Strings[cmb_sJijum.itemIndex],4,3);
  if cmb_sDepart.ItemIndex > 0 then  stDepartCode := copy(sDepartCodeList.Strings[cmb_sDepart.itemIndex],7,3);
  if cmb_sPosi.ItemIndex > 0 then  stPosiCode := copy(sPosiCodeList.Strings[cmb_sPosi.ItemIndex],4,3);

  stEmTypeCode := '001';
  if cmb_emType.ItemIndex > 0 then stEmTypeCode := sEmpTypeCodeList.Strings[cmb_emType.ItemIndex];
  stWorkCode := '1';
  if cmb_WorkGubun.ItemIndex > 0 then stWorkCode := sWorkGubunCodeList.Strings[cmb_WorkGubun.ItemIndex];

  if Not rg_TimeCodeNotUse.Checked then stTimeCodeUse := 'Y'
  else stTimeCodeUse := 'N';
  if rg_TimeGroup2.Checked then stTimeCodeGroup := '1'
  else stTimeCodeGroup := '0';
  if chk_Time1.Checked then stTime1 := 'Y'
  else stTime1 := 'N';
  if chk_Time2.Checked then stTime2 := 'Y'
  else stTime2 := 'N';
  if chk_Time3.Checked then stTime3 := 'Y'
  else stTime3 := 'N';
  if chk_Time4.Checked then stTime4 := 'Y'
  else stTime4 := 'N';
  stTimeWeek := '1111111';
  if Not chk_TimeSun.Checked then stTimeWeek[7] := '0';
  if Not chk_TimeMon.Checked then stTimeWeek[6] := '0';
  if Not chk_TimeTue.Checked then stTimeWeek[5] := '0';
  if Not chk_TimeWed.Checked then stTimeWeek[4] := '0';
  if Not chk_TimeThu.Checked then stTimeWeek[3] := '0';
  if Not chk_TimeFri.Checked then stTimeWeek[2] := '0';
  if Not chk_TimeSat.Checked then stTimeWeek[1] := '0';
  stMaster := 'N';
  if chk_Master.Checked then stMaster := 'Y';

  stCophone :=  ed_sCompanyPhone.Text;
  if G_bEmployeeCophoneEncrypt then stCophone := MimeEncodeString(stCophone);

  if UpperCase(State) = 'INSERT' then
  begin
    //if fdmsNoAuto then stFdmsId := GetFdmsID //Insert 버튼 클릭 할때 자동으로 생성 됨
    //else
    //begin
      if Not IsDigit(ed_fdmsNo.Text) then
      begin
        showmessage('지문번호는 숫자여야 합니다.');
        Exit;
      end;
      if CheckFdmsID(ed_fdmsNo.Text) then
      begin
        showmessage('중복된 지문번호가 존재 합니다.');
        Exit;
      end;
      stFdmsId := ed_fdmsNo.Text;
    //end;
    if DataModule1.DupCheckTB_CARDFINGER(L_stOldFdmsNo) then   //만약 지문 데이터가 있으면 다시 한번 현재 카드로 변경 해 주자
    begin
      dmAdoQuery.UpdateTB_CARDFINGER(L_stOldFdmsNo,Trim(ed_CardNo.Text),'','1','Y');
    end;

    bResult := InsertTB_EMPLOYEE(ed_sEmpNo.Text,ed_sEmpNM.Text,stCompanyCode,stJijumCode,
                                 stDepartCode,stPosiCode,stCophone,
                                 FormatDateTime('yyyymmdd',dt_sJoinDt.Date),FormatDateTime('yyyymmdd',dt_sRetireDt.Date),
                                 ed_sZipcode.Text,ed_sAddr1.Text,ed_sAddr2.Text,ed_sHomePhone.Text,ed_sHandphone.Text,
                                 intTostr(cmb_RegGubun.ItemIndex),Trim(ed_CardNo.Text),ed_EmpImg.Text,stFdmsId,stEmTypeCode,
                                 stTimeCodeUse,stTimeCodeGroup,stTime1,stTime2,stTime3,stTime4,stTimeWeek,stMaster,stWorkCode);
    if bResult then     inc(AutoSabun);
  end  else if UpperCase(State) = 'UPDATE' then
  begin
    stFdmsId := ed_fdmsNo.Text;
    if(stCompanyCode <> ed_SelectCompanyCode.Text) or(ed_sEmpNo.Text <> ed_SelectEmCode.Text) then bEmCodeChange := True;
    if Not fdmsNoAuto then
    begin
      if Trim(L_stOldFdmsNo) <> Trim(ed_fdmsNo.Text) then   //선택된 지문번호가 수정 되었으면
      begin
        if CheckFdmsID(ed_fdmsNo.Text) then
        begin
          showmessage('중복된 지문번호가 존재 합니다.');
          Exit;
        end;
      end;
    end;
    if bEmCodeChange then
    begin
      if dmDBFunction.DupCheckTB_EMPLOYEE_EMCODE(stCompanyCode,ed_sEmpNo.Text) = 1 then
      begin
        showmessage('중복된 ' + FM101 + '이 존재합니다.');
        Exit;
      end;
      dmDBFunction.ChangeEmCode(ed_SelectCompanyCode.Text,ed_SelectEmCode.Text,stCompanyCode,ed_sEmpNo.Text);
    end;
(*  아래에서 카드번호 변경 되면 적용한다.
    if DataModule1.DupCheckTB_CARDFINGER(L_stOldFdmsNo) then   //만약 지문 데이터가 있으면 다시 한번 현재 카드로 변경 해 주자
    begin
      dmAdoQuery.UpdateTB_CARDFINGER(L_stOldFdmsNo,ed_CardNo.Text,'','1','Y');
    end;
*)
    bResult := UpdateTB_EMPLOYEE(ed_sEmpNo.Text,ed_sEmpNM.Text,stCompanyCode,stJijumCode,
                                 stDepartCode,stPosiCode,stCophone,
                                 FormatDateTime('yyyymmdd',dt_sJoinDt.Date),FormatDateTime('yyyymmdd',dt_sRetireDt.Date),
                                 ed_sZipcode.Text,ed_sAddr1.Text,ed_sAddr2.Text,ed_sHomePhone.Text,ed_sHandphone.Text,
                                 intTostr(cmb_RegGubun.ItemIndex),ed_CardNo.Text,ed_EmpImg.Text,stEmTypeCode,stFdmsId,
                                 stTimeCodeUse,stTimeCodeGroup,stTime1,stTime2,stTime3,stTime4,stTimeWeek,stMaster,stWorkCode);
    if L_bValidateUpdate or (L_stOldCardNumber <> ed_CardNumber.Text) then
    begin
      UpdateTB_DEVICECARDNORcvAck(ed_CardNo.Text,'N'); //유효기간,등록 구분 변경 된경우 재전송
      dmAdoQuery.UpdateTB_CARDFINGER(L_stOldFdmsNo,ed_CardNo.Text,'','1','Y');
    end;
  end;

  if L_stOldFdmsNo <> ed_fdmsNo.Text then
  begin
    //지문번호가 바뀌었다.
    if DataModule1.DupCheckTB_CARDFINGER(L_stOldFdmsNo) then
    begin
      dmAdoQuery.DeleteTB_CARDFINGER_FingerUserID(ed_fdmsNo.Text);
      dmAdoQuery.InsertIntoTB_CARDFINGER_FingerUserIDCopy(L_stOldFdmsNo,ed_fdmsNo.Text);
      dmAdoQuery.UpdateTB_CARDFINGER_FingerUserIDPermit(L_stOldFdmsNo,'0');
    end;
  end;
  if (L_stOldCardNo <> '') and (L_stOldCardNo <> ed_CardNo.Text) then
  begin
    dmAdoQuery.UpdateTB_CARDFINGER_FingerCardNoChange(ed_fdmsNo.Text,ed_CardNo.Text);
    self.FindSubForm('Main').FindCommand('STATUS').Params.Values['MESSAGE'] := ed_fdmsNo.Text + ':' + L_stOldCardNo + '/' + ed_CardNo.Text + ':Change';
    self.FindSubForm('Main').FindCommand('STATUS').Params.Values['PANEL'] := '1';
    self.FindSubForm('Main').FindCommand('STATUS').Execute;
  end;
//  if cmb_RegGubun.ItemIndex <> 1 then //정상등록 상태가 아니면
//    UpdateTB_DEVICECARDNO(ed_CardNo.Text,'N');

  if Not bResult then
  begin
    showmessage('데이터 저장에 실패하였습니다.');
    Exit;
  end;
  if G_nSearchIndex = 0 then
  begin
    if UpperCase(State) = 'INSERT' then
      ShowEmployee(stCompanyCode + ed_sEmpNo.Text)
    else
      ShowEmployee(stCompanyCode + ed_sEmpNo.Text,sg_Employ.TopRow);
  end else
  begin
    cmb_SearchType.ItemIndex := 0;
    cmb_SearchTypeChange(self);
    ed_searchText.Text := ed_sEmpNo.Text;
    ShowEmployee(stCompanyCode + ed_sEmpNo.Text);
  end;
  ChangeFPDataApply;
end;

function TfmEmploy.InsertTB_EMPLOYEE(aEmpID, aEmpNM, aCompanyCode,aJijumCode,
  aDepartCode, aPosiCod, aCompanyPhone, aJoinDate, aRetireDate, aZipcode,
  aAddr1, aAddr2, aHomePhone, aHandphone, aRegGubun, aCardNo,
  aEmpImg,afdmsID,aEmTypeCode,aTimeCodeUse,aTimeCodeGroup,aTime1,aTime2,aTime3,
  aTime4,aTimeWeek,aMaster,aWorkCode: string): Boolean;
var
  stSql : string;
  bResult : Boolean;
  stMode : string;
  stImg : string;
begin
  Result := False;
  bResult := False;
  aCardNo := Trim(aCardNo);
  bResult := CheckTB_EMPLOYEE(aEmpID,aCompanyCode);
  if bResult then
  begin
    showmessage('이미 등록되어 있는 ' + FM101 + '입니다. ' + FM101 + '을 확인하여 주세요.');
    ed_sEmpNo.SetFocus;
    Exit;
  end;

  bResult := False;
  if Length(aCardNo) <> 0 then
  begin
    if (CARDLENGTHTYPE = 0) and IsNumericCardNo then
        aCardNo := FillZeroStrNum(aCardNo,10);

    if CARDLENGTHTYPE = 0 then
    begin
      if IsNumericCardNo then
      begin
        if Not IsDigit(aCardNo) then
        begin
          showmessage('카드번호가 숫자가 아닙니다.');
          Exit;
        end;
        if strtoint64(aCardNo) > 4294967295 then
        begin
          showmessage('유효하지 않은 카드번호입니다.');
          Exit;
        end;
      end else
      begin
        if aCardNo > 'FFFFFFFF' then
        begin
          showmessage('유효하지 않은 카드번호입니다.');
          Exit;
        end;
      end;
    end;
            
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
  end;

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
  stSql := stSql + 'FDMS_ID,';
  stSql := stSql + 'FDMS_RELAY,';
  stSql := stSql + 'EM_UPDATETIME,';
  stSql := stSql + 'EM_UPDATEOPERATOR, ';
  stSql := stSql + 'RG_CODE,';
  stSql := stSql + 'DE_TIMECODEUSE,';
  stSql := stSql + 'TC_GROUP,';
  stSql := stSql + 'TC_TIME1,';
  stSql := stSql + 'TC_TIME2,';
  stSql := stSql + 'TC_TIME3,';
  stSql := stSql + 'TC_TIME4,';
  stSql := stSql + 'TC_WEEKCODE,';
  stSql := stSql + 'EM_MASTER,';
  if G_bEmployeeCophoneEncrypt then stSql := stSql + 'EM_COTELENCRYPT, ';
  stSql := stSql + 'WG_CODE)';
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
  stSql := stSql + '''001'',';
  stSql := stSql + afdmsID + ',';
  stSql := stSql + '''N'',';
  stSql := stSql + '''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',';
  stSql := stSql + '''' + Master_ID + ''', ';
  stSql := stSql + '''' + aEmTypeCode + ''',';
  stSql := stSql + '''' + aTimeCodeUse + ''',';
  stSql := stSql + '''' + aTimeCodeGroup + ''',';
  stSql := stSql + '''' + aTime1 + ''',';
  stSql := stSql + '''' + aTime2 + ''',';
  stSql := stSql + '''' + aTime3 + ''',';
  stSql := stSql + '''' + aTime4 + ''',';
  stSql := stSql + '''' + aTimeWeek + ''', ';
  stSql := stSql + '''' + aMaster + ''',  ';
  if G_bEmployeeCophoneEncrypt then stSql := stSql + '''Y'', ';
  stSql := stSql + '' + aWorkCode + ' ) ';

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
      ON E: Exception do
        begin
          DataModule1.SQLErrorLog('DBError('+ E.Message + ')' + stSql);
          Exit;
        end;
    End;

  end;

  stSql := CommonSql.InsertIntoTB_EMPHIS(aCompanyCode,aEmpID,afdmsID,'1',aCardNo,'1',
           aEmpNM,aHandphone,cmb_sCompany.Text,cmb_sJijum.Text,cmb_sDepart.Text,cmb_sPosi.Text);//입력
  result := DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_EMPLOYEECHANGE(aCompanyCode,aEmpID,aCardNo,'Employee','1');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmEmploy.UpdateTB_EMPLOYEE(aEmpID, aEmpNM, aCompanyCode,aJijumCode,
  aDepartCode, aPosiCode, aCompanyPhone, aJoinDate, aRetireDate, aZipcode,
  aAddr1, aAddr2, aHomePhone, aHandphone, aRegGubun, aCardNo,
  aEmpImg,aEmTypeCode,aFdmsID,aTimeCodeUse,aTimeCodeGroup,aTime1,aTime2,
  aTime3,aTime4,aTimeWeek,aMaster,aWorkCode: string): Boolean;
var
  stMsg : string;
  bResult : Boolean;
  stMode : string;
  stSql : string;
  stImage : string;
  stFdmsID : string;
  stCompanyName,stJijumName,stDepartName,stPosiName : string;
begin
  Result := False;

  if Length(aCardNo) <> 0 then
  begin
    if (CARDLENGTHTYPE = 0) and IsNumericCardNo then
      aCardNo := FillZeroStrNum(aCardNo,10);

    if CARDLENGTHTYPE = 0 then
    begin
      if IsNumericCardNo then
      begin
        if Not IsDigit(aCardNo) then
        begin
          showmessage('카드번호가 숫자가 아닙니다.');
          Exit;
        end;
        if strtoint64(aCardNo) > 4294967295 then
        begin
          showmessage('유효하지 않은 카드번호입니다.');
          Exit;
        end;
      end else
      begin
        if aCardNo > 'FFFFFFFF' then
        begin
          showmessage('유효하지 않은 카드번호입니다.');
          Exit;
        end;
      end;
    end;
  end;
  if (Trim(L_stOldCardNo) <> '') and (Trim(L_stOldCardNo) <> Trim(aCardNo)) then
  begin
    stMsg := '(' + L_stOldCardNo + ')카드번호 에서 (' +
        aCardNo + ') 으로 변경되었습니다. ' + #13 +
        '(' + L_stOldCardNo + ')를 정지 하시겠습니까 ';
    if (Application.MessageBox(PChar(stMsg),'변경',MB_OKCANCEL) = ID_OK)  then
    begin   
      //bResult := DeleteTB_CARD(L_stOldCardNo);
      bResult := UpdatTB_CARD_Change(L_stOldCardNo,aCardNo);
      if Not bResult then showmessage(L_stOldCardNo + ' 정지에 실패하였습니다.');
    end else
    begin
      Exit;
    end;
    //이벤트 데이터 변경
    //UpdateTB_ACCESSEVENTCARDNO(L_stOldCardNo,aCardNo);
//    UpdateTB_ATEVENTCARDNO(L_stOldCardNo,aCardNo);
//    UpdateTB_FoodEventCARDNO(L_stOldCardNo,aCardNo);

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
  end;


  stSql := 'Update TB_EMPLOYEE Set ';
  stSql := stSql + 'CO_JIJUMCODE = ''' + aJijumCode + ''',';
  stSql := stSql + 'CO_DEPARTCODE = ''' + aDepartCode + ''',';
  stSql := stSql + 'PO_POSICODE = ''' + aPosiCode + ''',';
  stSql := stSql + 'EM_NAME = ''' + aEmpNM + ''',';
  if G_bEmployeeCophoneEncrypt then stSql := stSql + 'EM_COTELENCRYPT = ''Y'', ';
  stSql := stSql + 'EM_COPHONE = ''' + aCompanyPhone + ''',';
  stSql := stSql + 'EM_HOMEPHONE = ''' + aHomePhone + ''',';
  stSql := stSql + 'EM_HANDPHONE = ''' + aHandphone + ''',';
  stSql := stSql + 'ZI_ZIPCODE = ''' + aZipcode + ''',';
  stSql := stSql + 'EM_ADDR1 = ''' + aAddr1 + ''',';
  stSql := stSql + 'EM_ADDR2 = ''' + aAddr2 + ''',';
  stSql := stSql + 'EM_JOINDATE = ''' + aJoinDate + ''',';
  stSql := stSql + 'EM_RETIREDATE = ''' + aRetireDate + ''',';
  stSql := stSql + 'FDMS_RELAY = ''N'',';
  stSql := stSql + 'FDMS_ID = ' + aFdmsID + ',';
  stSql := stSql + 'EM_UPDATETIME = ''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',';
  stSql := stSql + 'EM_UPDATEOPERATOR = ''' + Master_ID + ''', ';
  stSql := stSql + 'RG_CODE = ''' + aEmTypeCode + ''', ';
  stSql := stSql + 'DE_TIMECODEUSE = ''' + aTimeCodeUse + ''',';
  stSql := stSql + 'TC_GROUP = ''' + aTimeCodeGroup + ''',';
  stSql := stSql + 'TC_TIME1 = ''' + aTime1 + ''',';
  stSql := stSql + 'TC_TIME2 = ''' + aTime2 + ''',';
  stSql := stSql + 'TC_TIME3 = ''' + aTime3 + ''',';
  stSql := stSql + 'TC_TIME4 = ''' + aTime4 + ''',';
  stSql := stSql + 'TC_WEEKCODE= ''' + aTimeWeek + ''', ';
  stSql := stSql + 'EM_MASTER= ''' + aMaster + ''', ';
  stSql := stSql + 'WG_CODE = ' + aWorkCode + ' ';
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
        {if FileServerPath = '' then
        begin
          showmessage('파일서버 Path가 지정되지 않았습니다. 환경설정에서 파일서버 Path를 지정하세요.');
          Exit;
        end;   }
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

  stCompanyName := DataModule1.GetCompanyName(aCompanyCode);
  stJijumName := DataModule1.GetJijumName(aCompanyCode,aJijumCode);
  stDepartName := DataModule1.GetDepartName(aCompanyCode,aJijumCode,aDepartCode);
  stPosiName := DataModule1.GetPosiName(aCompanyCode,aPosiCode);

  stSql := CommonSql.InsertIntoTB_EMPHIS(aCompanyCode,aEmpID,aFdmsID,'2',aCardNo,aRegGubun,
           aEmpNM,aHandphone,stCompanyName,stJijumName,stDepartName,stPosiName);//수정
  result := DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_EMPLOYEECHANGE(aCompanyCode,aEmpID,aCardNo,'Employee','2');
  DataModule1.ProcessExecSQL(stSql);

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

      result := True;
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    end;
    
    stMsg := '(' + aCardNo + ')카드번호는 ' + FM101 + '(' +
        FindField('EM_CODE').AsString + ') 으로 등록되어 있습니다. ' + #13 +
        FM101 + '(' + aEmpID + ') 으로 변경하시겠습니까? ';

    if (Application.MessageBox(PChar(stMsg),'변경',MB_OKCANCEL) = ID_CANCEL)  then
    begin
      Result := False;
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    end;
    stMsg := '기존 카드 권한을 삭제 하시겠습니까? ';
    if (Application.MessageBox(PChar(stMsg),'변경',MB_OKCANCEL) = ID_OK)  then
    begin
      UpdateTB_DEVICECARDNO(aCardNo,'N'); //기존카드번호의 권한을 삭제합니다.
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
  result := False;
  if Length(aCardNo) = 0 then
  begin
    result := True;
    Exit;
  end;
  if Not IsDigit(aCardGubun) then aCardGubun := '1';

  if Not isDigit(ed_CardNumber.Text) then nPositionNum := GetMaxPositionNum
  else nPositionNum := strtoint(ed_CardNumber.Text);  

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

function TfmEmploy.UpdateTB_CARD(aCardNo, aCardGubun, aCardType, aEmpID,
  aCompanyCode: string): Boolean;
var
  stSql : string;
  nPositionNumber : integer;
begin
  if Length(aCardNo) = 0 then Exit;
  if isDigit(ed_CardNumber.Text) then nPositionNumber := strtoint(ed_CardNumber.Text)
  else nPositionNumber := 0;

  Result := False;
  stSql := 'Update TB_CARD SET ' ;
  stSql := stSql + ' CA_GUBUN = ''' +  aCardGubun + ''',';
  stSql := stSql + ' CA_CARDTYPE = ''' +  aCardType + ''',';
  stSql := stSql + ' EM_CODE = ''' +  aEmpID + ''',';
  stSql := stSql + ' CO_COMPANYCODE = ''' +  aCompanyCode + ''',';
  stSql := stSql + ' CA_MEMLOAD = ''N'',';
  stSql := stSql + ' CA_UPDATETIME = ''' +  FormatDateTime('yyyymmddHHMMSS',Now) + ''',';
  stSql := stSql + ' CA_UPDATEOPERATOR = ''' +  MASTER_ID + ''' ';
  if nPositionNumber <> 0 then stSql := stSql + ' ,positionnum = ' +  inttostr(nPositionNumber) + ' ';
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
{  if chk_CardReg.Checked then
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
}
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

procedure TfmEmploy.ApdDataPacket1StringPacket(Sender: TObject;
  Data: String);
begin
  RcvCardDataByReader(Data);
//  ApdDataPacket1.Enabled := True;

end;

procedure TfmEmploy.RcvCardDataByReader(aData: String);
var
  aIndex: Integer;
  aCardNo:String;
  bCardNo: int64;
  stMsg : string;
begin
  //STX 삭제
  aIndex:= Pos(#$2,aData);
  if aIndex > 0 then Delete(aData,aIndex,1);
  //ETX삭제
  aIndex:= Pos(#$3,aData);
  if aIndex > 0 then Delete(aData,aIndex,1);

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
{  if IsNumericCardNo then  //숫자변환이면
  begin
//    showmessage('숫자');
    bCardNo:= Hex2Dec64(aData);
    aCardNo:= FillZeroNumber2(bCardNo,10);
  end;

  if (CARDLENGTHTYPE = 0) and IsNumericCardNo then  //고정이며 숫자변환이면
  begin
//     showmessage('고정');
//     aCardNo:= FillZeroNumber2(bCardNo,10);
  end; }

  if Trim(ed_CardNo.Text) <> '' then
  begin
    stMsg := '(' + ed_CardNo.Text + ')카드번호가 존재 합니다. (' +
        aCardNo + ') 으로 변경하시겠습니까? ' ;
    if Trim(ed_CardNo.Text) <> aCardNo then
    begin
      if (Application.MessageBox(PChar(stMsg),'변경',MB_OKCANCEL) = ID_CANCEL)  then Exit;
      UpdatTB_CARD_Change(Trim(ed_CardNo.Text),aCardNo);
      //DeleteTB_Card(ed_CardNo.Text);
    end;
  end;
  ed_CardNo.Text := aCardNo;

end;

procedure TfmEmploy.cmb_DepartChange(Sender: TObject);
begin
  if G_nSearchIndex = 0 then btn_SearchClick(Self);
end;

procedure TfmEmploy.cmb_PosiChange(Sender: TObject);
begin
  if G_nSearchIndex = 0 then btn_SearchClick(Self);
end;

procedure TfmEmploy.ed_EmpNoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    if G_nSearchIndex = 0 then btn_SearchClick(Self);
  end;
end;

procedure TfmEmploy.ed_searchTextKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    if G_nSearchIndex = 0 then btn_SearchClick(Self);
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
    showmessage('중복된 ' + FM101 + '이 존재합니다.');
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
  if DBTYPE = 'PG' then stSql := stSql + ' AND Length(EM_CODE) = 7 '
  else stSql := stSql + ' AND Len(EM_CODE) = 7 ';

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

function TfmEmploy.UpdateTB_ACCESSEVENTCARDNO(aOldCardNo,
  aCardNo: string): Boolean;
var
  stSql :string;
begin
  stSql := 'Update TB_ACCESSEVENT set CA_CARDNO = ''' + aCardNo + ''' ';
  stSql := stSql + ' Where CA_CARDNO = ''' + aOldCardNo + ''' ';

  result := DataModule1.ProcessEventExecSQL(stSql);

end;

function TfmEmploy.UpdateTB_ATEVENTCARDNO(aOldCardNo,
  aCardNo: string): Boolean;
var
  stSql :string;
begin
  stSql := 'Update TB_ATEVENT set CA_CARDNO = ''' + aCardNo + ''' ';
  stSql := stSql + ' Where CA_CARDNO = ''' + aOldCardNo + ''' ';

  result := DataModule1.ProcessEventExecSQL(stSql);

end;

function TfmEmploy.UpdateTB_FoodEventCARDNO(aOldCardNo,
  aCardNo: string): Boolean;
var
  stSql :string;
begin
  stSql := 'Update TB_FoodEvent set CA_CARDNO = ''' + aCardNo + ''' ';
  stSql := stSql + ' Where CA_CARDNO = ''' + aOldCardNo + ''' ';

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
    if IsUpdateGrade then btn_Update.Enabled := False;
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
var
  nIndex : integer;
begin
  L_bValidateUpdate := False;
  ed_sEmpNo.Text := '';
  ed_sEmpNM.Text := '';
  cmb_sCompany.ItemIndex := 0 ;
  cmb_sJijum.Clear;
  sJijumCodeList.Clear;
  cmb_sDepart.Clear;
  sDepartCodeList.Clear;
  cmb_sPosi.ItemIndex := 0;
  nIndex := sEmpTypeCodeList.IndexOf(G_stRelayDefaultCode);
  if nIndex > -1 then cmb_EmType.ItemIndex := nIndex;
  cmb_WorkGubun.ItemIndex := 1;
  //cmb_emType.ItemIndex := 0;
  ed_sCompanyPhone.Text := '';
  dt_sJoinDt.Date := Now;
  if G_bRetireDateUse then
  begin
    dt_sRetireDt.date := Now + G_nRetireDate;
  end else
  begin
    dt_sRetireDt.Date := strToDate('9999-12-30');
  end;
  ed_sZipcode.Text := '';
  ed_sAddr1.Text := '';
  ed_sAddr2.Text := '';
  ed_sHomePhone.Text := '';
  ed_sHandphone.Text := '';
  cmb_RegGubun.ItemIndex := 1;
  ed_CardNo.Text := '';
  Image1.Picture.Graphic := Nil;
  ed_EmpImg.Text := '';
  ed_CardNumber.Text := '';
  rg_TimeCodeNotUse.Checked := True;
  rg_TimeCodeNotUseClick(Self);
  chk_Time1.Checked := True;
  chk_Time2.Checked := True;
  chk_Time3.Checked := True;
  chk_Time4.Checked := True;
  chk_TimeSun.Checked := True;
  chk_TimeMon.Checked := True;
  chk_TimeTue.Checked := True;
  chk_TimeWed.Checked := True;
  chk_TimeThu.Checked := True;
  chk_TimeFri.Checked := True;
  chk_TimeSat.Checked := True;
  chk_master.Checked := False;
  lb_FingerState.Caption := '미등록';
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
    cmb_emType.Enabled := True;
    cmb_WorkGubun.Enabled := True;
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
    cmb_RegGubun.Enabled := True;
    ed_CardNo.Enabled := True;
    btn_Image.Enabled := True;
    btn_Finger.Enabled := True;
    ed_fdmsNo.Enabled := True;
    gb_TimeCode.Enabled := True;
    chk_Master.Enabled := True;
    ed_CardNumber.Enabled := True;
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
    cmb_emType.Enabled := False;
    cmb_WorkGubun.Enabled := False;
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
    cmb_RegGubun.Enabled := False;
    ed_CardNo.Enabled := False;
    btn_Image.Enabled := False;
    btn_Finger.Enabled := False;
    ed_fdmsNo.Enabled := False;
    gb_TimeCode.Enabled := False;
    chk_Master.Enabled := False;
    ed_CardNumber.Enabled := False;
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
    cmb_emType.Enabled := False;
    cmb_WorkGubun.Enabled := False;
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
    cmb_RegGubun.Enabled := False;
    ed_CardNo.Enabled := False;
    btn_Image.Enabled := False;
    btn_Finger.Enabled := False;
    ed_fdmsNo.Enabled := False;
    gb_TimeCode.Enabled := False;
    chk_Master.Enabled := False;
    ed_CardNumber.Enabled := False;
  end else if upperCase(aState) = 'UPDATE' then
  begin
    sg_Employ.Enabled := False;
    ed_sEmpNo.Enabled := G_bUpdateEmCode;
    chk_AutoSabun.Enabled := False;
    ed_sEmpNM.Enabled := True;
    cmb_sCompany.Enabled := G_bUpdateEmCode;
    if (Not IsMaster) and ( strtoint(CompanyGrade) > 2) then cmb_sJijum.Enabled := False
    else cmb_sJijum.Enabled := True;
    cmb_sDepart.Enabled := True;
    cmb_sPosi.Enabled := True;
    cmb_emType.Enabled := True;
    cmb_WorkGubun.Enabled := True;
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
    cmb_RegGubun.Enabled := True;
    ed_CardNo.Enabled := True;
    btn_Image.Enabled := True;
    btn_Finger.Enabled := True;
    ed_fdmsNo.Enabled := True;
    gb_TimeCode.Enabled := True;
    chk_Master.Enabled := True;
    ed_CardNumber.Enabled := True;
  end;
end;

procedure TfmEmploy.ShowEmployee(aCode: string;aTopRow:integer = 0);
var
  stSql : string;
  nRow : integer;
  i : integer;
  TempAdoQuery : TADOQuery;
  bWhereSearch : Boolean;
begin
  GridInitialize(sg_Employ); //스트링그리드 초기화

  State := 'SEARCH';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);
  bWhereSearch := False;

  if DBTYPE = 'MSSQL' then stSql := MSSQL.SelectTB_EMPLOYEEJoinBase
  else if DBType = 'PG' then stSql := PostGreSql.SelectTB_EMPLOYEEJoinBase
  else if DBType = 'MDB' then stSql := MDBSql.SelectTB_EMPLOYEEJoinBase
  else if DBType = 'FB' then stSql := FireBird.SelectTB_EMPLOYEEJoinBase
  else Exit;

  if cmb_SearchType.ItemIndex = 6 then
  begin
    if cmb_regGubun1.ItemIndex > 0 then
    begin
      bWhereSearch := True;
      stSql := stSql + ' AND b.CA_CARDTYPE = ''' + copy(cmb_regGubun1.Text,1,1) + ''' '
    end;
  end else if cmb_SearchType.ItemIndex = 7 then
  begin
    if cmb_regGubun1.ItemIndex > 0 then
    begin
      bWhereSearch := True;
      stSql := stSql + ' AND a.RG_CODE = ''' + EmpTypeCodeList.Strings[cmb_regGubun1.itemIndex] + ''' '
    end;
  end else if cmb_SearchType.ItemIndex = 8 then
  begin
    if cmb_regGubun1.ItemIndex > 0 then
    begin
      bWhereSearch := True;
      stSql := stSql + ' AND b.CA_GUBUN = ''' + copy(cmb_regGubun1.Text,1,1) + ''' '
    end;
  end else
  begin
    if Trim(ed_searchText.Text) <> '' then
    begin
      if cmb_SearchType.ItemIndex < 0 then cmb_SearchType.ItemIndex := 0;
      bWhereSearch := True;

      if cmb_SearchType.ItemIndex = 0 then //사번
        stSql := stSql + ' AND a.EM_CODE = ''' + Trim(ed_searchText.Text)  + ''' '
      else if cmb_SearchType.ItemIndex = 1 then //이름
        stSql := stSql + ' AND a.EM_NAME LIKE ''%' + Trim(ed_searchText.Text)  + '%'' '
      else if cmb_SearchType.ItemIndex = 2 then //사내전화번호
        stSql := stSql + ' AND a.em_cophone LIKE ''%' + Trim(ed_searchText.Text)  + '%'' '
      else if cmb_SearchType.ItemIndex = 3 then //집전화번호
        stSql := stSql + ' AND a.em_homephone LIKE ''%' + Trim(ed_searchText.Text)  + '%'' '
      else if cmb_SearchType.ItemIndex = 4 then //휴대폰번호
        stSql := stSql + ' AND a.em_handphone LIKE ''%' + Trim(ed_searchText.Text)  + '%'' '
      else if cmb_SearchType.ItemIndex = 5 then //카드번호
        stSql := stSql + ' AND b.CA_CARDNO LIKE ''%' + Trim(ed_searchText.Text)  + '%'' '
      else if cmb_SearchType.ItemIndex = 9 then //주소1
        stSql := stSql + ' AND a.EM_ADDR1 LIKE ''%' + Trim(ed_searchText.Text)  + '%'' '
      else if cmb_SearchType.ItemIndex = 10 then //주소2
        stSql := stSql + ' AND a.EM_ADDR2 LIKE ''%' + Trim(ed_searchText.Text)  + '%'' ';
    end;
  end;

  if (Not IsMaster) and (CompanyGrade <> '0') then
  begin
    if CompanyGrade = '1' then
    begin
      if cmb_Company.ItemIndex < 1 then
      begin
        if CompanyCodeList.Count < 2 then
        begin
          showmessage('관리할수 있는 권한이 없습니다.');
          Exit;
        end;
        for i:= 1 to CompanyCodeList.Count - 1 do
        begin
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
        showmessage('관리자 소속 코드가 이상합니다.');
        Exit;
      end;
      stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + CompanyCodeList.Strings[cmb_Company.ItemIndex] + ''' ';
      if cmb_Jijum.ItemIndex < 1 then
      begin
        if JijumCodeList.Count < 2 then
        begin
          showmessage('관리할수 있는 권한이 없습니다.');
          Exit;
        end;
        for i:= 1 to JijumCodeList.Count - 1 do
        begin
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
        showmessage('관리자 소속 코드가 이상합니다.');
        Exit;
      end;
      stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + CompanyCodeList.Strings[cmb_Company.ItemIndex] + ''' ';
      if cmb_Jijum.ItemIndex < 1 then
      begin
        showmessage('관리자 소속 코드가 이상합니다.');
        Exit;
      end;
      stSql := stSql + ' AND a.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3) + ''' ';
      if cmb_Depart.ItemIndex < 1 then
      begin
        if DepartCodeList.Count < 2 then
        begin
          showmessage('관리할수 있는 권한이 없습니다.');
          Exit;
        end;
        for i:= 1 to DepartCodeList.Count - 1 do
        begin
          if i = 1 then stSql := stSql + ' AND ( '
          else stSql := stSql + ' OR ';
          stSql := stSql + ' a.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[i],7,3) + ''' ';
        end;
        stSql := stSql + ')';
      end else stSql := stSql + ' AND a.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],7,3) + ''' '; 
    end;
  end else
  begin
    if Not bWhereSearch then
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
  end;

  if Not bWhereSearch then
  begin
    if cmb_Posi.ItemIndex > 0 then
      stSql := stSql + ' AND a.PO_POSICODE = ''' + copy(PosiCodeList.Strings[cmb_Posi.ItemIndex],4,3) + ''' ';
  end;
  stSql := stSql + ' order by a.EM_CODE ';

  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;
  TempAdoQuery.DisableControls;

  Try
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

      sg_Employ.RowCount := RecordCount + 1;
      lb_Count.Caption := inttostr(Recordcount) + ' 건';
      nRow := 1;
      First;
      while Not Eof do
      begin
        with sg_Employ do
        begin
          cells[0,nRow] := FindField('COMPANYNAME').AsString;
          cells[1,nRow] := FindField('EM_CODE').AsString;
          cells[2,nRow] := FindField('EM_NAME').AsString;
          cells[3,nRow] := FindField('JIJUMNAME').AsString;
          cells[4,nRow] := FindField('DEPARTNAME').AsString;
          cells[5,nRow] := FindField('PO_NAME').AsString;
          cells[6,nRow] := FindField('CO_COMPANYCODE').AsString;
          cells[7,nRow] := FindField('CO_JIJUMCODE').AsString;
          cells[8,nRow] := FindField('CO_DEPARTCODE').AsString;
          cells[9,nRow] := FindField('PO_POSICODE').AsString;
          if FindField('EM_COTELENCRYPT').AsString = 'Y' then
          begin
            cells[10,nRow] := MimeDecodeString(FindField('EM_COPHONE').AsString);
          end else
          begin
            cells[10,nRow] := FindField('EM_COPHONE').AsString;
          end;
          cells[11,nRow] := FindField('EM_JOINDATE').AsString;
          cells[12,nRow] := FindField('EM_RETIREDATE').AsString;
          cells[13,nRow] := FindField('ZI_ZIPCODE').AsString;
          cells[14,nRow] := FindField('EM_ADDR1').AsString;
          cells[15,nRow] := FindField('EM_ADDR2').AsString;
          cells[16,nRow] := FindField('EM_HOMEPHONE').AsString;
          cells[17,nRow] := FindField('EM_HANDPHONE').AsString;
          //if FindField('EM_IMAGE').IsNull then  cells[18,nRow] := 'N'
          //else cells[18,nRow] := 'Y';
          cells[19,nRow] := FindField('CA_CARDNO').AsString;
          cells[20,nRow] := FindField('CA_CARDTYPE').AsString;
          cells[21,nRow] := FindField('RG_CODE').AsString;
          cells[22,nRow] := FindField('FDMS_ID').AsString;
          cells[23,nRow] := FindField('DE_TIMECODEUSE').AsString;
          cells[24,nRow] := FindField('TC_GROUP').AsString;
          cells[25,nRow] := FindField('TC_TIME1').AsString;
          cells[26,nRow] := FindField('TC_TIME2').AsString;
          cells[27,nRow] := FindField('TC_TIME3').AsString;
          cells[28,nRow] := FindField('TC_TIME4').AsString;
          cells[29,nRow] := FindField('TC_WEEKCODE').AsString;
          cells[30,nRow] := FindField('EM_MASTER').AsString;
          cells[31,nRow] := FindField('WG_CODE').AsString; 
          cells[32,nRow] := FindField('POSITIONNUM').AsString;

          if (FindField('CO_COMPANYCODE').AsString + FindField('EM_CODE').AsString)  = aCode then
          begin
            SelectRows(nRow,1);
          end;
          if FindField('EM_RETIREDATE').AsString < formatdateTime('yyyymmdd',now) then
          begin
            RowColor[nRow] := clYellow;
          end else
          begin
            RowColor[nRow] := clWhite;
          end;
          if FindField('WG_TYPE').AsString <> '1' then RowColor[nRow] := clYellow;
        end;
        nRow := nRow + 1;
        Next;
      end;
      if aTopRow = 0 then
      begin
        if sg_Employ.Row > 14 then sg_Employ.TopRow := sg_Employ.Row - 13;
      end else
      begin
        sg_Employ.TopRow := aTopRow;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  sg_EmployClick(sg_Employ);

end;

procedure TfmEmploy.btn_CancelClick(Sender: TObject);
var
  stCompanyCode : string;
begin
  stCompanyCode := '000';
  if cmb_sCompany.ItemIndex > 0 then stCompanyCode := copy(sCompanyCodeList.Strings[cmb_sCompany.itemIndex],1,3);
  if G_nSearchIndex = 0 then
  begin
    if UpperCase(State) = 'INSERT' then
      ShowEmployee(stCompanyCode + ed_sEmpNo.Text,L_nTopRow)
    else
      ShowEmployee(stCompanyCode + ed_sEmpNo.Text,sg_Employ.TopRow);
  end else
  begin
    if ed_searchText.Text <> '' then
    begin
      cmb_SearchType.ItemIndex := 0;
      if ed_sEmpNo.Text <> '' then
        ed_searchText.Text := ed_sEmpNo.Text
      else ed_searchText.Text := 'CANCEL';
    end;
    ShowEmployee(stCompanyCode + ed_sEmpNo.Text,sg_Employ.TopRow);

  end;
end;

procedure TfmEmploy.FormShow(Sender: TObject);
var
  nIndex : integer;
  stCompanyCode : string;
  stJijumCode : string;
begin
  CompanyCodeList := TStringList.Create;
  sCompanyCodeList := TStringList.Create;
  JijumCodeList := TStringList.Create;
  sJijumCodeList := TStringList.Create;
  PosiCodeList := TStringList.Create;
  sPosiCodeList := TStringList.Create;
  DepartCodeList := TStringList.Create;
  sDepartCodeList := TStringList.Create;
  ComPortList := TStringList.Create;
  EmpTypeCodeList := TStringList.Create;
  sEmpTypeCodeList := TStringList.Create;
  sWorkGubunCodeList := TStringList.Create;

  State := '';
  AutoSabun := 0;
  GridInit(sg_Employ,6);

  LoadCompanyCode(CompanyCodeList,cmb_Company);
  stCompanyCode := '000';
  if cmb_Company.ItemIndex > 0 then stCompanyCode := CompanyCodeList.Strings[cmb_Company.ItemIndex];
  LoadJijumCode(stCompanyCode,JijumCodeList,cmb_Jijum);
  stJijumCode := '000';
  if cmb_Jijum.ItemIndex > 0 then stJijumCode := copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3);
  LoadDepartCode(stCompanyCode,stJijumCode,DepartCodeList,cmb_Depart);
  LoadsCompanyCode(sCompanyCodeList,cmb_sCompany);
  LoadPosiCode(stCompanyCode,PosiCodeList,cmb_Posi);
  LoadsPosiCode(stCompanyCode,sPosiCodeList,cmb_sPosi);
  LoadsEmpType(sEmpTypeCodeList,cmb_EmType);
  LoadWorkGubun(sWorkGubunCodeList,cmb_WorkGubun);
  LoadEmpSearchType(cmb_SearchType);

  GridInit(sg_Employ,6);
  pn_EmployInit;

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
  end else
  begin
    if cmb_Company.ItemIndex > -1 then LoadJijumCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],JijumCodeList,cmb_Jijum);
  end;
  if cmb_Jijum.ItemIndex > -1 then LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);

  FormNameSet;
  if Not fdmsNoAuto then
  begin
    lb_fdmsno.Visible := True;
    ed_fdmsNo.Visible := True;
  end;
  iniConfigRead;
  ActiveTimer.Enabled := True;
end;

procedure TfmEmploy.cmb_JijumChange(Sender: TObject);
begin
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
  if G_nSearchIndex = 0 then btn_SearchClick(Self);
end;


procedure TfmEmploy.cmb_sJijumChange(Sender: TObject);
begin
  LoadsDepartCode(copy(sJijumCodeList.Strings[cmb_sJijum.ItemIndex],1,3),copy(sJijumCodeList.Strings[cmb_sJijum.ItemIndex],4,3),sDepartCodeList,cmb_sDepart);

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

procedure TfmEmploy.FormNameSet;
begin

  with sg_Employ do
  begin
    Cells[0,0] := FM002;
    Cells[1,0] := FM101;
    Cells[2,0] := FM102;
    Cells[3,0] := FM012;
    Cells[4,0] := FM022;
    Cells[5,0] := FM032;
    Cells[6,0] := FM001;
    Cells[7,0] := FM011;
    Cells[8,0] := FM021;
    Cells[9,0] := FM031;
    Cells[10,0] := FM103;
    Cells[11,0] := FM104;
    Cells[12,0] := FM105;
    Cells[14,0] := FM108;
    Cells[15,0] := FM109;
    Cells[17,0] := FM107;

  end;
  lb_CompanyName.Caption := FM002;
  lb_CompanyName1.Caption := FM002;

  lb_JijumName.Caption := FM012;
  lb_JijumName1.Caption := FM012;

  lb_DepartName.Caption := FM022;
  lb_DepartName1.Caption := FM022;

  lb_PosiName.Caption := FM032;
  lb_PosiName1.Caption := FM032;

  lb_emType.Caption := FM042;

  lb_sabun.Caption := FM101;
  lb_Name.Caption := FM102;
  lb_CompanyPhone.Caption := FM103;
  lb_inDate.Caption := FM104;
  lb_OutDate.Caption := FM105;
  lb_Addr1.Caption := FM108;
  lb_Addr2.Caption := FM109;
  lb_handphone.Caption := FM107;
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

procedure TfmEmploy.Panel2Resize(Sender: TObject);
var
  nWidth : integer;
  nBlock : integer;
  nLeft : integer;
  nCenter : integer;
begin
  nWidth := Panel2.Width;
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
  if G_nFileFormat = 1 then
  begin
    SaveDialog1.DefaultExt := 'csv';
    SaveDialog1.Filter := 'CSV File(*.csv)|*.csv';
  end else
  begin
    SaveDialog1.DefaultExt := 'xls';
    SaveDialog1.Filter := 'EXCEL File(*.xls)|*.xls';
  end;
  if SaveDialog1.Execute then
  begin
    stSaveFileName := SaveDialog1.FileName;

    if SaveDialog1.FileName <> '' then
    begin
      pan_gauge.Visible := True;
      Screen.Cursor:= crHourGlass;
      if G_nFileFormat = 0 then
        dmExcelSave.ExcelPrintOut(sg_Employ,stRefFileName,stSaveFileName,True,nExcelRowStart,stTitle,False,False,Gauge1)
      else if G_nFileFormat = 1 then
        sg_Employ.SaveToCSV(stSaveFileName);
    end;
  end;
  pan_gauge.Visible := False;
  Screen.Cursor:= crDefault;
  btn_Excel.Enabled := True;

end;

function TfmEmploy.CheckTB_CARDFromEmployeeID(aCompanyCode,
  aEmpID: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  Result := False;
  stSql := 'Select * from TB_CARD ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = '''  + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = '''  + aEmpID + ''' ';

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
      result := True;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  end;

end;

procedure TfmEmploy.cmb_SearchTypeChange(Sender: TObject);
begin
  lb_search.Caption := cmb_SearchType.Text;
  if cmb_SearchType.ItemIndex > 5 then
  begin
    cmb_regGubun1.Visible := True;
    ed_searchText.Visible := False;
    if cmb_SearchType.ItemIndex = 6 then LoadRegGubun(cmb_regGubun1)
    else if cmb_SearchType.ItemIndex = 7 then LoadEmpType(EmpTypeCodeList,cmb_regGubun1)
    else if cmb_SearchType.ItemIndex = 8 then LoadCardGubun(cmb_regGubun1)
    else
    begin
      cmb_regGubun1.Visible := False;
      ed_searchText.Visible := True;
    end;
  end else
  begin
    cmb_regGubun1.Visible := False;
    ed_searchText.Visible := True;
  end;
end;

function TfmEmploy.UpdatTB_CARD_Change(aOldCardNo,aNewCardNo: string): Boolean;
var
  stSql : string;
  bResult : Boolean;
begin
  Result := False;
  if aOldCardNo = '' then Exit;
  if Trim(aOldCardNo) = Trim(aNewCardNo) then Exit;
  DeleteTB_DEVICECARDNOCardNo(aNewCardNo); // 권한테이블에 새로 등록할 카드에 대한 찌꺼기가 남아 있으면 삭제
  CopyGradeOldCard(aOldCardNo,aNewCardNo); //여기서 권한을 복사 L_stStopCard -> stCardNo
  bResult := UpdateTB_DEVICECARDNO(aOldCardNo,'N'); //모든 카드 권한을 삭제 처리함
//  if Not bResult then Exit;

{  stSql := ' Update TB_CARD set CA_CARDTYPE = ''2'' ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' +  aOldCardNo + ''' ';
}
  stSql := ' delete from  TB_CARD ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' +  aOldCardNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);

  InsertTB_EMPHISCardStop(aOldCardNo);
end;

procedure TfmEmploy.dt_sRetireDtChange(Sender: TObject);
begin
  L_bValidateUpdate := True;

end;

function TfmEmploy.UpdateTB_DEVICECARDNORcvAck(aCardNo,
  aRcvAck: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Update TB_DEVICECARDNO Set ';
  stSql := stSql + ' DE_RCVACK = ''' + aRcvAck + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmEmploy.InsertTB_EMPHISCardStop(aCardNo: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stCompanyCode : string;
  stEmpID : string;
  stfdmsID : string;
  stCardType : string;
  stEmpNM : string;
  stHandphone : string;
  stCompanyName : string;
  stJijumName : string;
  stDepartName : string;
  stPosiName : string;
begin
  if DBTYPE = 'MSSQL' then stSql := MSSQL.SelectTB_CARDJoinTBEmployee
  else if DBType = 'PG' then stSql := PostGreSql.SelectTB_CARDJoinTBEmployee
  else if DBType = 'MDB' then stSql := MDBSql.SelectTB_CARDJoinTBEmployee
  else if DBType = 'FB' then stSql := FireBird.SelectTB_CARDJoinTBEmployee
  else Exit;
  stSql := stSql + ' AND a.CA_CARDNO = ''' + aCardNo + ''' ';

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
      if RecordCount = 0 then Exit;
      stCompanyCode := FindField('CO_COMPANYCODE').asstring;
      stEmpID := FindField('EM_CODE').asstring;
      stfdmsID := FindField('FDMS_ID').asstring;
      stCardType := FindField('CA_CARDTYPE').asstring;
      stEmpNM := FindField('EM_NAME').asstring;
      stHandphone := FindField('EM_HANDPHONE').asstring;
      stCompanyName := FindField('COMPANYNAME').asstring;
      stJijumName := FindField('JIJUMNAME').asstring;
      stDepartName := FindField('DEPARTNAME').asstring;
      stPosiName := FindField('PO_NAME').asstring;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  stSql := CommonSql.InsertIntoTB_EMPHIS(stCompanyCode,stEmpID,stfdmsID,'2',aCardNo,stCardType,
           stEmpNM,stHandphone,stCompanyName,stJijumName,stDepartName,stPosiName);//입력
  result := DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_EMPLOYEECHANGE(stCompanyCode,stEmpID,aCardNo,'Employee','2');
  DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmEmploy.CardReadProcess(aCardNo: string;aCheckBox:Boolean=True);
var
  stCompanyCode : string;
  stEmCode : string;
  nIndex : integer;
begin
  if (UpperCase(State) = 'INSERT') or
     (UpperCase(State) = 'UPDATE') then
  begin
    if aCheckBox and chk_CardReg.Checked then
      ed_CardNo.Text := aCardNo;
  end else
  begin
    if aCheckBox and chk_CardRegSearch.Checked then
    begin
      ed_searchText.Text := aCardNo;
      cmb_SearchType.ItemIndex := 5;
      cmb_SearchTypeChange(self);
      btn_SearchClick(self);
      (*
      if GetEmployeeInfo(aCardNo,stCompanyCode,stEmCode) then
      begin
        nIndex := CompanyCodeList.IndexOf(stCompanyCode);
        if nIndex > -1 then cmb_Company.ItemIndex := nIndex;
        cmb_SearchType.ItemIndex := 0;
        cmb_SearchTypeChange(self);
        ed_searchText.Text := stEmCode;
        btn_SearchClick(self);
      end;
      *)
    end else if Not aCheckBox then
    begin
      if GetEmployeeInfo(aCardNo,stCompanyCode,stEmCode) then
      begin
        nIndex := CompanyCodeList.IndexOf(stCompanyCode);
        if nIndex > -1 then cmb_Company.ItemIndex := nIndex;
        cmb_SearchType.ItemIndex := 0;
        cmb_SearchTypeChange(self);
        ed_searchText.Text := stEmCode;
        btn_SearchClick(self);
      end;
    end;
  end;
end;

function TfmEmploy.GetEmployeeInfo(aCardNo: string; var aCompanyCode,
  aEmCode: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := False;
  aCompanyCode := '';
  aEmCode := '';

  stSql := 'Select CO_COMPANYCODE,EM_CODE From TB_CARD '; //where positionnum is not null';
  stSql := stsql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

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

      if RecordCount < 1 then Exit;
      First;
      result := True;
      aCompanyCode := FindField('CO_COMPANYCODE').AsString;
      aEmCode := FindField('EM_CODE').AsString;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmEmploy.FormActivate(Sender: TObject);
begin
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'EMPLOY';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;

  WindowState := wsMaximized;
  gb_TimeCode.Visible := G_bTimeCodeUse;
end;

function TfmEmploy.CopyGradeOldCard(aOldCard, aNewCard: string): Boolean;
begin
  result := InsertTB_DEVICECARDNONotExist(aOldCard,aNewCard);
end;

function TfmEmploy.DeleteTB_DEVICECARDNOCardNo(aCardNo: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Delete From TB_DEVICECARDNO ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmEmploy.InsertTB_DEVICECARDNONotExist(aOldCardNO,
  aNewCardNO: string): Boolean;
var
  stSql : string;
begin
  if Trim(aNewCardNO) = '' then Exit;
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
    stSql := stSql + ' ''' + aNewCardNO + ''', ';
    stSql := stSql + ' b.DE_DOOR1, ';
    stSql := stSql + ' b.DE_DOOR2, ';
    stSql := stSql + ' b.DE_USEACCESS, ';
    stSql := stSql + ' b.DE_USEALARM, ';
    stSql := stSql + ' b.DE_TIMECODE, ';
    stSql := stSql + ' b.DE_PERMIT, ';
    stSql := stSql + ' ''N'', ';
    stSql := stSql + ' '''+ formatDateTime('yyyymmddHHMMSS',Now) + ''', ';
    stSql := stSql + ' '''+ Master_ID + ''' ';
    stSql := stSql + ' From TB_DEVICECARDNO B  ';
    stSql := stSql + ' where B.GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND B.CA_CARDNO = ''' + aOldCardNO + ''' ';
    stSql := stSql + ' AND NOT EXISTS ';
    stSql := stSql + ' (SELECT * FROM TB_DEVICECARDNO A ';
    stSql := stSql + ' WHERE A.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND A.AC_NODENO = b.AC_NODENO ';
    stSql := stSql + ' AND A.AC_ECUID = b.AC_ECUID  ';
    stSql := stSql + ' AND A.CA_CARDNO = ''' + aNewCardNO + ''')  ';

    result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmEmploy.CheckFdmsID(aFdmsNo: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  Result := False;
  stSql := 'Select * from TB_EMPLOYEE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND fdms_id = '  + aFdmsNo + ' ';

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
      result := True;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  end;
end;

procedure TfmEmploy.ed_searchTextEnter(Sender: TObject);
var
  TIMC: HIMC;
  dwSentence : DWORD;
  dwConversion : DWORD;
begin
  if Sender = ed_searchText then
  begin
    if cmb_SearchType.ItemIndex <> 1 then Exit;
  end;
  TIMC := ImmGetContext(TEdit(Sender).Handle);
  ImmGetConversionStatus(TIMC, dwConversion, dwSentence);
  ImmSetConversionStatus(TIMC, IME_CMODE_NATIVE, dwSentence); //영문시 IME_CMODE_ALPHANUMERIC
  ImmReleaseContext(TEdit(Sender).Handle, TIMC);

end;

procedure TfmEmploy.iniConfigRead;
var
  ini_fun : TiniFile;
  i : integer;
begin
  ini_fun := TiniFile.Create(ExeFolder + '\zmos.INI');
  pn_Employ.Width := ini_fun.ReadInteger('Employee','EmployeeWidth',548);
  for i := 0 to sg_Employ.ColCount - 1 do
  begin
    sg_Employ.ColWidths[i] := ini_fun.ReadInteger('Employee','EmployeeCol' + inttostr(i),120);
  end;

  ini_fun.Free;
end;

procedure TfmEmploy.iniConfigWrite;
var
  ini_fun : TiniFile;
  i : integer;
begin
  ini_fun := TiniFile.Create(ExeFolder + '\zmos.INI');
  ini_fun.WriteInteger('Employee','EmployeeWidth', pn_Employ.Width);
  for i := 0 to sg_Employ.ColCount - 1 do
  begin
    ini_fun.WriteInteger('Employee','EmployeeCol' + inttostr(i),sg_Employ.ColWidths[i]);
  end;

  ini_fun.Free;

end;

procedure TfmEmploy.cmb_regGubun1Change(Sender: TObject);
begin
  inherited;
  btn_SearchClick(self);
end;

procedure TfmEmploy.rg_TimeCodeNotUseClick(Sender: TObject);
begin
  inherited;
  pan_TimeCode.Visible := False;
  L_bValidateUpdate := True;
end;

procedure TfmEmploy.rg_TimeGroup1Click(Sender: TObject);
begin
  inherited;
  L_bValidateUpdate := True;
  pan_TimeCode.Visible := True;
  CheckTimeGroupView('0');
end;

procedure TfmEmploy.rg_TimeGroup2Click(Sender: TObject);
begin
  inherited;
  L_bValidateUpdate := True;
  pan_TimeCode.Visible := True;
  CheckTimeGroupView('1');

end;

procedure TfmEmploy.CheckTimeGroupView(aTimeGroup: string);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  stSql := 'Select * from TB_TIMECODE ';
  stSql := stSql + ' Where TC_GROUP = ''' + aTimeGroup + ''' ';
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
      if recordcount < 1 then Exit;
      chk_Time1.Caption := copy(FindField('TC_TIME1').AsString,1,2) + ':' + copy(FindField('TC_TIME1').AsString,3,2) + '-' +
                           copy(FindField('TC_TIME1').AsString,5,2) + ':' + copy(FindField('TC_TIME1').AsString,7,2);
      chk_Time2.Caption := copy(FindField('TC_TIME2').AsString,1,2) + ':' + copy(FindField('TC_TIME2').AsString,3,2) + '-' +
                           copy(FindField('TC_TIME2').AsString,5,2) + ':' + copy(FindField('TC_TIME2').AsString,7,2);
      chk_Time3.Caption := copy(FindField('TC_TIME3').AsString,1,2) + ':' + copy(FindField('TC_TIME3').AsString,3,2) + '-' +
                           copy(FindField('TC_TIME3').AsString,5,2) + ':' + copy(FindField('TC_TIME3').AsString,7,2);
      chk_Time4.Caption := copy(FindField('TC_TIME4').AsString,1,2) + ':' + copy(FindField('TC_TIME4').AsString,3,2) + '-' +
                           copy(FindField('TC_TIME4').AsString,5,2) + ':' + copy(FindField('TC_TIME4').AsString,7,2);

    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TfmEmploy.ActiveTimerTimer(Sender: TObject);
begin
  inherited;
  ActiveTimer.Enabled := False;
  if Not IsMaster then
  begin
    if IsInsertGrade then btn_Insert.Enabled := True
    else btn_Insert.Enabled := False;
    if IsUpdateGrade then btn_Update.Enabled := True
    else btn_Update.Enabled := False;
    if IsDeleteGrade then btn_Delete.Enabled := True
    else btn_Delete.Enabled := False;
  end;
  if G_nSearchIndex = 0 then  btn_SearchClick(Self);
end;

procedure TfmEmploy.chk_Time1Click(Sender: TObject);
begin
  inherited;
  L_bValidateUpdate := True;

end;

procedure TfmEmploy.chk_MasterClick(Sender: TObject);
begin
  inherited;
  L_bValidateUpdate := True;
end;

procedure TfmEmploy.cmb_WorkGubunChange(Sender: TObject);
begin
  inherited;
  L_bValidateUpdate := True;
end;

procedure TfmEmploy.cmb_RegGubunChange(Sender: TObject);
begin
  inherited;
  L_bValidateUpdate := True;
end;

procedure TfmEmploy.ed_CardNumberKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if CheckPositionNumber(ed_CardNo.Text,ed_CardNumber.Text) then L_bDupPositionNumber := True
  else L_bDupPositionNumber := False;

end;

function TfmEmploy.CheckPositionNumber(aCardNo,
  aPositionNumber: string): Boolean;
var
  stSql : string;
begin
  result := False;
  if Not isdigit(aPositionNumber) then Exit;
  if aCardNo = '' then Exit;

  stSql := 'select * from TB_CARD ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND positionnum = ' + aPositionNumber + ' ';

  with DataModule1.ADOTmpQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      Open;
    Except
      Exit;
    End;
    if RecordCount < 1 then Exit;
    if RecordCount = 1 then
    begin
      if FindField('CA_CARDNO').AsString = aCardNo then Exit; //같은 카드번호인 경우에는 빠져 나가자.
    end;
  end;
  result := True;
end;

procedure TfmEmploy.btn_FingerClick(Sender: TObject);
begin
  inherited;
  if State = 'INSERT' then L_stOldFdmsNo := ed_fdmsNo.text;
  if G_nFingerDeviceType = 0 then
  begin
    fmFingerRegistDevice := TfmFingerRegistDevice.Create(nil);
    fmFingerRegistDevice.FingerUserID := L_stOldFdmsNo;//ed_fdmsNo.text;
    fmFingerRegistDevice.FingerCardNo := Trim(ed_CardNo.text);
    fmFingerRegistDevice.ShowModal;
    if fmFingerRegistDevice.Save then
    begin
      ed_CardNo.Text := fmFingerRegistDevice.FingerCardNo;
      lb_FingerState.Caption := '등록';
    end;
    fmFingerRegistDevice.Free;
  end else if G_nFingerDeviceType = 1 then
  begin
    fmSHFingerRegistDevice := TfmSHFingerRegistDevice.Create(nil);
    fmSHFingerRegistDevice.FingerUserID := L_stOldFdmsNo;//ed_fdmsNo.text;
    fmSHFingerRegistDevice.FingerCardNo := Trim(ed_CardNo.text);
    fmSHFingerRegistDevice.FPDeviceID := strtoint(G_stFingerReaderID);
    fmSHFingerRegistDevice.FPDeviceVer := G_nFingerDeviceVer;

    fmSHFingerRegistDevice.ShowModal;
    if fmSHFingerRegistDevice.Save then
    begin
      ed_CardNo.Text := fmSHFingerRegistDevice.FingerCardNo;
      lb_FingerState.Caption := '등록';
    end;
    fmSHFingerRegistDevice.Free;
  end else if G_nFingerDeviceType = 2 then //IF1000 으로 등록 할때
  begin
    fmSHFingerDeviceReg := TfmSHFingerDeviceReg.Create(nil);
    fmSHFingerDeviceReg.FingerDeviceID := strtoint(G_stFingerReaderID) - 1;
    fmSHFingerDeviceReg.FingerUserID := L_stOldFdmsNo;//ed_fdmsNo.text;
    fmSHFingerDeviceReg.FingerCardNo := Trim(ed_CardNo.text);
    fmSHFingerDeviceReg.ShowModal;
    if fmSHFingerDeviceReg.Save then
    begin
      ed_CardNo.Text := fmSHFingerDeviceReg.FingerCardNo;
      lb_FingerState.Caption := '등록';
    end;
    fmSHFingerRegistDevice.Free;

  end;
end;

function TfmEmploy.DeleteTB_FingerDeviceCard_FingerNo(
  aFingerNo: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Delete From TB_FingerDeviceCard where FP_USERID = ' + aFingerNo + ' ';
  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmEmploy.CommandArrayCommandsTCloseExecute(Command: TCommand;
  Params: TStringList);
begin
  inherited;
  Close;
end;

procedure TfmEmploy.ChangeFPDataApply;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  stSql := ' Update TB_CARDFINGER set FP_CHANGE = ''R'' where FP_CHANGE = ''Y'' '; // 변경된 데이터를 가져오기 위함
  DataModule1.ProcessExecSQL(stSql);
  
  stSql := ' Select * from TB_CARDFINGER where FP_CHANGE = ''R'' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if recordCount <1 then Exit;
      while Not Eof do
      begin
        stSql := ' Delete From TB_FINGERDEVICECARD where FP_USERID = ' + FindField('FP_USERID').AsString + '';
        DataModule1.ProcessExecSQL(stSql);

        stSql := ' Insert Into TB_FINGERDEVICECARD ( ';
        stSql := stSql + ' FD_DEVICEID, ';
        stSql := stSql + ' FP_USERID, ';
        stSql := stSql + ' FP_PERMIT, ';
        stSql := stSql + ' FP_SEND ) ';
        stSql := stSql + ' select FD_DEVICEID,';
        stSql := stSql + ' ' + FindField('FP_USERID').AsString + ' ,';
        stSql := stSql + ' ''' + FindField('FP_PERMIT').AsString + ''',';
        stSql := stSql + ' ''N'' ';
        stSql := stSql + ' From TB_FINGERDEVICE ';

        DataModule1.ProcessExecSQL(stSql);

        stSql := ' Update TB_CARDFINGER set FP_CHANGE = ''N'' where FP_CHANGE = ''R'' and FP_USERID = ' + FindField('FP_USERID').AsString + ' ';
        DataModule1.ProcessExecSQL(stSql);

        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

initialization
  RegisterClass(TfmEmploy);
Finalization
  UnRegisterClass(TfmEmploy);

end.
