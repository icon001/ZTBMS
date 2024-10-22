unit uEmploy;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvEdit, AdvEdBtn, PlannerDatePicker, ExtCtrls, StdCtrls,
  Buttons, Grids, BaseGrid, AdvGrid, ComCtrls,DB,Jpeg, uSubForm,
  CommandArray, OoMisc, AdPort,WinSpool, AdPacket, ADODB,ActiveX,
  LMDCustomComponent, LMDFileCtrl,iniFiles, Gauges,ComObj;

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
    Label12: TLabel;
    btn_ZipcodeSearch: TSpeedButton;
    Label13: TLabel;
    lb_CompanyPhone: TLabel;
    btn_Image: TSpeedButton;
    Label15: TLabel;
    Label16: TLabel;
    lb_inDate: TLabel;
    lb_OutDate: TLabel;
    GroupBox3: TGroupBox;
    chk_CardReg: TCheckBox;
    cmb_ComPort: TComboBox;
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
    ReaderPort: TApdComPort;
    ApdDataPacket1: TApdDataPacket;
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
    Label3: TLabel;
    ed_fdmsNo: TEdit;
    cmb_SearchType: TComboBox;
    ADOQuery1: TADOQuery;
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
    procedure cmb_ComPortChange(Sender: TObject);
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

  private
    L_nTopRow : integer;
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

    State : string;
    OldCardNo : string;
    AutoSabun : integer;
    { Private declarations }

    procedure FormClear;
    procedure FormEnable(aState:string);
    procedure ButtonEnable(aState:string);
    procedure ShowEmployee(aCode : string;aTopRow:integer = 0);

//    procedure LoadsPosiCode(aCompanyCode:string;cmb_Box:TComboBox);
    procedure GridInit(sg:TStringGrid;aCol:integer);
    procedure pn_EmployInit;
    procedure pn_EmployInSertMode;
    procedure pn_EmployUpdateMode;
    Function DeleteTB_CARD(aCardNo:string):Boolean;
    Function UpdateTB_DEVICECARDNO(aCardNo,aPermit:string):Boolean; //모든 카드 권한을 삭제 처리함
    Function DeleteTB_EMPLOYEE(aEmpID,aCompanyCode,aCardNo:string):Boolean;
    Function InsertTB_EMPLOYEE(aEmpID,aEmpNM,aCompanyCode,aJijumCode,aDepartCode,aPosiCod,aCompanyPhone,
                                 aJoinDate,aRetireDate,aZipcode,aAddr1,aAddr2,aHomePhone,aHandphone,
                                 aRegGubun,aCardNo,aEmpImg,afdmsId,aEmTypeCode:string):Boolean;
    Function UpdateTB_EMPLOYEE(aEmpID,aEmpNM,aCompanyCode,aJijumCode,aDepartCode,aPosiCode,aCompanyPhone,
                                 aJoinDate,aRetireDate,aZipcode,aAddr1,aAddr2,aHomePhone,aHandphone,
                                 aRegGubun,aCardNo,aEmpImg,aEmTypeCode,aFdmsID:string):Boolean;
    Function CheckTB_CARD(aCardNo,aCompanyCode,aEmpID,aCardType :string;var Mode:string) : Boolean;
    Function InsertTB_CARD(aCardNo,aCardGubun,aCardType,aEmpID,aCompanyCode:string) : Boolean;
    Function UpdateTB_CARD(aCardNo,aCardGubun,aCardType,aEmpID,aCompanyCode:string) : Boolean;
    Function CheckTB_EMPLOYEE(aEmpID,aCompanyCode:string):Boolean;
    Procedure RcvCardDataByReader(aData:String);
    Function UpdateTB_ACCESSEVENTCARDNO(OldCardNo,aCardNo:string):Boolean;
    Function UpdateTB_ATEVENTCARDNO(OldCardNo,aCardNo:string):Boolean;
    Function UpdateTB_FoodEventCARDNO(OldCardNo,aCardNo:string):Boolean;
    Function GetFdmsID:string;
    Function GetEmployeeFdmsID(aCompanyCode,aEmpID:string):string;
    procedure FormNameSet;
    Function CheckTB_CARDFromEmployeeID(aCompanyCode,aEmpID:string):Boolean;

    Function GetMaxPositionNum : integer;
    Function ExcelPrintOut(StringGrid:TAdvStringGrid;refFileName,SaveFileName:String;FileOut:Boolean;ExcelRowStart:integer;stTitle:string;bRowHeader,bColHeader:Boolean):Boolean;
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
     uZTBMSFunction, uFireBird;

{$R *.dfm}

procedure TfmEmploy.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmEmploy.FormCreate(Sender: TObject);
begin
  self.ModuleID := 'Employ';

  L_nTopRow := 1;

end;

procedure TfmEmploy.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if ApdDataPacket1.Enabled then ApdDataPacket1.Enabled := False;
  if ReaderPort.Open then ReaderPort.Open:= False;
  CompanyCodeList.Free;
  sCompanyCodeList.Free;
  JijumCodeList.Free;
  sJijumCodeList.Free;
  PosiCodeList.Free;
  sPosiCodeList.Free;
  DepartCodeList.Free;
  sDepartCodeList.Free;
  EmpTypeCodeList.Free;

//  if ApdDataPacket1 <> nil then ApdDataPacket1.Free;
//  if ReaderPort <> nil then  ReaderPort.Free;
  ComPortList.Free;
//  Delay(500);

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
  cmb_ComPort.Enabled := False;
  cmb_RegGubun.ItemIndex := 0;
  cmb_RegGubun.Enabled := False;
  ed_CardNo.Text := '';
  ed_CardNo.Enabled := False;
  Image1.Picture.Graphic := Nil;
  btn_Image.Enabled := False;
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
      LoadsPosiCode(cells[6,Row],sPosiCodeList,cmb_sPosi);
      nIndex := sPosiCodeList.IndexOf(cells[6,Row] + cells[9,Row]);
      if nIndex > -1 then cmb_sPosi.ItemIndex := nIndex;
    end;

    nIndex := EmpTypeCodeList.IndexOf(cells[21,Row]);
    if nIndex > -1 then cmb_emType.ItemIndex := nIndex;

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
      stTemp := copy(cmb_RegGubun.Items[i],1,1);
      if cells[20,Row] = copy(cmb_RegGubun.Items[i],1,1) then
      begin
        cmb_RegGubun.ItemIndex := i;
        break;
      end;
    end;
    ed_CardNo.Text := cells[19,Row];
    ed_fdmsNo.Text := cells[22,Row];

  end;

end;


procedure TfmEmploy.btn_InsertClick(Sender: TObject);
var
  nIndex : integer;
  stCompanyCode : string;
begin
  L_nTopRow := sg_Employ.TopRow;

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
    if FileExists(ed_EmpImg.Text) then
    Image1.Picture.LoadFromFile(ed_EmpImg.Text);
  end;
end;

procedure TfmEmploy.btn_UpdateClick(Sender: TObject);
begin
  if ed_sEmpNo.Text = '' then Exit;

  L_nTopRow := sg_Employ.TopRow;
  
  State := 'UPDATE';

  FormEnable(State);
  ButtonEnable(State);


  OldCardNo := ed_CardNo.Text ;
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
  if Trim(ed_sEmpNo.Text) = '' then Exit;

  if (Application.MessageBox(PChar('데이터를 삭제하시겠습니까?'),'삭제',MB_OKCANCEL) = ID_CANCEL)  then Exit;

  bCardDelete := True;
  if ed_CardNo.Text <> '' then
  begin
    // if (Application.MessageBox(PChar('카드데이터(' + ed_CardNo.Text + ')를 삭제하시겠습니까?' ),'삭제',MB_OKCANCEL) = ID_CANCEL)  then  bCardDelete := False;
  end else bCardDelete := False;

  if bCardDelete then
  begin
    if cmb_RegGubun.ItemIndex = 1 then
    begin
      ShowMessage('카드데이터를 삭제 하시려면 카드의 등록상태를 정지 시키셔야 합니다.');
      Exit;
    end;
    bResult := DeleteTB_CARD(ed_CardNo.Text);
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

  bResult := DeleteTB_EMPLOYEE(ed_sEmpNo.Text,stCompanyCode,ed_CardNo.Text);

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

function TfmEmploy.DeleteTB_EMPLOYEE(aEmpID,
  aCompanyCode,aCardNo: string): Boolean;
var
  stSql : string;
  stFdmsId : string;
begin
  Result := False;
  stFdmsId := GetEmployeeFdmsID(aCompanyCode,aEmpID);
  stSql := CommonSql.InsertIntoTB_EMPHIS(aCompanyCode,aEmpID,stFdmsId,'3',aCardNo,'2',
           '','','','','','');//삭제
  result := DataModule1.ProcessExecSQL(stSql);

  stSql := 'Delete From TB_EMPLOYEE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' +  aEmpID + ''' ';
  if (aCompanyCode <> '') and (aCompanyCode <> '000') then
  begin
    stSql := stSql + ' AND CO_COMPANYCODE = ''' +  aCompanyCode + ''' ';
  end;
  result := DataModule1.ProcessExecSQL(stSql);


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
        showmessage('카드길이가 ' + inttostr(G_nCardFixedLength) + '자리가 아닙니다.');
        Exit;
      end;
    end;
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
  if cmb_emType.ItemIndex > 0 then stEmTypeCode := EmpTypeCodeList.Strings[cmb_emType.ItemIndex];

  if UpperCase(State) = 'INSERT' then
  begin
    stFdmsId := GetFdmsID;
    bResult := InsertTB_EMPLOYEE(ed_sEmpNo.Text,ed_sEmpNM.Text,stCompanyCode,stJijumCode,
                                 stDepartCode,stPosiCode,ed_sCompanyPhone.text,
                                 FormatDateTime('yyyymmdd',dt_sJoinDt.Date),FormatDateTime('yyyymmdd',dt_sRetireDt.Date),
                                 ed_sZipcode.Text,ed_sAddr1.Text,ed_sAddr2.Text,ed_sHomePhone.Text,ed_sHandphone.Text,
                                 intTostr(cmb_RegGubun.ItemIndex),ed_CardNo.Text,ed_EmpImg.Text,stFdmsId,stEmTypeCode);
    if bResult then     inc(AutoSabun);
  end  else if UpperCase(State) = 'UPDATE' then
    bResult := UpdateTB_EMPLOYEE(ed_sEmpNo.Text,ed_sEmpNM.Text,stCompanyCode,stJijumCode,
                                 stDepartCode,stPosiCode,ed_sCompanyPhone.text,
                                 FormatDateTime('yyyymmdd',dt_sJoinDt.Date),FormatDateTime('yyyymmdd',dt_sRetireDt.Date),
                                 ed_sZipcode.Text,ed_sAddr1.Text,ed_sAddr2.Text,ed_sHomePhone.Text,ed_sHandphone.Text,
                                 intTostr(cmb_RegGubun.ItemIndex),ed_CardNo.Text,ed_EmpImg.Text,stEmTypeCode,ed_fdmsNo.Text);

  if cmb_RegGubun.ItemIndex <> 1 then //정상등록 상태가 아니면
    UpdateTB_DEVICECARDNO(ed_CardNo.Text,'N');

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
    ed_searchText.Text := ed_sEmpNo.Text;
    ShowEmployee(stCompanyCode + ed_sEmpNo.Text);
  end;

end;

function TfmEmploy.InsertTB_EMPLOYEE(aEmpID, aEmpNM, aCompanyCode,aJijumCode,
  aDepartCode, aPosiCod, aCompanyPhone, aJoinDate, aRetireDate, aZipcode,
  aAddr1, aAddr2, aHomePhone, aHandphone, aRegGubun, aCardNo,
  aEmpImg,afdmsID,aEmTypeCode: string): Boolean;
var
  stSql : string;
  bResult : Boolean;
  stMode : string;
  stImg : string;
begin
  Result := False;
  bResult := False;
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
    if HidCardType <> 1 then
    begin
      if (CARDLENGTHTYPE = 0) and IsNumericCardNo then
          aCardNo := FillZeroStrNum(aCardNo,10);
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
  stSql := stSql + 'RG_CODE ) ';
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
  stSql := stSql + '''' + aEmTypeCode + ''' )';

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

  stSql := CommonSql.InsertIntoTB_EMPHIS(aCompanyCode,aEmpID,afdmsID,'1',aCardNo,'1',
           aEmpNM,aHandphone,cmb_sCompany.Text,cmb_sJijum.Text,cmb_sDepart.Text,cmb_sPosi.Text);//입력
  result := DataModule1.ProcessExecSQL(stSql);


end;

function TfmEmploy.UpdateTB_EMPLOYEE(aEmpID, aEmpNM, aCompanyCode,aJijumCode,
  aDepartCode, aPosiCode, aCompanyPhone, aJoinDate, aRetireDate, aZipcode,
  aAddr1, aAddr2, aHomePhone, aHandphone, aRegGubun, aCardNo,
  aEmpImg,aEmTypeCode,aFdmsID: string): Boolean;
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
    if HidCardType <> 1 then
    begin
      if (CARDLENGTHTYPE = 0) and IsNumericCardNo then
        aCardNo := FillZeroStrNum(aCardNo,10);
    end;
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


  stSql := 'Update TB_EMPLOYEE Set ';
  stSql := stSql + 'CO_JIJUMCODE = ''' + aJijumCode + ''',';
  stSql := stSql + 'CO_DEPARTCODE = ''' + aDepartCode + ''',';
  stSql := stSql + 'PO_POSICODE = ''' + aPosiCode + ''',';
  stSql := stSql + 'EM_NAME = ''' + aEmpNM + ''',';
  stSql := stSql + 'EM_COPHONE = ''' + aCompanyPhone + ''',';
  stSql := stSql + 'EM_HOMEPHONE = ''' + aHomePhone + ''',';
  stSql := stSql + 'EM_HANDPHONE = ''' + aHandphone + ''',';
  stSql := stSql + 'ZI_ZIPCODE = ''' + aZipcode + ''',';
  stSql := stSql + 'EM_ADDR1 = ''' + aAddr1 + ''',';
  stSql := stSql + 'EM_ADDR2 = ''' + aAddr2 + ''',';
  stSql := stSql + 'EM_JOINDATE = ''' + aJoinDate + ''',';
  stSql := stSql + 'EM_RETIREDATE = ''' + aRetireDate + ''',';
  stSql := stSql + 'FDMS_RELAY = ''N'',';
  stSql := stSql + 'EM_UPDATETIME = ''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',';
  stSql := stSql + 'EM_UPDATEOPERATOR = ''' + Master_ID + ''', ';
  stSql := stSql + 'RG_CODE = ''' + aEmTypeCode + ''' ';
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
    UpdateTB_DEVICECARDNO(aCardNo,'N'); //기존카드번호의 권한을 삭제합니다.
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
begin
  if Length(aCardNo) = 0 then Exit;

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
  if cmb_ComPort.text = '' then Exit;
  if ReaderPort.Open then ReaderPort.Open := False;
  ReaderPort.ComNumber := Integer(ComPortList.Objects[cmb_ComPort.ItemIndex]);
  //ReaderPort.ComNumber := strtoint(copy(cmb_ComPort.text,4,Pos(':',cmb_ComPort.text) -4));
  ReaderPort.Open := true;
end;

procedure TfmEmploy.ApdDataPacket1StringPacket(Sender: TObject;
  Data: String);
begin
  RcvCardDataByReader(Data);
  ApdDataPacket1.Enabled := True;

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
  if HidCardType = 1 then   //Hid CardType
  begin
    aCardNo := HidReverseCardNo(aCardNo);
  end else if CARDLENGTHTYPE = 0 then  //고정길이 타입이면
  begin
    if IsNumericCardNo then  //숫자변환이면
    begin
      bCardNo:= Hex2Dec64(aData);
      //aCardNo := inttostr(bCardNo);
      aCardNo:= FillZeroNumber2(bCardNo,10);
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


  aCardNo := GetFixedCardNoCheck(aCardNo,G_bCardFixedUse,G_stCardFixedFillChar,G_nCardFixedPosition,G_nCardFixedLength);

  if Trim(ed_CardNo.Text) <> '' then
  begin
    stMsg := '(' + ed_CardNo.Text + ')카드번호가 존재 합니다. (' +
        aCardNo + ') 으로 변경하시겠습니까? ' ;
    if Trim(ed_CardNo.Text) <> aCardNo then
    begin
      if (Application.MessageBox(PChar(stMsg),'변경',MB_OKCANCEL) = ID_CANCEL)  then Exit;
      DeleteTB_Card(ed_CardNo.Text);
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
  stSql := stSql + ' Where CA_CARDNO = ''' + aCardNo + ''' ';

  result := DataModule1.ProcessEventExecSQL(stSql);

end;

function TfmEmploy.UpdateTB_ATEVENTCARDNO(OldCardNo,
  aCardNo: string): Boolean;
var
  stSql :string;
begin
  stSql := 'Update TB_ATEVENT set CA_CARDNO = ''' + aCardNo + ''' ';
  stSql := stSql + ' Where CA_CARDNO = ''' + aCardNo + ''' ';

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
  cmb_emType.ItemIndex := 0;
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
  end else if upperCase(aState) = 'UPDATE' then
  begin
    sg_Employ.Enabled := False;
    ed_sEmpNo.Enabled := False;
    chk_AutoSabun.Enabled := False;
    ed_sEmpNM.Enabled := True;
    cmb_sCompany.Enabled := False;
    if (Not IsMaster) and ( strtoint(CompanyGrade) > 2) then cmb_sJijum.Enabled := False
    else cmb_sJijum.Enabled := True;
    cmb_sDepart.Enabled := True;
    cmb_sPosi.Enabled := True;
    cmb_emType.Enabled := True;
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
end;

procedure TfmEmploy.ShowEmployee(aCode: string;aTopRow:integer = 0);
var
  stSql : string;
  nRow : integer;
  i : integer;
  TempAdoQuery : TADOQuery;
begin
  GridInitialize(sg_Employ); //스트링그리드 초기화

  State := 'SEARCH';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  if DBTYPE = 'MSSQL' then stSql := MSSQL.SelectTB_EMPLOYEEJoinBase
  else if DBType = 'PG' then stSql := PostGreSql.SelectTB_EMPLOYEEJoinBase
  else if DBType = 'MDB' then stSql := MDBSql.SelectTB_EMPLOYEEJoinBase
  else if DBType = 'FB' then stSql := FireBird.SelectTB_EMPLOYEEJoinBase
  else Exit;

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

  if Trim(ed_searchText.Text) <> '' then
  begin
    if cmb_SearchType.ItemIndex < 0 then cmb_SearchType.ItemIndex := 0;

    if cmb_SearchType.ItemIndex = 0 then //사번
      stSql := stSql + ' AND a.EM_CODE LIKE ''%' + Trim(ed_searchText.Text)  + '%'' '
    else if cmb_SearchType.ItemIndex = 1 then //이름
      stSql := stSql + ' AND a.EM_NAME LIKE ''%' + Trim(ed_searchText.Text)  + '%'' '
    else if cmb_SearchType.ItemIndex = 2 then //사내전화번호
      stSql := stSql + ' AND a.em_cophone LIKE ''%' + Trim(ed_searchText.Text)  + '%'' '
    else if cmb_SearchType.ItemIndex = 3 then //집전화번호
      stSql := stSql + ' AND a.em_homephone LIKE ''%' + Trim(ed_searchText.Text)  + '%'' '
    else if cmb_SearchType.ItemIndex = 4 then //휴대폰번호
      stSql := stSql + ' AND a.em_handphone LIKE ''%' + Trim(ed_searchText.Text)  + '%'' ';
  end;


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
          cells[21,nRow] := FindField('RG_CODE').AsString;
          cells[22,nRow] := FindField('FDMS_ID').AsString;
          if (FindField('CO_COMPANYCODE').AsString + FindField('EM_CODE').AsString)  = aCode then
          begin
            SelectRows(nRow,1);
          end;
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
    cmb_SearchType.ItemIndex := 0;
    ed_searchText.Text := ed_sEmpNo.Text;
    ShowEmployee(stCompanyCode + ed_sEmpNo.Text);
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

  State := '';
  AutoSabun := 1;
  GridInit(sg_Employ,6);

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
  LoadPosiCode(stCompanyCode,PosiCodeList,cmb_Posi);
  LoadsPosiCode(stCompanyCode,sPosiCodeList,cmb_sPosi);
  LoadsEmpType(EmpTypeCodeList,cmb_EmType);

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

  if G_nSearchIndex = 0 then btn_SearchClick(Self);
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
  if SaveDialog1.Execute then
  begin
    stSaveFileName := SaveDialog1.FileName;
    if SaveDialog1.FileName <> '' then
      if Not ExcelPrintOut(sg_Employ,stRefFileName,stSaveFileName,True,nExcelRowStart,stTitle,False,False) then
      begin
        Screen.Cursor:= crDefault;
        btn_Excel.Enabled := True;
        Exit;
      end;
      //showmessage('파일생성 완료');
  end;
  Screen.Cursor:= crDefault;
  btn_Excel.Enabled := True;
end;

function TfmEmploy.ExcelPrintOut(StringGrid: TAdvStringGrid; refFileName,
  SaveFileName: String; FileOut: Boolean; ExcelRowStart: integer;
  stTitle: string; bRowHeader, bColHeader: Boolean): Boolean;
var
  oXL, oWB, oSheet, oRng, VArray : Variant;
  nCol1,nCol2 : Integer;
  Loop : Integer;
  sCurDay,sPreDay : String;
  curDate : TDateTime;
  mergeStart :char;
  i,j,k : Integer;
  st : String;
  nColChar : integer;
  nFixCol,nFixRow : integer;

begin
  pan_gauge.Visible := True;
  Result := False;

  Try
    oXL := CreateOleObject('Excel.Application');
  Except
    showmessage('출력은 엑셀이 설치된 컴퓨터에서만 가능합니다.');
    exit;
  End;

  if FileExists(refFileName) = False then
  begin
    Showmessage(refFileName + ' 파일이 없습니다.');
    exit;
  end;


  oXL.Workbooks.Open(refFileName);
  oXL.DisplayAlerts := False;
//  oXL.Visible := True;
  oSheet := oXL.ActiveSheet;


  with StringGrid do
  begin

    //타이틀을 적자
    nCol1 := ColCount div 26;
    nCol2 := ColCount mod 26;
    if bRowHeader then
    begin
      oSheet.Range['A' + inttostr(ExcelRowStart - 1)].Value := stTitle;
      if bColHeader then nFixCol := 0
      else nFixCol := FixedCols ;
      for i:= 0 to FixedRows - 1 do
      begin
        for j:= nFixCol to ColCount - 1 do
        begin
          nColChar := j div 26;
          if j < 26 then
            oXL.Range[Chr(Ord('A') + j ) + inttostr(i+ ExcelRowStart)].Value := Cells[j,i]
          else
            oXL.Range[Chr(Ord('A') + nColChar - 1 ) + Chr(Ord('A') + j - (26 * nColChar) ) + inttostr(i+ ExcelRowStart)].Value := Cells[j,i];
        end;
      end;
      ExcelRowStart := ExcelRowStart + FixedRows ;
    end
    else    oSheet.Range['A' + inttostr(ExcelRowStart - FixedRows - 1)].Value := stTitle;

    Gauge1.MaxValue := ( RowCount - FixedRows );
    Gauge1.Progress := 0;
    for i := FixedRows to RowCount - 1 do
    begin

      if i <  RowCount - 2 then    //한칸씩 삽입
      begin
        oSheet.Range['A' + inttostr(i+ ExcelRowStart - FixedRows + 1) + ':' + Chr(Ord('A') + nCol1 ) + Chr(Ord('A') + nCol2 - 1 ) +  inttostr(i+ ExcelRowStart - FixedRows + 1)].Insert;
      end;
      Gauge1.Progress := Gauge1.Progress + 1;
      Application.ProcessMessages;
     {
      for j := 0 to ColCount - 1 do
      begin
        nColChar := j div 26;
        if j < 26 then
          oXL.Range[Chr(Ord('A') + j ) + inttostr(i+ ExcelRowStart - FixedRows)].Value := Cells[j,i]
        else
          oXL.Range[Chr(Ord('A') + nColChar - 1 ) + Chr(Ord('A') + j - (26 * nColChar) ) + inttostr(i+ ExcelRowStart - FixedRows)].Value := Cells[j,i];
        Gauge1.Progress := Gauge1.Progress + 1;
        Application.ProcessMessages;
      end;
      }
    end;
    StringGrid.CopyToClipBoard;
    oSheet.Range['A' + inttostr(ExcelRowStart - 1), 'A' + inttostr(ExcelRowStart - 1)].Select;
    oSheet.Paste;
  end;//With

  //oXL.Visible := False;
  if FileOut then  oSheet.SaveAs(SaveFileName)
  else  oSheet.PrintOut;
  //oSheet.SaveAs(ExtractFileDir(Application.ExeName) + '\WorkSch2.xls');
  oXL.ActiveWorkbook.Close(False);
  oXL.Quit;
  pan_gauge.Visible := False;
  Result := True;
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
end;

initialization
  RegisterClass(TfmEmploy);
Finalization
  UnRegisterClass(TfmEmploy);

end.
