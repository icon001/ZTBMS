unit uDupCardEmploy;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvEdit, AdvEdBtn, PlannerDatePicker, ExtCtrls, StdCtrls,
  Buttons, Grids, BaseGrid, AdvGrid, ComCtrls,DB,Jpeg, uSubForm,
  CommandArray, OoMisc, AdPort,WinSpool, AdPacket, ADODB,ActiveX,
  LMDCustomComponent, LMDFileCtrl, Gauges,iniFiles,ComObj, RzCmboBx,
  Imm, AdvObj;

type
  TfmDupCardEmploy = class(TfmASubForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    pn_Employ: TPanel;
    GroupBox2: TGroupBox;
    lb_CompanyName: TLabel;
    lb_DepartName: TLabel;
    lb_PosiName: TLabel;
    Splitter1: TSplitter;
    sg_Employ: TAdvStringGrid;
    btn_Insert: TSpeedButton;
    btn_Update: TSpeedButton;
    btn_Save: TSpeedButton;
    btn_Delete: TSpeedButton;
    btn_Close: TSpeedButton;
    btn_Search: TBitBtn;
    RzOpenDialog1: TOpenDialog;
    SpeedButton1: TSpeedButton;
    ADOQuery: TADOQuery;
    Panel12: TPanel;
    btn_Cancel: TSpeedButton;
    FileCtrl: TLMDFileCtrl;
    fdmsADOQuery: TADOQuery;
    lb_JijumName: TLabel;
    GroupBox1: TGroupBox;
    Panel4: TPanel;
    chk_CardReg: TCheckBox;
    ed_CardNo: TEdit;
    btn_visitAdd: TSpeedButton;
    cmb_CardGubun: TComboBox;
    sg_Card: TAdvStringGrid;
    ADOCardQuery: TADOQuery;
    DeleteADOQuery: TADOQuery;
    cmb_Company: TComboBox;
    cmb_Jijum: TComboBox;
    cmb_Depart: TComboBox;
    cmb_Posi: TComboBox;
    Label4: TLabel;
    cmb_SearchType: TComboBox;
    ed_searchText: TEdit;
    lb_search: TLabel;
    Panel6: TPanel;
    lb_sabun: TLabel;
    ed_sEmpNo: TEdit;
    chk_AutoSabun: TCheckBox;
    lb_Name: TLabel;
    ed_sEmpNM: TEdit;
    lb_CompanyName1: TLabel;
    cmb_sCompany: TComboBox;
    lb_JijumName1: TLabel;
    cmb_sJijum: TComboBox;
    lb_DepartName1: TLabel;
    cmb_sDepart: TComboBox;
    lb_PosiName1: TLabel;
    cmb_sPosi: TComboBox;
    lb_emType: TLabel;
    cmb_emType: TComboBox;
    lb_CompanyPhone: TLabel;
    ed_sCompanyPhone: TEdit;
    lb_inDate: TLabel;
    dt_sJoinDt: TDateTimePicker;
    lb_OutDate: TLabel;
    dt_sRetireDt: TDateTimePicker;
    ed_EmpImg: TEdit;
    Label11: TLabel;
    ed_sZipcode: TEdit;
    btn_ZipcodeSearch: TSpeedButton;
    ed_sAddr1: TEdit;
    lb_Addr1: TLabel;
    lb_Addr2: TLabel;
    ed_sAddr2: TEdit;
    ed_sHomePhone: TEdit;
    Label15: TLabel;
    lb_handphone: TLabel;
    ed_sHandphone: TEdit;
    btn_Image: TSpeedButton;
    Panel5: TPanel;
    Image1: TImage;
    Splitter2: TSplitter;
    Label1: TLabel;
    lb_Count: TLabel;
    btn_Excel: TSpeedButton;
    SaveDialog1: TSaveDialog;
    pan_gauge: TPanel;
    Label2: TLabel;
    Gauge1: TGauge;
    chk_CardRegSearch: TCheckBox;
    cbCardType: TRzComboBox;
    cmb_regGubun1: TComboBox;
    lb_fdmsno: TLabel;
    ed_fdmsNo: TEdit;
    gb_TimeCode: TGroupBox;
    pan_TimeCode: TPanel;
    Panel7: TPanel;
    chk_TimeSun: TCheckBox;
    chk_TimeMon: TCheckBox;
    chk_TimeTue: TCheckBox;
    chk_TimeWed: TCheckBox;
    chk_TimeThu: TCheckBox;
    chk_TimeFri: TCheckBox;
    chk_TimeSat: TCheckBox;
    Panel8: TPanel;
    chk_Time1: TCheckBox;
    chk_Time2: TCheckBox;
    chk_Time3: TCheckBox;
    chk_Time4: TCheckBox;
    Panel9: TPanel;
    rg_TimeCodeNotUse: TRadioButton;
    rg_TimeGroup1: TRadioButton;
    rg_TimeGroup2: TRadioButton;
    chk_Master: TCheckBox;
    cmb_WorkGubun: TComboBox;
    Label3: TLabel;
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
    procedure Panel2Resize(Sender: TObject);
    procedure sg_CardCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure sg_CardButtonClick(Sender: TObject; ACol, ARow: Integer);
    procedure btn_visitAddClick(Sender: TObject);
    procedure btn_ExcelClick(Sender: TObject);
    procedure dt_sRetireDtChange(Sender: TObject);
    procedure ed_searchTextKeyPress(Sender: TObject; var Key: Char);
    procedure cmb_SearchTypeChange(Sender: TObject);
    procedure sg_CardSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure cbCardTypeChange(Sender: TObject);
    procedure cbCardTypeExit(Sender: TObject);
    procedure ed_searchTextEnter(Sender: TObject);
    procedure rg_TimeCodeNotUseClick(Sender: TObject);
    procedure rg_TimeGroup1Click(Sender: TObject);
    procedure rg_TimeGroup2Click(Sender: TObject);
    procedure chk_Time1Click(Sender: TObject);
    procedure chk_MasterClick(Sender: TObject);
    procedure CommandArrayCommandsTCloseExecute(Command: TCommand;
      Params: TStringList);

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
    EmpTypeCodeList : TStringList;
    sEmpTypeCodeList : TStringList;
    sWorkGubunCodeList : TStringList;

    State : string;
    OldCardNo : string;
    AutoSabun : integer;
    L_bVisitEditMode : Boolean;
    L_bValidateUpdate :Boolean;
    L_bCardTypeChange :Boolean;
    L_stSelectFdmsID : string;
    { Private declarations }

    procedure FormClear;
    procedure FormEnable(aState:string);
    procedure ButtonEnable(aState:string);
    procedure ShowEmployee(aCode : string;aTopRow:integer = 0);
    procedure SearchCardList(aCompanyCode,aEmCode:string);
    procedure CheckTimeGroupView(aTimeGroup:string);

    procedure LoadsPosiCode(aCompanyCode:string;cmb_Box:TComboBox);
    procedure GridInit(sg:TStringGrid;aCol:integer);
    procedure pn_EmployInit;
    procedure pn_EmployInSertMode;
    procedure pn_EmployUpdateMode;
    Function DeleteTB_CARD(aCardNo:string):Boolean;
    Function DeleteTB_CARDEmployeeNo(aCompanyCode,aEmpNo:string):Boolean;
    function DeleteTB_DEVICECARDNOEmpNo(aCompanyCode,aEmpNo:string):Boolean; //카드 테이블에 있는 사원 정보의 카드를 모두 권한삭제
    Function UpdateTB_DEVICECARDNO(aCardNo,aPermit:string):Boolean; //모든 카드 권한을 삭제 처리함
    Function UpdateTB_DEVICECARDNORcvAck(aCardNo,aRcvAck:string):Boolean;
    Function UpdateTB_DEVICECARDNOEmployeeRcvAck(aCompanyCode,aEmpID,aRcvAck:string):Boolean;
    Function InsertTB_EMPLOYEE(aEmpID,aEmpNM,aCompanyCode,aJijumCode,aDepartCode,aPosiCod,aCompanyPhone,
                                 aJoinDate,aRetireDate,aZipcode,aAddr1,aAddr2,aHomePhone,aHandphone,
                                 aRegGubun,aCardNo,aEmpImg,afdmsId,aEmTypeCode,aTimeCodeUse,aTimeCodeGroup,
                                 aTime1,aTime2,aTime3,aTime4,aTimeWeek,aMaster,aWorkCode:string):Boolean;
    Function UpdateTB_EMPLOYEE(aEmpID,aEmpNM,aCompanyCode,aJijumCode,aDepartCode,aPosiCod,aCompanyPhone,
                                 aJoinDate,aRetireDate,aZipcode,aAddr1,aAddr2,aHomePhone,aHandphone,
                                 aRegGubun,aCardNo,aEmpImg,aEmTypeCode,aFdmsId,aTimeCodeUse,aTimeCodeGroup,
                                 aTime1,aTime2,aTime3,aTime4,aTimeWeek,aMaster,aWorkCode:string):Boolean;
    Function CheckTB_CARD(aCardNo,aCompanyCode,aEmpID,aCardType,aCardGubun :string;var Mode:string) : Boolean;
    Function CheckTB_CARDEmployeeType(aCompanyCode,aEmpID,aCardNo,aCardType:string):Boolean;
    Function InsertTB_CARD(aCardNo,aCardGubun,aCardType,aEmpID,aCompanyCode,aEmpNM,aHandphone,aFdmsID,aCompanyName,aJijumName,aDepartName,aPosiName:string) : Boolean;
    Function UpdateTB_CARD(aCardNo,aCardGubun,aCardType,aEmpID,aCompanyCode,aEmpNM,aHandphone,aFdmsID,aCompanyName,aJijumName,aDepartName,aPosiName:string) : Boolean;
    Function CheckTB_EMPLOYEE(aCompanyCode,aEmpID:string):Boolean;
    Procedure RcvCardDataByReader(aData:String);
    Function UpdateTB_ACCESSEVENTCARDNO(OldCardNo,aCardNo:string):Boolean;
    Function UpdateTB_ATEVENTCARDNO(OldCardNo,aCardNo:string):Boolean;
    Function UpdateTB_FoodEventCARDNO(OldCardNo,aCardNo:string):Boolean;
    Function GetFdmsID:string;
    Function GetEmployeeFdmsID(aCompanyCode,aEmpID:string):string;
    procedure FormNameSet;
    Function CheckFdmsID(aFdmsNo:string):Boolean;

    Function GetCardTypeName(aCardType:string):string;
    Function GetMaxPositionNum : integer;
    Function GetCardNoEmployee(aCompanyCode,aEmpID:string):string;
    Function CardInfoUpdate(aCol,aRow:integer):Boolean;
    Function GetEmCodeFromCardNo(aCardNo:string;var aCompanyCode,aEmcode:string):Boolean;
  public
    { Public declarations }
    function GetSerialPortList(List : TStringList; const doOpenTest : Boolean = True) : LongWord;
    function EncodeCommportName(PortNum : WORD) : String;
    function DecodeCommportName(PortName : String) : WORD;

    procedure CardReadProcess(aCardNo:string;aCheckBox:Boolean=True);
    function GetEmployeeInfo(aCardNo:string; var aCompanyCode,aEmCode:string):Boolean;

  end;

var
  fmDupCardEmploy: TfmDupCardEmploy;

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
     udmAdoQuery,
     DIMime;

{$R *.dfm}

procedure TfmDupCardEmploy.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmDupCardEmploy.FormCreate(Sender: TObject);
begin
  self.ModuleID := 'Employ';


  L_bVisitEditMode := False;
end;

procedure TfmDupCardEmploy.FormClose(Sender: TObject; var Action: TCloseAction);
begin
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

  ComPortList.Free;
//  Delay(500);


  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'DUPCARDEMPLOY';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;

  Action := caFree;
  
end;

procedure TfmDupCardEmploy.FormActivate(Sender: TObject);
begin
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'DUPCARDEMPLOY';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;
  gb_TimeCode.Visible := G_bTimeCodeUse;
end;

procedure TfmDupCardEmploy.LoadsPosiCode(aCompanyCode:string;cmb_Box: TComboBox);
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


procedure TfmDupCardEmploy.cmb_CompanyChange(Sender: TObject);
begin
  LoadJijumCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],JijumCodeList,cmb_Jijum);
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
  LoadPosiCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],PosiCodeList,cmb_Posi);
  if G_nSearchIndex = 0 then btn_SearchClick(Self);
end;


procedure TfmDupCardEmploy.cmb_sCompanyChange(Sender: TObject);
begin
  LoadsJijumCode(sCompanyCodeList.Strings[cmb_sCompany.ItemIndex],sJijumCodeList,cmb_sJijum);
  LoadsDepartCode(copy(sJijumCodeList.Strings[cmb_sJijum.ItemIndex],1,3),copy(sJijumCodeList.Strings[cmb_sJijum.ItemIndex],4,3),sDepartCodeList,cmb_sDepart);
  LoadsPosiCode(sCompanyCodeList.Strings[cmb_sCompany.ItemIndex],cmb_sPosi);
  ed_sEmpNoExit(nil);
end;

procedure TfmDupCardEmploy.btn_SearchClick(Sender: TObject);
begin
  ShowEmployee('');
end;

procedure TfmDupCardEmploy.GridInit(sg: TStringGrid;aCol:integer);
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

procedure TfmDupCardEmploy.pn_EmployInit;
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
  ed_CardNo.Text := '';
  ed_CardNo.Enabled := False;
  Image1.Picture.Graphic := Nil;
  btn_Image.Enabled := False;
  ed_EmpImg.Text := '';
end;

procedure TfmDupCardEmploy.sg_EmployClick(Sender: TObject);
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
  L_stSelectFdmsID := '';

  with (Sender as TStringGrid) do
  begin
    if cells[1,Row] = '' then exit;    //사번

    ed_sEmpNo.Text := cells[1,Row];
    ed_sEmpNM.Text := cells[2,Row];
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
      LoadsPosiCode(cells[6,Row],cmb_sPosi);
      nIndex := sPosiCodeList.IndexOf(cells[6,Row] + cells[9,Row]);
      if nIndex > -1 then cmb_sPosi.ItemIndex := nIndex;
    end;
    
    nIndex := sEmpTypeCodeList.IndexOf(cells[19,Row]);
    if nIndex > -1 then cmb_emType.ItemIndex := nIndex;
    nIndex := sWorkGubunCodeList.IndexOf(cells[31,Row]);
    if nIndex > -1 then cmb_WorkGubun.ItemIndex := nIndex;

    ed_sCompanyPhone.Text := cells[10,Row];
    if length(cells[11,Row]) >= 8 then
      dt_sJoinDt.Date := strToDate(copy(cells[11,Row],1,4) + '-' + copy(cells[11,Row],5,2) + '-' + copy(cells[11,Row],7,2) ) ;
    if length(cells[12,Row]) >= 8 then
      dt_sRetireDt.Date := strToDate(copy(cells[12,Row],1,4) + '-' + copy(cells[12,Row],5,2) + '-' + copy(cells[12,Row],7,2) ) ;
    ed_sZipcode.Text := cells[13,Row];
    ed_sAddr1.Text := cells[14,Row];
    ed_sAddr2.Text := cells[15,Row];
    ed_sHomePhone.Text := cells[16,Row];
    ed_sHandphone.Text := cells[17,Row];
    ed_fdmsNo.Text := cells[20,Row];
    L_stSelectFdmsID := ed_fdmsNo.Text;

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

    if  cells[18,Row] = 'Y' then
    begin
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
      TempAdoQuery.Free;
      CoUninitialize;
      MapJpg.Free;
      MapStream.Free;

    end;
//    ed_CardNo.Text := cells[19,Row];
    SearchCardList(cells[6,Row],cells[1,Row]);

  end;

end;


procedure TfmDupCardEmploy.btn_InsertClick(Sender: TObject);
var
  nIndex : integer;
  stCompanyCode : string;
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
      LoadsPosiCode(stCompanyCode,cmb_sPosi);
    end;
  end;

  if strtoint(CompanyGrade) > 1 then
  begin
    nIndex := sCompanyCodeList.IndexOf(MasterCompany);
    if nIndex > -1 then cmb_sCompany.ItemIndex := nIndex;
    LoadsJijumCode(MasterCompany,sJijumCodeList,cmb_sJijum);
    LoadsPosiCode(MasterCompany,cmb_sPosi);
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

  if Not fdmsNoAuto then
    ed_fdmsNo.Text := GetFdmsID;
end;

procedure TfmDupCardEmploy.pn_EmployInSertMode;
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
  ed_CardNo.Enabled := True;
  btn_Image.Enabled := True;

end;

procedure TfmDupCardEmploy.ed_sEmpNoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    ed_sEmpNM.SetFocus;
  end;
end;

procedure TfmDupCardEmploy.cmb_sCompanyKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    cmb_sDepart.SetFocus;
  end;

end;

procedure TfmDupCardEmploy.ed_sEmpNMKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    cmb_sCompany.SetFocus;
  end;

end;

procedure TfmDupCardEmploy.cmb_sDepartKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    cmb_sPosi.SetFocus;
  end;

end;

procedure TfmDupCardEmploy.cmb_sPosiKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    ed_sCompanyPhone.SetFocus;
  end;

end;

procedure TfmDupCardEmploy.ed_sCompanyPhoneKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    dt_sJoinDt.SetFocus;
  end;

end;

procedure TfmDupCardEmploy.dt_sJoinDtKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    dt_sRetireDt.SetFocus;
  end;

end;

procedure TfmDupCardEmploy.dt_sRetireDtKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    ed_sZipcode.SetFocus;
  end;

end;

procedure TfmDupCardEmploy.ed_sZipcodeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    ed_sAddr1.SetFocus;
  end;

end;

procedure TfmDupCardEmploy.ed_sAddr1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    ed_sAddr2.SetFocus;
  end;

end;

procedure TfmDupCardEmploy.ed_sAddr2KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    ed_sHomePhone.SetFocus;
  end;

end;

procedure TfmDupCardEmploy.ed_sHomePhoneKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    ed_sHandphone.SetFocus;
  end;

end;

procedure TfmDupCardEmploy.ed_sHandphoneKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    chk_CardReg.SetFocus;
  end;

end;

procedure TfmDupCardEmploy.chk_CardRegKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    //cmb_ComPort.SetFocus;
  end;

end;

procedure TfmDupCardEmploy.cmb_ComPortKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
  end;

end;

procedure TfmDupCardEmploy.cmb_RegGubunKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    ed_CardNo.SetFocus;
  end;

end;

procedure TfmDupCardEmploy.btn_ImageClick(Sender: TObject);
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

procedure TfmDupCardEmploy.btn_UpdateClick(Sender: TObject);
begin
  if ed_sEmpNo.Text = '' then Exit;
  State := 'UPDATE';

  FormEnable(State);
  ButtonEnable(State);


  OldCardNo := ed_CardNo.Text ;
//  pn_EmployUpdateMode;
end;

procedure TfmDupCardEmploy.pn_EmployUpdateMode;
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
  ed_CardNo.Enabled := True;
  btn_Image.Enabled := True;

end;

procedure TfmDupCardEmploy.btn_DeleteClick(Sender: TObject);
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
    if (Application.MessageBox(PChar('카드데이터(' + ed_CardNo.Text + ')를 삭제하시겠습니까?' ),'삭제',MB_OKCANCEL) = ID_CANCEL)  then  bCardDelete := False;
  end else bCardDelete := False;

  if cmb_sCompany.ItemIndex < 0 then stCompanyCode := '000'
  else stCompanyCode := sCompanyCodeList.Strings[cmb_sCompany.ItemIndex];
  if Trim(stCompanyCode) = '' then stCompanyCode := '000';
  bResult := dmAdoQuery.DeleteTB_EMPLOYEE(ed_sEmpNo.Text,stCompanyCode,ed_CardNo.Text);

  if bResult then
  begin
    bResult := DeleteTB_CARDEmployeeNo(stCompanyCode,ed_sEmpNo.Text);
    //if Not bResult then Exit;
  end;


  //if Not bResult then Exit;

  if G_nSearchIndex = 0 then
  begin
    ShowEmployee('',sg_Employ.TopRow);
  end else
  begin
    cmb_SearchType.ItemIndex := 0;
    ed_searchText.Text := ed_sEmpNo.Text;
    ShowEmployee('',sg_Employ.TopRow);
  end;

end;

function TfmDupCardEmploy.DeleteTB_CARD(aCardNo: string): Boolean;
var
  stSql : string;
  bResult : Boolean;
  stFdmsID : string;
  stCompanyCode : string;
  stEmCode : string;
begin
  Result := False;
  if aCardNo = '' then Exit;
  bResult := UpdateTB_DEVICECARDNO(aCardNo,'N'); //모든 카드 권한을 삭제 처리함
  if Not bResult then Exit;

  GetEmCodeFromCardNo(aCardNo,stCompanyCode,stEmcode);

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
  //Result := True;
{  stCompanyCode := '000';
  if cmb_sCompany.ItemIndex > 0 then stCompanyCode := copy(sCompanyCodeList.Strings[cmb_sCompany.itemIndex],1,3);
  stFdmsID := GetEmployeeFdmsID(stCompanyCode,ed_sEmpNo.text);
  stSql := CommonSql.InsertIntoTB_EMPHIS(stCompanyCode,ed_sEmpNo.text,stFdmsID,'3',aCardNo,'1',
           ed_sEmpNM.text,ed_sHandphone.text,cmb_sCompany.text,cmb_sJijum.text,cmb_sDepart.text,cmb_sPosi.text);//입력
}
  stSql := CommonSql.InsertIntoTB_EMPHIS(stCompanyCode,stEmcode,'0','3',aCardNo,'1',
           '','','','','','');//입력
  result := DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_EMPLOYEECHANGE(stCompanyCode,stEmcode,aCardNo,'DupEmployee','3');
  DataModule1.ProcessExecSQL(stSql);
end;

function TfmDupCardEmploy.UpdateTB_DEVICECARDNO(aCardNo,
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

procedure TfmDupCardEmploy.btn_SaveClick(Sender: TObject);
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
begin
  if Trim(ed_sEmpNo.Text) = '' then
  begin
    Showmessage(FM101 + '이 등록되지 않았습니다.');
    ed_sEmpNo.SetFocus;
    Exit;
  end;

  stDepartCode := '000';
  stCompanyCode := '000';
  stJijumCode := '000';
  stPosiCode := '000';
  if cmb_sCompany.ItemIndex > 0 then stCompanyCode := copy(sCompanyCodeList.Strings[cmb_sCompany.itemIndex],1,3);
  if cmb_sJijum.ItemIndex > 0 then stJijumCode := copy(sJijumCodeList.Strings[cmb_sJijum.itemIndex],4,3);
  if cmb_sDepart.ItemIndex > 0 then  stDepartCode := copy(sDepartCodeList.Strings[cmb_sDepart.itemIndex],7,3);
  if cmb_sPosi.ItemIndex > 0 then  stPosiCode := copy(sPosiCodeList.Strings[cmb_sPosi.ItemIndex],4,3);

  stEmTypeCode := '001';
  if cmb_emType.ItemIndex > 0 then stEmTypeCode := sEmpTypeCodeList.Strings[cmb_emType.ItemIndex];
  stWorkCode := '1';
  if cmb_WorkGubun.ItemIndex > 0 then stWorkCode := sWorkGubunCodeList.Strings[cmb_WorkGubun.itemIndex];

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
    if fdmsNoAuto then stFdmsId := GetFdmsID
    else
    begin
      if Not IsDigit(ed_fdmsNo.Text) then
      begin
        showmessage('지문번호는 숫자여야 합니다.');
        Exit;
      end;
      if CheckFdmsID(ed_fdmsNo.Text) then
      begin
        showmessage('중복된 지문번호가 존재 합니다.');
      end;
      stFdmsId := ed_fdmsNo.Text;
    end;

    bResult := InsertTB_EMPLOYEE(ed_sEmpNo.Text,ed_sEmpNM.Text,stCompanyCode,stJijumCode,
                                 stDepartCode,stPosiCode,stCophone,
                                 FormatDateTime('yyyymmdd',dt_sJoinDt.Date),FormatDateTime('yyyymmdd',dt_sRetireDt.Date),
                                 ed_sZipcode.Text,ed_sAddr1.Text,ed_sAddr2.Text,ed_sHomePhone.Text,ed_sHandphone.Text,
                                 '1',ed_CardNo.Text,ed_EmpImg.Text,stFdmsId,stEmTypeCode,
                                 stTimeCodeUse,stTimeCodeGroup,stTime1,stTime2,stTime3,stTime4,stTimeWeek,stMaster,stWorkCode);
    if bResult then     inc(AutoSabun);
  end  else if UpperCase(State) = 'UPDATE' then
  begin
    stFdmsId := ed_fdmsNo.Text;
    if Not fdmsNoAuto then
    begin
      if Trim(L_stSelectFdmsID) <> Trim(ed_fdmsNo.Text) then   //선택된 지문번호가 수정 되었으면
      begin
        if CheckFdmsID(ed_fdmsNo.Text) then
        begin
          showmessage('중복된 지문번호가 존재 합니다.');
        end;
      end;
    end;
    bResult := UpdateTB_EMPLOYEE(ed_sEmpNo.Text,ed_sEmpNM.Text,stCompanyCode,stJijumCode,
                                 stDepartCode,stPosiCode,stCophone,
                                 FormatDateTime('yyyymmdd',dt_sJoinDt.Date),FormatDateTime('yyyymmdd',dt_sRetireDt.Date),
                                 ed_sZipcode.Text,ed_sAddr1.Text,ed_sAddr2.Text,ed_sHomePhone.Text,ed_sHandphone.Text,
                                 '1',ed_CardNo.Text,ed_EmpImg.Text,stEmTypeCode,stFdmsId,
                                 stTimeCodeUse,stTimeCodeGroup,stTime1,stTime2,stTime3,stTime4,stTimeWeek,stMaster,stWorkCode);
    if L_bValidateUpdate then
    begin
      UpdateTB_DEVICECARDNOEmployeeRcvAck(stCompanyCode,ed_sEmpNo.Text,'N'); //유효기간 변경 된경우 재전송
    end;
  end;


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

end;

function TfmDupCardEmploy.InsertTB_EMPLOYEE(aEmpID, aEmpNM, aCompanyCode,aJijumCode,
  aDepartCode, aPosiCod, aCompanyPhone, aJoinDate, aRetireDate, aZipcode,
  aAddr1, aAddr2, aHomePhone, aHandphone, aRegGubun, aCardNo,
  aEmpImg,afdmsID,aEmTypeCode,aTimeCodeUse,aTimeCodeGroup,aTime1,aTime2,aTime3,aTime4,aTimeWeek,aMaster,aWorkCode: string): Boolean;
var
  stSql : string;
  bResult : Boolean;
  stMode : string;
  stImg : string;
  stCardNo : string;
begin
  Result := False;
  bResult := False;
  bResult := CheckTB_EMPLOYEE(aCompanyCode,aEmpID);
  if bResult then
  begin
    showmessage('이미 등록되어 있는 ' + FM101 + '입니다. ' + FM101 + '을 확인하여 주세요.');
    ed_sEmpNo.SetFocus;
    Exit;
  end;

  if Trim(aCardNo)<> '' then
  begin
    bResult := False;
    if Length(aCardNo) <> 0 then
    begin
      if (CARDLENGTHTYPE = 0) and IsNumericCardNo then
          aCardNo := FillZeroStrNum(aCardNo,10);
    end;
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
    bResult := CheckTB_CARD(aCardNo,aCompanyCode,aEmpID,aRegGubun,copy(cmb_CardGubun.Text,1,1),stMode);
    if bResult then //카드번호 입력하자.
    begin
      if stMode = 'Insert' then  bResult := InsertTB_CARD(aCardNo,copy(cmb_CardGubun.Text,1,1),aRegGubun,aEmpID,aCompanyCode,aEmpNM,aHandphone,afdmsID,cmb_sCompany.text,cmb_sJijum.text,cmb_sDepart.text,cmb_sPosi.text)
      else if stMode = 'Update' then bResult := UpdateTB_CARD(aCardNo,copy(cmb_CardGubun.Text,1,1),aRegGubun,aEmpID,aCompanyCode,aEmpNM,aHandphone,afdmsID,cmb_sCompany.text,cmb_sJijum.text,cmb_sDepart.text,cmb_sPosi.text);

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
  stSql := stSql + 'EM_UPDATEOPERATOR,';
  stSql := stSql + 'RG_CODE , ';
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
  stSql := stSql + '''' + aMaster + ''', ';
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
      Exit;
    End;

  end;

  if ed_CardNo.Text <> '' then stCardNo := ed_CardNo.Text
  else
  begin
    stCardNo := GetCardNoEmployee(aCompanyCode,aEmpID);  //카드 번호를 가져 오자.
  end;

  stSql := CommonSql.InsertIntoTB_EMPHIS(aCompanyCode,aEmpID,afdmsID,'1',stCardNo,'1',
           aEmpNM,aHandphone,cmb_sCompany.text,cmb_sJijum.text,cmb_sDepart.text,cmb_sPosi.text);//입력
  result := DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_EMPLOYEECHANGE(aCompanyCode,aEmpID,stCardNo,'DupEmployee','1');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmDupCardEmploy.UpdateTB_EMPLOYEE(aEmpID, aEmpNM, aCompanyCode,aJijumCode,
  aDepartCode, aPosiCod, aCompanyPhone, aJoinDate, aRetireDate, aZipcode,
  aAddr1, aAddr2, aHomePhone, aHandphone, aRegGubun, aCardNo,
  aEmpImg,aEmTypeCode,aFdmsId,aTimeCodeUse,aTimeCodeGroup,aTime1,aTime2,aTime3,aTime4,aTimeWeek,aMaster,aWorkCode: string): Boolean;
var
  stMsg : string;
  bResult : Boolean;
  stMode : string;
  stSql : string;
  stImage : string;
  //stFdmsID : string;
begin
  //stFdmsID := GetEmployeeFdmsID(aCompanyCode,aEmpID);
  Result := False;
  if Trim(aCardNo)<> '' then
  begin
    bResult := False;
    if Length(aCardNo) <> 0 then
    begin
      if (CARDLENGTHTYPE = 0) and IsNumericCardNo then
          aCardNo := FillZeroStrNum(aCardNo,10);
    end;
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
    bResult := CheckTB_CARD(aCardNo,aCompanyCode,aEmpID,aRegGubun,copy(cmb_CardGubun.Text,1,1),stMode);
    if bResult then //카드번호 입력하자.
    begin
      if stMode = 'Insert' then  bResult := InsertTB_CARD(aCardNo,copy(cmb_CardGubun.Text,1,1),aRegGubun,aEmpID,aCompanyCode,aEmpNM,aHandphone,aFdmsId,cmb_sCompany.text,cmb_sJijum.text,cmb_sDepart.text,cmb_sPosi.text)
      else if stMode = 'Update' then bResult := UpdateTB_CARD(aCardNo,copy(cmb_CardGubun.Text,1,1),aRegGubun,aEmpID,aCompanyCode,aEmpNM,aHandphone,aFdmsId,cmb_sCompany.text,cmb_sJijum.text,cmb_sDepart.text,cmb_sPosi.text);

      if Not bResult then
      begin
        showmessage('카드등록에 실패하였습니다.관리자에게 문의 주세요.');
        Exit;
      end;
    end;
  end;
  {
  if Length(aCardNo) <> 0 then
  begin
    if (CARDLENGTHTYPE = 0) and IsNumericCardNo then
      aCardNo := FillZeroStrNum(aCardNo,10);
  end;
  if (Trim(OldCardNo) <> '') and (Trim(OldCardNo) <> aCardNo) then
  begin
    stMsg := '(' + OldCardNo + ')카드번호 에서 (' +
        aCardNo + ') 으로 변경되었습니다. ' + #13 +
        '(' + OldCardNo + ')를 삭제 하시겠습니까 ';
    if (Application.MessageBox(PChar(stMsg),'변경',MB_OKCANCEL) = ID_OK)  then
    begin
      bResult := DeleteTB_CARD(OldCardNo);
      if Not bResult then showmessage(OldCardNo + ' 삭제에 실패하였습니다. 카드관리를 이용하여 삭제 하여 주세요.');
    end;
    //이벤트 데이터 변경
    UpdateTB_ACCESSEVENTCARDNO(OldCardNo,aCardNo);
//    UpdateTB_ATEVENTCARDNO(OldCardNo,aCardNo);
//    UpdateTB_FoodEventCARDNO(OldCardNo,aCardNo);

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
  }

  stSql := 'Update TB_EMPLOYEE Set ';
  stSql := stSql + 'CO_JIJUMCODE = ''' + aJijumCode + ''',';
  stSql := stSql + 'CO_DEPARTCODE = ''' + aDepartCode + ''',';
  stSql := stSql + 'PO_POSICODE = ''' + aPosiCod + ''',';
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
  stSql := stSql + 'FDMS_ID = ' + aFdmsId + ',';
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
  
  stSql := CommonSql.InsertIntoTB_EMPHIS(aCompanyCode,aEmpID,aFdmsId,'2',ed_CardNo.Text,'1',
           ed_sEmpNM.text,ed_sHandphone.text,cmb_sCompany.text,cmb_sJijum.text,cmb_sDepart.text,cmb_sPosi.text);//수정
  result := DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_EMPLOYEECHANGE(aCompanyCode,aEmpID,ed_CardNo.Text,'DupEmployee','2');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmDupCardEmploy.CheckTB_CARD(aCardNo, aCompanyCode,
  aEmpID,aCardType,aCardGubun: string;var Mode:string): Boolean;
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
      if FindField('CA_GUBUN').AsString <> aCardGubun then  Result := True;

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
//    UpdateTB_DEVICECARDNO(aCardNo,'N'); //기존카드번호의 권한을 삭제합니다.
  end;
  TempAdoQuery.Free;
  CoUninitialize;

end;

function TfmDupCardEmploy.InsertTB_CARD(aCardNo, aCardGubun, aCardType, aEmpID,
  aCompanyCode,aEmpNM,aHandphone,aFdmsID,aCompanyName,aJijumName,aDepartName,aPosiName: string): Boolean;
var
  stSql : string;
  nPositionNum : integer;
begin
  result := False;
  if Length(aCardNo) = 0 then Exit;
  if Not IsDigit(aCardGubun) then aCardGubun := '1';

  nPositionNum := GetMaxPositionNum;

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
{  if result then
  begin
    if UpperCase(fdmsUses) = 'TRUE' then
    begin
      if aCardType = '1' then
      begin
        stFdmsID := GetEmployeeFdmsID(aCompanyCode,aEmpID);
        if stFdmsID = '0' then stFdmsId := GetFdmsID;

        stSql := CommonSql.InsertIntoTB_EMPHIS(aCompanyCode,aEmpID,stFdmsID,'1',aCardNo,'1');//입력
        result := DataModule1.ProcessExecSQL(stSql);
      end;
    end else
    begin
    end;
  end; }

  stSql := CommonSql.InsertIntoTB_EMPHIS(aCompanyCode,aEmpID,aFdmsID,'1',aCardNo,aCardType,
           aEmpNM,aHandphone,aCompanyName,aJijumName,aDepartName,aPosiName);//입력
  result := DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_EMPLOYEECHANGE(aCompanyCode,aEmpID,aCardNo,'DupEmployee','1');
  DataModule1.ProcessExecSQL(stSql);
end;

function TfmDupCardEmploy.UpdateTB_CARD(aCardNo, aCardGubun, aCardType, aEmpID,
  aCompanyCode,aEmpNM,aHandphone,aFdmsID,aCompanyName,aJijumName,aDepartName,aPosiName: string): Boolean;
var
  stSql : string;
begin
  if Length(aCardNo) = 0 then Exit;
  if Not IsDigit(aCardGubun) then aCardGubun := '1';

  Result := False;
  stSql := 'Update TB_CARD SET ' ;
  stSql := stSql + ' CA_GUBUN = ''' +  aCardGubun + ''',';
  stSql := stSql + ' CA_CARDTYPE = ''' +  aCardType + ''',';
  stSql := stSql + ' EM_CODE = ''' +  aEmpID + ''',';
  stSql := stSql + ' CO_COMPANYCODE = ''' +  aCompanyCode + ''',';
  stSql := stSql + ' CA_MEMLOAD = ''N'',';
  stSql := stSql + ' CA_UPDATETIME = ''' +  FormatDateTime('yyyymmddHHMMSS',Now) + ''',';
  stSql := stSql + ' CA_UPDATEOPERATOR = ''' +  MASTER_ID + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' +  GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' +  aCardNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_EMPHIS(aCompanyCode,aEmpID,aFdmsID,'2',aCardNo,aCardType,
           aEmpNM,aHandphone,aCompanyName,aJijumName,aDepartName,aPosiName);//입력
  result := DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_EMPLOYEECHANGE(aCompanyCode,aEmpID,aCardNo,'DupEmployee','2');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmDupCardEmploy.CheckTB_EMPLOYEE(aCompanyCode,aEmpID : string): Boolean;
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

procedure TfmDupCardEmploy.chk_CardRegClick(Sender: TObject);
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

procedure TfmDupCardEmploy.btn_ZipcodeSearchClick(Sender: TObject);
begin
  fmZipCode:= TfmZipCode.Create(Self);
  fmZipCode.CallingModuleID := 'TfmEmploy';
  fmZipCode.SHowmodal;
  fmZipCode.Free;

end;

procedure TfmDupCardEmploy.CommandArrayCommandsTCommand0Execute(Command: TCommand;
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

function TfmDupCardEmploy.GetSerialPortList(List: TStringList;
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

function TfmDupCardEmploy.DecodeCommportName(PortName: String): WORD;
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

function TfmDupCardEmploy.EncodeCommportName(PortNum: WORD): String;
begin
 if PortNum < 10
    then Result := 'COM' + IntToStr(PortNum) + ':'
    else Result := '\\.\COM'+IntToStr(PortNum);

end;

procedure TfmDupCardEmploy.cmb_ComPortChange(Sender: TObject);
begin
{  if cmb_ComPort.text = '' then Exit;
  if ReaderPort.Open then ReaderPort.Open := False;
  ReaderPort.ComNumber := Integer(ComPortList.Objects[cmb_ComPort.ItemIndex]);
  //ReaderPort.ComNumber := strtoint(copy(cmb_ComPort.text,4,Pos(':',cmb_ComPort.text) -4));
  ReaderPort.Open := true;    }
end;

procedure TfmDupCardEmploy.ApdDataPacket1StringPacket(Sender: TObject;
  Data: String);
begin
  RcvCardDataByReader(Data);
//  ApdDataPacket1.Enabled := True;

end;

procedure TfmDupCardEmploy.RcvCardDataByReader(aData: String);
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
{  if Trim(ed_CardNo.Text) <> '' then
  begin
    stMsg := '(' + ed_CardNo.Text + ')카드번호가 존재 합니다. (' +
        aCardNo + ') 으로 변경하시겠습니까? ' ;
    if Trim(ed_CardNo.Text) <> aCardNo then
    begin
      if (Application.MessageBox(PChar(stMsg),'변경',MB_OKCANCEL) = ID_CANCEL)  then Exit;
    end;
  end; }
  ed_CardNo.Text := aCardNo;

end;

procedure TfmDupCardEmploy.cmb_DepartChange(Sender: TObject);
begin
  if G_nSearchIndex = 0 then btn_SearchClick(Self);
end;

procedure TfmDupCardEmploy.cmb_PosiChange(Sender: TObject);
begin
  if G_nSearchIndex = 0 then btn_SearchClick(Self);
end;

procedure TfmDupCardEmploy.ed_EmpNoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    if G_nSearchIndex = 0 then btn_SearchClick(Self);
  end;
end;

procedure TfmDupCardEmploy.ed_EmpNMKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    if G_nSearchIndex = 0 then btn_SearchClick(Self);
  end;

end;


procedure TfmDupCardEmploy.ed_sEmpNoExit(Sender: TObject);
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

procedure TfmDupCardEmploy.chk_AutoSabunClick(Sender: TObject);
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

function TfmDupCardEmploy.UpdateTB_ACCESSEVENTCARDNO(OldCardNo,
  aCardNo: string): Boolean;
var
  stSql :string;
begin
  stSql := 'Update TB_ACCESSEVENT set CA_CARDNO = ''' + aCardNo + ''' ';
  stSql := stSql + ' Where CA_CARDNO = ''' + aCardNo + ''' ';

  result := DataModule1.ProcessEventExecSQL(stSql);

end;

function TfmDupCardEmploy.UpdateTB_ATEVENTCARDNO(OldCardNo,
  aCardNo: string): Boolean;
var
  stSql :string;
begin
  stSql := 'Update TB_ATEVENT set CA_CARDNO = ''' + aCardNo + ''' ';
  stSql := stSql + ' Where CA_CARDNO = ''' + aCardNo + ''' ';

  result := DataModule1.ProcessEventExecSQL(stSql);

end;

function TfmDupCardEmploy.UpdateTB_FoodEventCARDNO(OldCardNo,
  aCardNo: string): Boolean;
var
  stSql :string;
begin
  stSql := 'Update TB_FoodEvent set CA_CARDNO = ''' + aCardNo + ''' ';
  stSql := stSql + ' Where CA_CARDNO = ''' + OldCardNo + ''' ';

  result := DataModule1.ProcessEventExecSQL(stSql);

end;

procedure TfmDupCardEmploy.ButtonEnable(aState: string);
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

procedure TfmDupCardEmploy.FormClear;
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
  ed_CardNo.Text := '';
  Image1.Picture.Graphic := Nil;
  ed_EmpImg.Text := '';
  GridInitialize(sg_Card); //스트링그리드 초기화
  sg_Card.ClearRows(1,1);
  ed_CardNo.Text := '';
  chk_master.Checked := False;

end;

procedure TfmDupCardEmploy.FormEnable(aState: string);
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
    ed_CardNo.Enabled := True;
    btn_Image.Enabled := True;
    sg_Card.Options := sg_Card.Options + [goEditing];
    btn_visitAdd.Enabled := True;
    cmb_CardGubun.Enabled := True;
    L_bVisitEditMode := True;
    ed_fdmsNo.Enabled := True;
    chk_Master.Enabled := True;
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
    ed_CardNo.Enabled := False;
    btn_Image.Enabled := False;
    sg_Card.Options := sg_Card.Options - [goEditing];
    btn_visitAdd.Enabled := False;
    cmb_CardGubun.Enabled := False;
    L_bVisitEditMode := False;
    ed_fdmsNo.Enabled := False;
    chk_Master.Enabled := False;
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
    ed_CardNo.Enabled := False;
    btn_Image.Enabled := False;
    sg_Card.Options := sg_Card.Options - [goEditing];
    btn_visitAdd.Enabled := False;
    cmb_CardGubun.Enabled := False;
    L_bVisitEditMode := False;
    ed_fdmsNo.Enabled := False;
    chk_Master.Enabled := False;
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
    ed_CardNo.Enabled := True;
    btn_Image.Enabled := True;
    sg_Card.Options := sg_Card.Options + [goEditing];
    btn_visitAdd.Enabled := True;
    cmb_CardGubun.Enabled := True;
    L_bVisitEditMode := True;
    ed_fdmsNo.Enabled := True;
    chk_Master.Enabled := True;
  end;
end;

procedure TfmDupCardEmploy.ShowEmployee(aCode: string;aTopRow:integer = 0);
var
  stSql : string;
  nRow : integer;
  i : integer;
  TempAdoQuery : TADOQuery;
  bWhereSearch : Boolean;
begin
  GridInitialize(sg_Employ); //스트링그리드 초기화
  lb_Count.Caption := ' 건';
  
  State := 'SEARCH';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);
  bWhereSearch := False;

  if DBTYPE = 'MSSQL' then stSql := MSSQL.SelectTB_EMPLOYEEDupCardJoinBase
  else if DBType = 'PG' then stSql := PostGreSql.SelectTB_EMPLOYEEDupCardJoinBase
  else if DBType = 'MDB' then stSql := MDBSql.SelectTB_EMPLOYEEDupCardJoinBase
  else if DBType = 'FB' then stSql := FireBird.SelectTB_EMPLOYEEDupCardJoinBase
  else Exit;

  if (cmb_SearchType.ItemIndex = 5) then  //카드번호
  begin
    if Trim(ed_searchText.Text) <> '' then
    begin
      stSql := stSql + ' Inner Join TB_CARD g ';
      stSql := stSql + ' ON ( a.GROUP_CODE = g.GROUP_CODE ';
      stSql := stSql + ' AND a.CO_COMPANYCODE = g.CO_COMPANYCODE  ';
      stSql := stSql + ' AND a.EM_CODE = g.EM_CODE ) ';
    end;
  end;
  if (cmb_SearchType.ItemIndex = 6) or  //카드등록구분
     (cmb_SearchType.ItemIndex = 8) then //카드타입
  begin
    if cmb_regGubun1.ItemIndex > 0 then
    begin
      stSql := stSql + ' Inner Join TB_CARD g ';
      stSql := stSql + ' ON ( a.GROUP_CODE = g.GROUP_CODE ';
      stSql := stSql + ' AND a.CO_COMPANYCODE = g.CO_COMPANYCODE  ';
      stSql := stSql + ' AND a.EM_CODE = g.EM_CODE ) ';
    end;
  end;

  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';

  if cmb_SearchType.ItemIndex = 6 then
  begin
    if cmb_regGubun1.ItemIndex > 0 then
    begin
      bWhereSearch := True;
      stSql := stSql + ' AND g.CA_CARDTYPE = ''' + copy(cmb_regGubun1.Text,1,1) + ''' '
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
      stSql := stSql + ' AND g.CA_GUBUN = ''' + copy(cmb_regGubun1.Text,1,1) + ''' '
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
        stSql := stSql + ' AND g.CA_CARDNO LIKE ''%' + Trim(ed_searchText.Text)  + '%'' '
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
      lb_Count.Caption := '0 건';
      TempAdoQuery.Free;
      CoUninitialize;
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
        if FindField('EM_IMAGE').IsNull then  cells[18,nRow] := 'N'
        else cells[18,nRow] := 'Y';
        cells[19,nRow] := FindField('RG_CODE').AsString;
        cells[20,nRow] := FindField('FDMS_ID').AsString;
        cells[23,nRow] := FindField('DE_TIMECODEUSE').AsString;
        cells[24,nRow] := FindField('TC_GROUP').AsString;
        cells[25,nRow] := FindField('TC_TIME1').AsString;
        cells[26,nRow] := FindField('TC_TIME2').AsString;
        cells[27,nRow] := FindField('TC_TIME3').AsString;
        cells[28,nRow] := FindField('TC_TIME4').AsString;
        cells[29,nRow] := FindField('TC_WEEKCODE').AsString;
        cells[30,nRow] := FindField('EM_MASTER').AsString;
        cells[31,nRow] := FindField('WG_CODE').AsString;
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
  TempAdoQuery.Free;
  CoUninitialize;
  sg_EmployClick(sg_Employ);

end;

procedure TfmDupCardEmploy.btn_CancelClick(Sender: TObject);
var
  stCompanyCode : string;
begin
  L_bVisitEditMode := False;
  stCompanyCode := '000';
  if cmb_sCompany.ItemIndex > 0 then stCompanyCode := copy(sCompanyCodeList.Strings[cmb_sCompany.itemIndex],1,3);
  if UpperCase(State) = 'INSERT' then
  begin
    DeleteTB_CARDEmployeeNo(stCompanyCode,ed_sEmpNo.Text);
  end;
  if G_nSearchIndex = 0 then
  begin
    if UpperCase(State) = 'INSERT' then
      ShowEmployee(stCompanyCode + ed_sEmpNo.Text)
    else
      ShowEmployee(stCompanyCode + ed_sEmpNo.Text,sg_Employ.TopRow);
  end else
  begin
    if ed_searchText.Text <> '' then
    begin
      cmb_SearchType.ItemIndex := 0;
      ed_searchText.Text := ed_sEmpNo.Text;
    end;
    ShowEmployee(stCompanyCode + ed_sEmpNo.Text,sg_Employ.TopRow);
  end;
//  ShowEmployee(stCompanyCode + ed_sEmpNo.Text);
end;

procedure TfmDupCardEmploy.FormShow(Sender: TObject);
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
  AutoSabun := 1;
  //GridInit(sg_Employ,6);

  if Not IsMaster then
  begin
    if IsInsertGrade then btn_Insert.Enabled := True
    else btn_Insert.Enabled := False;
    if IsUpdateGrade then btn_Update.Enabled := True
    else btn_Update.Enabled := False;
    if IsDeleteGrade then btn_Delete.Enabled := True
    else btn_Delete.Enabled := False;
  end;
  LoadCompanyCode(CompanyCodeList,cmb_Company);
  stCompanyCode := '000';
  if cmb_Company.ItemIndex > 0 then stCompanyCode := CompanyCodeList.Strings[cmb_Company.ItemIndex];
  LoadJijumCode(stCompanyCode,JijumCodeList,cmb_Jijum);
  stJijumCode := '000';
  if cmb_Jijum.ItemIndex > 0 then stJijumCode := copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3);
  LoadDepartCode(stCompanyCode,stJijumCode,DepartCodeList,cmb_Depart);
  LoadsCompanyCode(sCompanyCodeList,cmb_sCompany);
  LoadPosiCode('',PosiCodeList,cmb_Posi);
  LoadsPosiCode('',cmb_sPosi);
  LoadsCardGubun(cmb_CardGubun);
  LoadsEmpType(sEmpTypeCodeList,cmb_EmType);
  LoadWorkGubun(sWorkGubunCodeList,cmb_WorkGubun);
  LoadEmpSearchType(cmb_SearchType);

  //GridInit(sg_Employ,6);
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
  end;
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);

  FormNameSet;

  if Not fdmsNoAuto then
  begin
    lb_fdmsno.Visible := True;
    ed_fdmsNo.Visible := True;
  end;

  if G_nSearchIndex = 0 then btn_SearchClick(Self);
end;

procedure TfmDupCardEmploy.cmb_JijumChange(Sender: TObject);
begin
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
  if G_nSearchIndex = 0 then btn_SearchClick(Self);
end;


procedure TfmDupCardEmploy.cmb_sJijumChange(Sender: TObject);
begin
  LoadsDepartCode(copy(sJijumCodeList.Strings[cmb_sJijum.ItemIndex],1,3),copy(sJijumCodeList.Strings[cmb_sJijum.ItemIndex],4,3),sDepartCodeList,cmb_sDepart);

end;

function TfmDupCardEmploy.GetFdmsID: string;
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

procedure TfmDupCardEmploy.FormNameSet;
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

function TfmDupCardEmploy.GetEmployeeFdmsID(aCompanyCode, aEmpID: string): string;
var
  stSql : string;
  nFdms_id : integer;
begin
  result := '0';
  stSql := 'select * from TB_EMPLOYEE ';
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

procedure TfmDupCardEmploy.Panel2Resize(Sender: TObject);
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

procedure TfmDupCardEmploy.SearchCardList(aCompanyCode, aEmCode: string);
var
  stSql : string;
  nRow : integer;
  stCardGubun : string;
  stCardState : string;
begin
  RowGridInitialize(sg_Card);

  stSql := 'Select * from TB_CARD ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';
  stSql := stSql + ' order by ca_gubun,ca_cardtype ';

  with ADOCardQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    sg_Card.RowCount := recordCount + 1;
    nRow := 1;

    While Not Eof do
    begin
      stCardGubun := GetCardTypeName(FindField('CA_GUBUN').AsString);
{      Case FindField('CA_GUBUN').AsString[1] of
        '1' : begin
                if UpperCase(fdmsUses) = 'TRUE' then stCardGubun := '1.지문연동카드'
                else stCardGubun := '1.일반카드';
              end;
        '2' : begin
                if PersonRelayType = 1 then stCardGubun := '2.모바일카드'
                else if UpperCase(fdmsUses) = 'TRUE' then stCardGubun := '2.일반카드'
                else stCardGubun := '2.기타카드';
              end;
      end;
}
      Case FindField('CA_CARDTYPE').asstring[1] of
        '1' : begin stCardState := '1.등록'; end;
        '2' : begin stCardState := '2.분실'; end;
        '3' : begin stCardState := '3.정지'; end;
        '4' : begin stCardState := '4.변경'; end;
      end;
      with sg_Card do
      begin
        AddButton(0,nRow,1,1,'X',haFull,vaFull);
        cells[1,nRow] := stCardGubun;
        cells[2,nRow] := FindField('CA_CARDNO').AsString;
        cells[3,nRow] := stCardState;
      end;
      nRow := nRow + 1;
      Next;
    end;
  end;

end;

procedure TfmDupCardEmploy.sg_CardCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  if Not L_bVisitEditMode then Exit;
  if ACol = 0 then canEDIT := True
  else  canEDIT := False;

end;

procedure TfmDupCardEmploy.sg_CardButtonClick(Sender: TObject; ACol,
  ARow: Integer);
begin
  if Not L_bVisitEditMode then Exit;
  with sg_Card do
  begin
    if (Application.MessageBox(PChar('데이터를 삭제하시겠습니까?'),'삭제',MB_OKCANCEL) = ID_CANCEL)  then Exit;
//    UpdateTB_DEVICECARDNODeleteAll(Cells[2,ARow]); //해당 카드의 권한을 모두 삭제
    DeleteTB_Card(Cells[2,ARow]); //해당 카드를 삭제
    ClearRows(ARow,1);
    if rowCount > 2 then RemoveRows(ARow,1);
  end;

end;

procedure TfmDupCardEmploy.btn_visitAddClick(Sender: TObject);
var
  stCompanyCode : string;
  stMode : string;
  bResult : Boolean;
  stFdmsID : string;
begin

  if Trim(ed_sEmpNo.Text) = '' then Exit;
  if Trim(ed_CardNo.Text) = '' then Exit;

  if G_bCardFixedUse then
  begin
    if Length(Trim(ed_CardNo.Text)) <> G_nCardFixedLength then
    begin
      showmessage('카드길이가 ' + inttostr(G_nCardFixedLength) + '자리가 아닙니다.');
      Exit;
    end;
  end;
  if CARDLENGTHTYPE = 0 then
  begin
    if IsNumericCardNo then
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
    end else
    begin
      if ed_CardNo.Text > 'FFFFFFFF' then
      begin
        showmessage('유효하지 않은 카드번호입니다.');
        Exit;
      end;
    end;
  end;
  stCompanyCode := '000';
  if cmb_sCompany.ItemIndex > 0 then stCompanyCode := copy(sCompanyCodeList.Strings[cmb_sCompany.itemIndex],1,3);

  //여기에서 같은 타입의 카드가 한개 이상 등록 되어 있는지 점검
  if CheckTB_CARDEmployeeType(stCompanyCode,ed_sEmpNo.Text,Trim(ed_CardNo.Text),copy(cmb_CardGubun.Text,1,1)) then
  begin
    if (Application.MessageBox(PChar(cmb_CardGubun.Text + '타입의 카드가 이미 등록되어 있습니다. ' + #13 + Trim(ed_CardNo.Text) + ' 카드를 추가 하시겠습니까?'),'정보',MB_YESNO) = ID_NO) then Exit;
  end;
  //여기에서 같은 카드번호가 등록되어 있는지 점검
  if CheckTB_CARD(Trim(ed_CardNo.Text),stCompanyCode,ed_sEmpNo.Text,'1',copy(cmb_CardGubun.Text,1,1),stMode) then
  begin
    stFdmsId := GetEmployeeFdmsID(stCompanyCode,ed_sEmpNo.Text);
    if stFdmsId = '0' then
    begin
      if fdmsNoAuto then stFdmsId := GetFdmsID
      else stFdmsId := ed_fdmsNo.Text;
    end;
    if UpperCase(stMode) = 'INSERT' then
      bResult := InsertTB_CARD(Trim(ed_CardNo.Text),copy(cmb_CardGubun.Text,1,1),'1',ed_sEmpNo.Text,stCompanyCode,ed_sEmpNM.Text,ed_sHandphone.Text,stFdmsId,cmb_sCompany.text,cmb_sJijum.text,cmb_sDepart.text,cmb_sPosi.text)
    else if UpperCase(stMode) = 'UPDATE' then
      bResult := UpdateTB_CARD(Trim(ed_CardNo.Text),copy(cmb_CardGubun.Text,1,1),'1',ed_sEmpNo.Text,stCompanyCode,ed_sEmpNM.Text,ed_sHandphone.Text,stFdmsId,cmb_sCompany.text,cmb_sJijum.text,cmb_sDepart.text,cmb_sPosi.text);

    if Not bResult then
    begin
      showmessage('카드등록에 실패하였습니다.관리자에게 문의 주세요.');
      Exit;
    end;
  end;
  ed_CardNo.Text := '';
  SearchCardList(stCompanyCode,ed_sEmpNo.Text);

end;

function TfmDupCardEmploy.DeleteTB_CARDEmployeeNo(aCompanyCode,
  aEmpNo: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  if CheckTB_EMPLOYEE(aCompanyCode,aEmpNo) then Exit; //사원 테이블에 사원이 있는 경우 삭제 하지 않는다.

  DeleteTB_DEVICECARDNOEmpNo(aCompanyCode,aEmpNo); //카드 테이블에 있는 사원 정보의 카드를 모두 권한삭제

  stSql := ' select * from TB_CARD ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmpNo + ''' ';
  
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
      DeleteTB_CARD(FindField('CA_CARDNO').AsString);
      Next;
    end;

  end;
  TempAdoQuery.Free;
  CoUninitialize;
  result := True;
end;


function TfmDupCardEmploy.DeleteTB_DEVICECARDNOEmpNo(aCompanyCode,
  aEmpNo: string): Boolean;
var
  stsql : string;
begin
  result := False;

  stSql := 'select * from TB_CARD ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmpNo + ''' ';

  with DeleteADOQuery do
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
      UpdateTB_DEVICECARDNO(FindField('CA_CARDNO').AsString,'N'); //모든 카드 권한을 삭제 처리함

      Next;
    end;
  end;
  result := True;
end;

function TfmDupCardEmploy.GetMaxPositionNum: integer;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := 1;

  stSql := 'Select Max(PositionNum) as MaxPosition From TB_CARD '; //where positionnum is not null';

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

function TfmDupCardEmploy.GetCardTypeName(aCardType: string): string;
var
  stSql : string;
  nFdms_id : integer;
  TempAdoQuery : TADOQuery;
begin
  result := '';
  stSql := 'select * from TB_CARDTYPE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CT_CODE = ''' + aCardType + ''' ';

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
      if recordCount < 1 then Exit;

      result := FindField('CT_CODE').AsString + '.' + FindField('CT_NAME').AsString ;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TfmDupCardEmploy.btn_ExcelClick(Sender: TObject);
var
  stRefFileName,stSaveFileName:String;
  stPrintRefPath : string;
  nExcelRowStart:integer;
  ini_fun : TiniFile;
  aFileName : string;
  stTitle : string;
begin
  btn_Excel.Enabled := False;
  Screen.Cursor:= crHourGlass;
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

    if stSaveFileName <> '' then
    begin
      pan_gauge.Visible := True;
      Screen.Cursor:= crHourGlass;
      if G_nFileFormat = 0 then
        dmExcelSave.ExcelPrintOut(sg_Employ,stRefFileName,stSaveFileName,True,nExcelRowStart,stTitle,False,False,Gauge1)
      else if G_nFileFormat = 1 then
        sg_Employ.SaveToCSV(stSaveFileName) ;
    end;
  end;
  pan_gauge.Visible := False;
  Screen.Cursor:= crDefault;
  btn_Excel.Enabled := True;

end;

function TfmDupCardEmploy.CheckTB_CARDEmployeeType(aCompanyCode, aEmpID,
  aCardNo, aCardType: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  Result := False;
  stSql := 'Select * from TB_CARD ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO <> '''  + aCardNo + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmpID + ''' ';
  stSql := stSql + ' AND CA_GUBUN = ''' + aCardType + ''' ';
  stSql := stSql + ' AND CA_CARDTYPE = ''1'' '; //등록된 카드 중에서

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

      if RecordCount < 1 then  Exit;
      Result := True;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmDupCardEmploy.dt_sRetireDtChange(Sender: TObject);
begin
  L_bValidateUpdate := True;

end;

function TfmDupCardEmploy.UpdateTB_DEVICECARDNOEmployeeRcvAck(aCompanyCode,aEmpID,
  aRcvAck: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin

  Result := False;
  stSql := 'Select CA_CARDNO from TB_CARD ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmpID + ''' ';
  stSql := stSql + ' AND CA_CARDTYPE = ''1'' '; //등록된 카드 중에서

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

      if RecordCount < 1 then  Exit;
      Result := True;
      while Not Eof do
      begin
        stSql := 'Update TB_DEVICECARDNO Set ';
        stSql := stSql + ' DE_RCVACK = ''' + aRcvAck + ''' ';
        stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
        stSql := stSql + ' AND CA_CARDNO = ''' + FindField('CA_CARDNO').AsString + ''' ';

        result := DataModule1.ProcessExecSQL(stSql);

        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmDupCardEmploy.ed_searchTextKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Key:= #0;
    btn_SearchClick(Self);
  end;

end;

function TfmDupCardEmploy.GetCardNoEmployee(aCompanyCode,
  aEmpID: string): string;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := '';

  stSql := 'Select CA_CARDNO From TB_CARD '; //where positionnum is not null';
  stSql := stsql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmpID + ''' ';

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
    result := FindField('CA_CARDNO').AsString;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

procedure TfmDupCardEmploy.CardReadProcess(aCardNo: string;aCheckBox:Boolean=True);
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
      if GetEmployeeInfo(aCardNo,stCompanyCode,stEmCode) then
      begin
        nIndex := CompanyCodeList.IndexOf(stCompanyCode);
        if nIndex > -1 then cmb_Company.ItemIndex := nIndex;
        cmb_SearchType.ItemIndex := 0;
        cmb_SearchTypeChange(self);
        ed_searchText.Text := stEmCode;
        btn_SearchClick(self);
      end;
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

function TfmDupCardEmploy.GetEmployeeInfo(aCardNo: string;
  var aCompanyCode, aEmCode: string): Boolean;
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

procedure TfmDupCardEmploy.cmb_SearchTypeChange(Sender: TObject);
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

procedure TfmDupCardEmploy.sg_CardSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  Rect: TRect;
  nIndex : integer;
begin
  if (State <> 'INSERT') AND
     (State <> 'UPDATE') then Exit;
  if Trim(sg_Card.Cells[2, ARow]) = '' then Exit;

  if ACol = 3 then
  begin
    Rect := sg_Card.CellRect(ACol, ARow);
    // 현재 Cell의 좌표를 Rect로 저장
    with cbCardType do
    begin
      // 사용 여부 등록
      Clear;
      Items.Add('1.등록');
      Items.Add('2.분실');
      Items.Add('3.정지');
      Items.Add('4.변경');
      Visible := true;
      Left := sg_Card.Left + Rect.Left ;
      Top := Rect.Top ;
      Width := Rect.Right - Rect.Left;
      Height := (Rect.Bottom - Rect.Top);
      nIndex := Items.IndexOf(Trim(sg_Card.Cells[ACol, ARow]));
      ItemIndex := nIndex;
      BringToFront;   // comboBox1을 최상위로 옮기기 <> SendToBack
      SetFocus;
    end;
  end;
     

end;

procedure TfmDupCardEmploy.cbCardTypeChange(Sender: TObject);
var
  stTemp: string;
begin
  with Sender as TRzCombobox do
  begin
    hide;
    if ItemIndex > 0 then
    begin
      if Application.MessageBox(PChar('카드의 전체권한이 삭제 됩니다. 계속하시겠습니까?'),'경고',MB_OKCANCEL) = IDCANCEL then Exit;
    end;
    if ItemIndex >= 0 then
    begin
      with sg_Card do
      begin
        stTemp := Items[ItemIndex];
        Cells[Col, row] := stTemp;
        L_bCardTypeChange := True;
        CardInfoUpdate(Col,Row);
      end;
    end;
  end;
end;

procedure TfmDupCardEmploy.cbCardTypeExit(Sender: TObject);
begin
  cbCardType.hide;
end;

function TfmDupCardEmploy.CardInfoUpdate(aCol, aRow: integer): Boolean;
var
  stCardNo : string;
  stCardState : string;
  stCardType : string;
  stCompanyCode : string;
  stFdmsId : string;
begin
  result := False;
  
  stCompanyCode := '000';
  if cmb_sCompany.ItemIndex > 0 then stCompanyCode := copy(sCompanyCodeList.Strings[cmb_sCompany.itemIndex],1,3);

  stFdmsId := GetEmployeeFdmsID(stCompanyCode,ed_sEmpNo.Text);

  with sg_Card do
  begin
    stCardType := copy(Cells[1,aRow],1,1);
    stCardNo := Cells[2,aRow];
    stCardState := copy(Cells[3,aRow],1,1);
    result := UpdateTB_CARD(stCardNo,stCardType,stCardState,ed_sEmpNo.Text,stCompanyCode,ed_sEmpNM.Text,ed_sHandphone.Text,stFdmsId,cmb_sCompany.text,cmb_sJijum.text,cmb_sDepart.text,cmb_sPosi.text);
    //if stCardState <> '1' then UpdateTB_DEVICECARDNO(stCardNo,'N');
    if L_bCardTypeChange then UpdateTB_DEVICECARDNORcvAck(stCardNo,'N');
  end;
  L_bCardTypeChange := False;
end;


function TfmDupCardEmploy.GetEmCodeFromCardNo(aCardNo: string;
  var aCompanyCode, aEmcode: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := False;
  aCompanyCode := '';
  aEmcode := '';

  stSql := 'Select CO_COMPANYCODE,EM_CODE From TB_CARD '; //where positionnum is not null';
  stSql := stsql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
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

    if RecordCount < 1 then
    begin
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    end;
    First;
    aCompanyCode := FindField('CO_COMPANYCODE').AsString;
    aEmcode := FindField('EM_CODE').AsString;
    result := True;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

function TfmDupCardEmploy.CheckFdmsID(aFdmsNo: string): Boolean;
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

procedure TfmDupCardEmploy.ed_searchTextEnter(Sender: TObject);
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

procedure TfmDupCardEmploy.rg_TimeCodeNotUseClick(Sender: TObject);
begin
  inherited;
  pan_TimeCode.Visible := False;
  L_bValidateUpdate := True;

end;

procedure TfmDupCardEmploy.rg_TimeGroup1Click(Sender: TObject);
begin
  inherited;
  L_bValidateUpdate := True;
  pan_TimeCode.Visible := True;
  CheckTimeGroupView('0');

end;

procedure TfmDupCardEmploy.rg_TimeGroup2Click(Sender: TObject);
begin
  inherited;
  L_bValidateUpdate := True;
  pan_TimeCode.Visible := True;
  CheckTimeGroupView('1');

end;

procedure TfmDupCardEmploy.chk_Time1Click(Sender: TObject);
begin
  inherited;
  L_bValidateUpdate := True;

end;

procedure TfmDupCardEmploy.CheckTimeGroupView(aTimeGroup: string);
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

procedure TfmDupCardEmploy.chk_MasterClick(Sender: TObject);
begin
  inherited;
  L_bValidateUpdate := True;
end;

function TfmDupCardEmploy.UpdateTB_DEVICECARDNORcvAck(aCardNo,
  aRcvAck: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_DEVICECARDNO Set ';
  stSql := stSql + ' DE_RCVACK = ''' + aRcvAck + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmDupCardEmploy.CommandArrayCommandsTCloseExecute(
  Command: TCommand; Params: TStringList);
begin
  inherited;
  Close;
end;

initialization
  RegisterClass(TfmDupCardEmploy);
Finalization
  UnRegisterClass(TfmDupCardEmploy);

end.
