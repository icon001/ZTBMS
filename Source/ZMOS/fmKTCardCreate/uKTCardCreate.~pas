unit uKTCardCreate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uSubForm, CommandArray, ExtCtrls, ComCtrls, StdCtrls, Grids,
  BaseGrid, AdvGrid, Buttons, AdPacket, OoMisc, AdPort, LMDCustomComponent,
  LMDFileCtrl,ActiveX,ADODB,WinSpool, DB,IniFiles,uMain,imm,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  OleCtrls, SHDocVw, AdvObj;


const
  KTDelayTime = 3000;
  
type
  TfmKTCardCreate = class(TfmASubForm)
    Panel12: TPanel;
    Panel2: TPanel;
    btn_Update: TSpeedButton;
    btn_Cancel: TSpeedButton;
    Panel1: TPanel;
    Splitter1: TSplitter;
    Panel3: TPanel;
    GroupBox2: TGroupBox;
    lb_CompanyName: TLabel;
    lb_DepartName: TLabel;
    lb_PosiName: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lb_JijumName: TLabel;
    cmb_Company: TComboBox;
    cmb_Depart: TComboBox;
    cmb_Posi: TComboBox;
    ed_EmpNo: TEdit;
    ed_EmpNM: TEdit;
    btn_Search: TBitBtn;
    cmb_Jijum: TComboBox;
    sg_Employ: TAdvStringGrid;
    pn_Employ: TPanel;
    GroupBox3: TGroupBox;
    Label19: TLabel;
    cmb_ComPort: TComboBox;
    ed_CardNo: TEdit;
    btn_Close: TSpeedButton;
    GroupBox1: TGroupBox;
    ed_sHandphone: TEdit;
    Label16: TLabel;
    ed_sHomePhone: TEdit;
    Label15: TLabel;
    Label13: TLabel;
    ed_sAddr2: TEdit;
    ed_sAddr1: TEdit;
    Label12: TLabel;
    Label11: TLabel;
    ed_sZipcode: TEdit;
    btn_ZipcodeSearch: TSpeedButton;
    dt_sRetireDt: TDateTimePicker;
    lb_OutDate: TLabel;
    dt_sJoinDt: TDateTimePicker;
    lb_inDate: TLabel;
    lb_Name: TLabel;
    ed_sEmpNM: TEdit;
    ed_sCompanyPhone: TEdit;
    lb_CompanyPhone: TLabel;
    cmb_sPosi: TComboBox;
    lb_PosiName1: TLabel;
    cmb_sDepart: TComboBox;
    lb_DepartName1: TLabel;
    lb_CompanyName1: TLabel;
    cmb_sCompany: TComboBox;
    lb_JijumName1: TLabel;
    cmb_sJijum: TComboBox;
    ed_CardSeq: TEdit;
    Label1: TLabel;
    ed_sEmpNo: TEdit;
    lb_sabun: TLabel;
    Panel5: TPanel;
    Image1: TImage;
    btn_Image: TSpeedButton;
    ed_EmpImg: TEdit;
    Label2: TLabel;
    btn_PortRefresh: TSpeedButton;
    FileCtrl: TLMDFileCtrl;
    RzOpenDialog1: TOpenDialog;
    ADOQuery: TADOQuery;
    fdmsADOQuery: TADOQuery;
    btn_CardRead: TSpeedButton;
    mem_com: TMemo;
    lb_emType: TLabel;
    cmb_emType: TComboBox;
    btn_employeesave: TSpeedButton;
    chk_DupCard: TCheckBox;
    lb_FdmsID: TLabel;
    IdHTTP1: TIdHTTP;
    GroupBox4: TGroupBox;
    WebBrowser1: TWebBrowser;
    procedure FormShow(Sender: TObject);
    procedure Panel2Resize(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ed_sEmpNoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure cmb_CompanyChange(Sender: TObject);
    procedure cmb_JijumChange(Sender: TObject);
    procedure cmb_DepartChange(Sender: TObject);
    procedure cmb_PosiChange(Sender: TObject);
    procedure cmb_sCompanyChange(Sender: TObject);
    procedure cmb_sJijumChange(Sender: TObject);
    procedure btn_ZipcodeSearchClick(Sender: TObject);
    procedure CommandArrayCommandsTCommand0Execute(Command: TCommand;
      Params: TStringList);
    procedure btn_ImageClick(Sender: TObject);
    procedure btn_PortRefreshClick(Sender: TObject);
    procedure ed_sEmpNoKeyPress(Sender: TObject; var Key: Char);
    procedure btn_CancelClick(Sender: TObject);
    procedure btn_UpdateClick(Sender: TObject);
    procedure btn_CardReadClick(Sender: TObject);
    procedure cmb_ComPortChange(Sender: TObject);
    procedure btn_employeesaveClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ed_sEmpNMEnter(Sender: TObject);
    procedure ed_sEmpNoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CommandArrayCommandsTCloseExecute(Command: TCommand;
      Params: TStringList);
  private
    L_nTopRow : integer;
    L_stStopCard : string;
    L_bSendResult : Boolean;
    L_bWait : Boolean;
    L_bEmployeeShow : Boolean;
    L_bKTDupCardReg : Boolean; //KT중복카드 발급

    CompanyCodeList : TStringList;
    sCompanyCodeList :TStringList;
    JijumCodeList : TStringList;
    sJijumCodeList : TStringList;
    PosiCodeList : TStringList;
    sPosiCodeList : TStringList;
    DepartCodeList : TStringList;
    sDepartCodeList : TStringList;
    ComPortList : TStringList;
    EmpTypeCodeList : TStringList;
    L_stReadCardNo : string;
    { Private declarations }
    procedure FormClear(aFull:Boolean=True);
    procedure FormNameSet;
    procedure ShowEmployee(aCode : string;aTopRow:integer = 0);
    Function CheckEmployee(aEmCode:string):Boolean;
    Function GetCardNextSeq(aEmCode:string) : string;
    Function EmployeeSearch(aClick:Boolean) : string;
  public
    Function InialzeCard:Boolean; //카드 초기화
    Function WriteCardInfo(aCardNo:string):Boolean; //카드 정보 Writer
    Function SearchCardInfo(aCardNo:string;aCheck:Boolean=True):integer; //카드 정보 Search
    Procedure RcvCardDataByReader(aData:String);
    Function CardReadCheck(aData:string):Boolean;
    Function ACKCheck(aData:string):Boolean;
    Function NACKCheck(aData:string):Boolean;
  private

    Function DupCheckTB_Employee(aCompanyCode,aEmCode:string):Boolean;
    Function CheckTB_CARDCardNo(aCardNo:string):Boolean;
    Function CheckTB_CARD(aCardNo,aCompanyCode,aEmpID,aCardType :string;var Mode:string) : Boolean;
    Function CheckTB_KTCARDISSUE(aEmCode:string;var aCardSeq:string):Boolean;
    Function GetEmployeeFdmsID(aCompanyCode,aEmpID:string):string;
    Function GetMaxPositionNum : integer;

    Function EmployeeInfoSave:Boolean;
    Function SaveTB_KTCARDISSUE(aEmCode,aCardSeq:string;aWrite:string = 'N';aWriteDate:string = ''):Boolean;

    Function CopyGradeOldCard(aOldCard,aNewCard:string):Boolean;
    Function ChangeCardNo(aOldCard,aNewCard:string):Boolean;
    Function ChangeTB_ACCESSEVENTCardNo(aOldCard,aNewCard:string):Boolean;
    Function ChangeTB_ATCARDCardno(aOldCard,aNewCard:string):Boolean;

    Function InsertTB_DEVICECARDNONotExist(aOldCardNO,aNewCardNO:string):Boolean;
    Function InsertTB_EMPLOYEE(aEmpID,aEmpNM,aCompanyCode,aJijumCode,aDepartCode,aPosiCod,aCompanyPhone,
                                 aJoinDate,aRetireDate,aZipcode,aAddr1,aAddr2,aHomePhone,aHandphone,
                                 aRegGubun,aCardNo,aEmpImg,afdmsId,aEmTypeCode:string):Boolean;
    Function InsertTB_CARD(aCardNo,aCardGubun,aCardType,aEmpID,aCompanyCode:string) : Boolean;
    Function InsertTB_KTCARDISSUE(aEmCode,aCardSeq,aWrite,aWriteDate:string):Boolean;
    Function UpdateTB_KTCARDISSUE(aEmCode,aCardSeq,aWrite,aWriteDate:string):Boolean;
    Function UpdateTB_DEVICECARDNOPermitDelete(aOldCardNo:string):Boolean;
    Function UpdateTB_DEVICECARDNO(aCardNo,aPermit:string):Boolean; //모든 카드 권한을 삭제 처리함
    Function UpdateTB_EMPLOYEE(aEmpID,aEmpNM,aCompanyCode,aJijumCode,aDepartCode,aPosiCod,aCompanyPhone,
                                 aJoinDate,aRetireDate,aZipcode,aAddr1,aAddr2,aHomePhone,aHandphone,
                                 aRegGubun,aCardNo,aEmpImg,aEmTypeCode:string):Boolean;
    Function UpdateTB_CARD(aCardNo,aCardGubun,aCardType,aEmpID,aCompanyCode:string) : Boolean;
    Function UpdateTB_CARDCardNo(aOldCardNo,aNewCardNo:string):Boolean;
    Function DeleteTB_CARDCardNo(aOldCardNO:string):Boolean;
    Function DeleteTB_DEVICECARDNOCardNo(aCardNo:string):Boolean;
  private
    function SaveKTCARDISSUEIntegrate(aEmpID,aCardNo,aCardSeq:string):Boolean;
  public
    { Public declarations }
    function GetSerialPortList(List : TStringList; const doOpenTest : Boolean = True) : LongWord;
    function EncodeCommportName(PortNum : WORD) : String;
    function DecodeCommportName(PortName : String) : WORD;
  end;

var
  fmKTCardCreate: TfmKTCardCreate;

implementation

uses
  uCompanyCodeLoad,
  uLomosUtil,
  uDataModule1, uZipCode, uMssql, uPostGreSql, uMDBSql, uCommonSql,
  uFireBird,
  DIMime, UCommonModule;
{$R *.dfm}




procedure TfmKTCardCreate.FormShow(Sender: TObject);
var
  nIndex : integer;
  ini_fun : TiniFile;
  stCompanyCode : string;
begin
  Panel12.Caption := fmKTCardCreate.Caption;

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

  GridInit(sg_Employ,7);

  LoadCompanyCode(CompanyCodeList,cmb_Company);
  if cmb_Company.ItemIndex > 0 then
    LoadJijumCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],JijumCodeList,cmb_Jijum);
  LoadDepartCode('','',DepartCodeList,cmb_Depart);
  LoadsCompanyCode(sCompanyCodeList,cmb_sCompany);
  if cmb_sCompany.Items.Count > 1 then
     cmb_sCompany.ItemIndex := 1;
  if cmb_sCompany.ItemIndex > 0 then LoadsJijumCode(sCompanyCodeList.Strings[cmb_sCompany.ItemIndex],sJijumCodeList,cmb_sJijum);
  if cmb_sJijum.ItemIndex > 0 then 
    LoadsDepartCode(copy(sJijumCodeList.Strings[cmb_sJijum.ItemIndex],1,3),copy(sJijumCodeList.Strings[cmb_sJijum.ItemIndex],4,3),sDepartCodeList,cmb_sDepart);

  stCompanyCode := '000';
  if cmb_Company.ItemIndex > 0 then stCompanyCode := CompanyCodeList.Strings[cmb_Company.ItemIndex];
  LoadPosiCode(stCompanyCode,PosiCodeList,cmb_Posi);
  stCompanyCode := '000';
  if cmb_sCompany.ItemIndex > 0 then stCompanyCode := sCompanyCodeList.Strings[cmb_sCompany.ItemIndex];
  LoadsPosiCode(stCompanyCode,sPosiCodeList,cmb_sPosi);

  LoadsEmpType(EmpTypeCodeList,cmb_EmType);

  btn_Update.Enabled := False;

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
    end;
    if strtoint(CompanyGrade) > 2 then
    begin
      nIndex := JijumCodeList.IndexOf(MasterCompany + MasterJijum);
      if nIndex > -1 then cmb_Jijum.ItemIndex := nIndex;
      cmb_Jijum.Enabled := False;
    end;
    LoadPosiCode(MasterCompany,PosiCodeList,cmb_Posi);
  end;
  
  if cmb_Company.ItemIndex > -1 then
  begin
    LoadJijumCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],JijumCodeList,cmb_Jijum);
    LoadPosiCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],PosiCodeList,cmb_Posi);
  end;

  FormNameSet;
  FormClear;

  ini_fun := TiniFile.Create(ExeFolder + '\zmos.INI');
  cmb_ComPort.ItemIndex := ini_fun.ReadInteger('CARDCREATE','COMPORT',3);
  ini_fun.Free;
  cmb_ComPortChange(self);

  chk_DupCard.Checked := False;
  chk_DupCard.Visible := G_bKTDupCardReg;

//  btn_PortRefreshClick(btn_PortRefresh);
//  btn_SearchClick(Self);
end;

procedure TfmKTCardCreate.Panel2Resize(Sender: TObject);
var
  nWidth : integer;
  nBlock : integer;
  nLeft : integer;
  nCenter : integer;
begin
  nWidth := Panel2.Width;
  nBlock := (nWidth - 200) div 3; //양쪽으로 50 씩 띄우자

  nCenter := nBlock div 3;
  nLeft := nCenter - (btn_Update.Width div 3);

  btn_Update.Left := 100 + nLeft;
  btn_employeesave.Left := 100 + (nBlock * 1) + nLeft;
  btn_Cancel.Left := 100 + (nBlock * 2) + nLeft;

end;

procedure TfmKTCardCreate.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmKTCardCreate.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'KTCardCreate';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;

  CompanyCodeList.Free;
  sCompanyCodeList.Free;
  JijumCodeList.Free;
  sJijumCodeList.Free;
  PosiCodeList.Free;
  sPosiCodeList.Free;
  DepartCodeList.Free;
  sDepartCodeList.Free;
  ComPortList.Free;
  EmpTypeCodeList.Free;

  Action := caFree;
end;

procedure TfmKTCardCreate.ed_sEmpNoExit(Sender: TObject);
begin
  L_stReadCardNo := '';
  EmployeeSearch(btn_CardRead.Enabled);
end;

procedure TfmKTCardCreate.FormCreate(Sender: TObject);
begin
//  self.ModuleID := 'TfmKTCardCreate';

  L_nTopRow := 1;

  L_bEmployeeShow := False;

  GroupBox4.Left := -1024;
end;

procedure TfmKTCardCreate.FormNameSet;
begin

  with sg_Employ do
  begin
    Cells[0,0] := FM002;
    Cells[1,0] := FM101;
    cells[2,0] := '차수';
    Cells[3,0] := FM102;
    Cells[4,0] := FM012;
    Cells[5,0] := FM022;
    Cells[6,0] := FM032;
    Cells[7,0] := FM001;
    Cells[8,0] := FM011;
    Cells[9,0] := FM021;
    Cells[10,0] := FM031;
    Cells[11,0] := FM103;
    Cells[12,0] := FM104;
    Cells[13,0] := FM105;

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

procedure TfmKTCardCreate.btn_SearchClick(Sender: TObject);
begin
  ShowEmployee('');
end;

procedure TfmKTCardCreate.cmb_CompanyChange(Sender: TObject);
begin
  LoadJijumCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],JijumCodeList,cmb_Jijum);
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
  LoadPosiCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],PosiCodeList,cmb_Posi);
//  btn_SearchClick(Self);
end;

procedure TfmKTCardCreate.cmb_JijumChange(Sender: TObject);
begin
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
//  btn_SearchClick(Self);
end;

procedure TfmKTCardCreate.cmb_DepartChange(Sender: TObject);
begin
//  btn_SearchClick(Self);

end;

procedure TfmKTCardCreate.cmb_PosiChange(Sender: TObject);
begin
//  btn_SearchClick(Self);
end;

procedure TfmKTCardCreate.cmb_sCompanyChange(Sender: TObject);
begin
  LoadsJijumCode(sCompanyCodeList.Strings[cmb_sCompany.ItemIndex],sJijumCodeList,cmb_sJijum);
  LoadsPosiCode(sCompanyCodeList.Strings[cmb_sCompany.ItemIndex],sPosiCodeList,cmb_sPosi);
end;

procedure TfmKTCardCreate.cmb_sJijumChange(Sender: TObject);
begin
  LoadsDepartCode(copy(sJijumCodeList.Strings[cmb_sJijum.ItemIndex],1,3),copy(sJijumCodeList.Strings[cmb_sJijum.ItemIndex],4,3),sDepartCodeList,cmb_sDepart);

end;

procedure TfmKTCardCreate.btn_ZipcodeSearchClick(Sender: TObject);
begin
  fmZipCode:= TfmZipCode.Create(Self);
  fmZipCode.CallingModuleID := 'TfmKTCardCreate';
  fmZipCode.SHowmodal;
  fmZipCode.Free;

end;

procedure TfmKTCardCreate.CommandArrayCommandsTCommand0Execute(
  Command: TCommand; Params: TStringList);
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

procedure TfmKTCardCreate.btn_ImageClick(Sender: TObject);
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

procedure TfmKTCardCreate.ShowEmployee(aCode: string; aTopRow: integer);
var
  stSql : string;
  nRow : integer;
  i : integer;
  TempAdoQuery : TADOQuery;
begin
  if L_bEmployeeShow then Exit;
  L_bEmployeeShow := True;
  GridInitialize(sg_Employ); //스트링그리드 초기화

  if DBTYPE = 'MSSQL' then stSql := MSSQL.SelectTB_EMPLOYEEJoinKTCardISSUE
  else if DBType = 'PG' then stSql := PostGreSql.SelectTB_EMPLOYEEJoinKTCardISSUE
  else if DBType = 'MDB' then stSql := MDBSql.SelectTB_EMPLOYEEJoinBase
  else if DBType = 'FB' then stSql := FireBird.SelectTB_EMPLOYEEJoinKTCardISSUE
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
  if Trim(ed_EmpNo.Text) <> '' then
    stSql := stSql + ' AND a.EM_CODE = ''' + Trim(ed_EmpNo.Text)  + ''' ';
  if Trim(ed_EmpNM.Text) <> '' then
    stSql := stSql + ' AND a.EM_NAME LIKE ''' + Trim(ed_EmpNM.Text)  + '%'' ';

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

      sg_Employ.RowCount := RecordCount + 1;
      nRow := 1;
      First;
      while Not Eof do
      begin
        with sg_Employ do
        begin
          cells[0,nRow] := FindField('COMPANYNAME').AsString;
          cells[1,nRow] := FindField('EM_CODE').AsString;
          Try
            cells[2,nRow] := inttostr(FindField('CARD_SEQ').asinteger);
          Except
            cells[2,nRow] := '0';
          End;
          cells[3,nRow] := FindField('EM_NAME').AsString;
          cells[4,nRow] := FindField('JIJUMNAME').AsString;
          cells[5,nRow] := FindField('DEPARTNAME').AsString;
          cells[6,nRow] := FindField('PO_NAME').AsString;
          cells[7,nRow] := FindField('CO_COMPANYCODE').AsString;
          cells[8,nRow] := FindField('CO_JIJUMCODE').AsString;
          cells[9,nRow] := FindField('CO_DEPARTCODE').AsString;
          cells[10,nRow] := FindField('PO_POSICODE').AsString;
          if FindField('EM_COTELENCRYPT').AsString = 'Y' then
          begin
            cells[11,nRow] := MimeDecodeString(FindField('EM_COPHONE').AsString);
          end else
          begin
            cells[11,nRow] := FindField('EM_COPHONE').AsString;
          end;
          //cells[11,nRow] := FindField('EM_COPHONE').AsString;
          cells[12,nRow] := FindField('EM_JOINDATE').AsString;
          cells[13,nRow] := FindField('EM_RETIREDATE').AsString;
          cells[14,nRow] := FindField('ZI_ZIPCODE').AsString;
          cells[15,nRow] := FindField('EM_ADDR1').AsString;
          cells[16,nRow] := FindField('EM_ADDR2').AsString;
          cells[17,nRow] := FindField('EM_HOMEPHONE').AsString;
          cells[18,nRow] := FindField('EM_HANDPHONE').AsString;
          //if FindField('EM_IMAGE').IsNull then  cells[19,nRow] := 'N'
          //else cells[19,nRow] := 'Y';
          cells[20,nRow] := FindField('CA_CARDNO').AsString;
          cells[21,nRow] := FindField('CA_CARDTYPE').AsString;
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
        if sg_Employ.Row > 6 then sg_Employ.TopRow := sg_Employ.Row - 5;
      end else
      begin
        sg_Employ.TopRow := aTopRow;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
    L_bEmployeeShow := False;
  End;
  ed_EmpNo.Text := '';

end;

procedure TfmKTCardCreate.btn_PortRefreshClick(Sender: TObject);
var
  nCount : integer;
  i : integer;
  stTemp : string;
begin
{  if ReaderPort.Open then ReaderPort.Open := False;
  
  ComPortList.Clear;
  nCount := GetSerialPortList(ComPortList);
  cmb_ComPort.Clear;
  if nCount = 0 then
  begin
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
    Exit;
  end;   }

end;

function TfmKTCardCreate.DecodeCommportName(PortName: String): WORD;
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

function TfmKTCardCreate.EncodeCommportName(PortNum: WORD): String;
begin
 if PortNum < 10
    then Result := 'COM' + IntToStr(PortNum) + ':'
    else Result := '\\.\COM'+IntToStr(PortNum);

end;


function TfmKTCardCreate.GetSerialPortList(List: TStringList;
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

function TfmKTCardCreate.CheckEmployee(aEmCode: string): Boolean;
var
  stSql : string;
  nIndex : integer;
  stCompanyCode,stJijumCode,stDepartCode,stPosiCode:string;
  stImage : string;
begin
  result := False;
  stSql := ' Select a.*,b.CA_CARDNO from TB_EMPLOYEE a ';
  stSql := stSql + ' Left Join TB_CARD b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.EM_CODE = b.EM_CODE  ';
  stSql := stSql + ' AND b.CA_GUBUN = ''1'' ) ';  //발급카드
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.EM_CODE = ''' + aEmCode + ''' ';

  with ADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      showmessage('테이블 오픈 실패');
      Exit;
    End;
    if recordCount > 1 then
    begin
      showmessage('같은 사번의 카드가 2장이상 존재합니다. 사원테이블을 확인후 작업하세요.');
      Exit;
    end;
    if recordCount = 1 then
    begin
      if Trim(FindField('CA_CARDNO').AsString) <> '' then
      begin
        if L_stReadCardNo <> Trim(FindField('CA_CARDNO').AsString) then
        begin
          if (Application.MessageBox(PChar('이미 등록된 카드가 있습니다. 등록된 카드를 정지하시겠습니까?'),'정보',MB_OKCANCEL) = IDCANCEL)  then Exit;
          L_stStopCard := FindField('CA_CARDNO').AsString;
        end;
      end;
      ed_sEmpNo.Text := FindField('EM_CODE').AsString;
      ed_sEmpNM.Text := FindField('EM_NAME').AsString;
      stCompanyCode:= FindField('CO_COMPANYCODE').AsString;
      stJijumCode:= FindField('CO_JIJUMCODE').AsString;
      stDepartCode:=  FindField('CO_DEPARTCODE').AsString;
      stPosiCode:=  FindField('PO_POSICODE').AsString;
      lb_FdmsID.Caption := inttostr(FindField('FDMS_ID').AsInteger);

      nIndex := sCompanyCodeList.IndexOf(stCompanyCode);
      if nIndex > -1 then  cmb_sCompany.ItemIndex := nIndex;
      if cmb_sCompany.ItemIndex > 0 then
      begin
        LoadsJijumCode(stCompanyCode,sJijumCodeList,cmb_sJijum);
        nIndex := sJijumCodeList.IndexOf(stCompanyCode + stJijumCode);
        if nIndex > -1 then cmb_sJijum.ItemIndex := nIndex;
      end;
      if cmb_sJijum.ItemIndex > 0 then
      begin
        LoadsDepartCode(stCompanyCode,stJijumCode,sDepartCodeList,cmb_sDepart);
        nIndex := sDepartCodeList.IndexOf(stCompanyCode + stJijumCode + stDepartCode);
        if nIndex > -1 then cmb_sDepart.ItemIndex := nIndex;
      end;
      if cmb_sCompany.ItemIndex > 0 then
      begin
        LoadsPosiCode(stCompanyCode,sPosiCodeList,cmb_sPosi);
        nIndex := sPosiCodeList.IndexOf(stCompanyCode + stPosiCode);
        if nIndex > -1 then cmb_sPosi.ItemIndex := nIndex;
      end;
      ed_sCompanyPhone.Text := FindField('EM_COPHONE').AsString;
      if length(FindField('EM_JOINDATE').AsString) = 14 then
        dt_sJoinDt.Date := strToDate(copy(FindField('EM_JOINDATE').AsString,1,4) + '-' + copy(FindField('EM_JOINDATE').AsString,5,2) + '-' + copy(FindField('EM_JOINDATE').AsString,7,2) ) ;
      if length(FindField('EM_RETIREDATE').AsString) = 14 then
        dt_sRetireDt.Date := strToDate(copy(FindField('EM_RETIREDATE').AsString,1,4) + '-' + copy(FindField('EM_RETIREDATE').AsString,5,2) + '-' + copy(FindField('EM_RETIREDATE').AsString,7,2) ) ;
      ed_sZipcode.Text := FindField('ZI_ZIPCODE').AsString;
      ed_sAddr1.Text := FindField('EM_ADDR1').AsString;
      ed_sAddr2.Text := FindField('EM_ADDR2').AsString;
      ed_sHomePhone.Text := FindField('EM_HOMEPHONE').AsString;
      ed_sHandphone.Text := FindField('EM_HANDPHONE').AsString;

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
  result := True;
end;

function TfmKTCardCreate.GetCardNextSeq(aEmCode: string): string;
var
  stSql : string;
begin
  result := '51';
  stSql := 'select * from TB_KTCARDISSUE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';

  With ADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    result := FillZeroNumber((FindField('CARD_SEQ').AsInteger + 1),2);
  end;
end;

procedure TfmKTCardCreate.ed_sEmpNoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = Char(VK_RETURN) then
      Perform(WM_NEXTDLGCTL,0,0);
end;

procedure TfmKTCardCreate.btn_CancelClick(Sender: TObject);
begin
  FormClear;
end;

procedure TfmKTCardCreate.FormClear(aFull:Boolean=True);
var
  nIndex : integer;
begin
  if aFull then
  begin
    ed_sEmpNo.Text := '';
    ed_sEmpNo.Enabled := True;
  end;
  
  ed_sEmpNM.Text := '';
//  cmb_sCompany.ItemIndex := 0 ;
  //cmb_sJijum.Clear;
  //sJijumCodeList.Clear;
  LoadsJijumCode(sCompanyCodeList.Strings[cmb_sCompany.ItemIndex],sJijumCodeList,cmb_sJijum);
  cmb_sDepart.Clear;
  sDepartCodeList.Clear;
  if cmb_sJijum.ItemIndex > 0 then 
    LoadsDepartCode(copy(sJijumCodeList.Strings[cmb_sJijum.ItemIndex],1,3),copy(sJijumCodeList.Strings[cmb_sJijum.ItemIndex],4,3),sDepartCodeList,cmb_sDepart);
  cmb_sPosi.ItemIndex := 0;
  nIndex := EmpTypeCodeList.IndexOf(G_stRelayDefaultCode);
  if nIndex > -1 then cmb_EmType.ItemIndex := nIndex;
  //cmb_emType.ItemIndex := 0;
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
  ed_CardSeq.Text := '';
  ed_CardNo.Text := '';
  lb_FdmsID.Caption := '';
  btn_Update.Enabled := False;
end;

procedure TfmKTCardCreate.btn_UpdateClick(Sender: TObject);
var
  stCardNo : string;
  stCompanyCode : string;
  stJijumCode : string;
  stDepartCode : string;
  stPosiCode : string;
  stEmCode : string;
  stSql : string;
  nResult : integer;
begin
  if fmMain.CardCreatePort.Open then fmMain.CardCreatePort.Open := False;
  Delay(200);
  Try
    fmMain.CardCreatePort.Open := True;
  Except
    showmessage('포트오픈 실패');
    Exit;
  End;

  ed_CardNo.Text := '';
  L_stReadCardNo := '';
  nResult := SearchCardInfo('',False);
  if nResult < 0 then
  begin
    nResult := SearchCardInfo('',False);  //한번 더 카드 조회하자.
  end;
  if nResult = 0  then
  begin
    showmessage('이미 발급된 카드입니다. ' + fmMain.mn_KTCardReg.Caption + ' 메뉴를 이용하여 사원등록을 수행 하세요.');
    Exit;
  end else if nResult < 0  then
  begin
    showmessage('카드발급기가 응답이 없습니다.');
    Exit;
  end;
  {if Not SearchCardInfo('',False) then
  begin
    showmessage('이미 발급된 카드입니다.KT카드발급등록 메뉴를 이용하여 사원등록을 수행 하세요.');
    Exit;
  end; }
  ed_sEmpNo.Enabled := True;
  if cmb_sCompany.ItemIndex < 1 then
  begin
    showmessage('회사코드는 반드시 선택하셔야 합니다.');
    Exit;
  end;
  stCardNo := Trim(ed_sEmpNo.Text) + Trim(ed_CardSeq.Text);
  if Length(stCardNo) <> 11 then
  begin
    showmessage('사번과 차수 정보를 확인하세요.');
    Exit;
  end;
  if Not L_bKTDupCardReg then
  begin
    if CheckTB_CARDCardNo(stCardNo) then
    begin
      ed_CardSeq.Text := FillZeroNumber(strtoint(ed_CardSeq.Text) + 1,2);
      stCardNo := Trim(ed_sEmpNo.Text) + Trim(ed_CardSeq.Text);
      //showmessage('이미 등록되어 있는 카드입니다. 확인 후 재 작업하세요.');
      //Exit;
    end;
  end;
  if Not InialzeCard then
  begin
    showmessage('카드 초기화에 실패하였습니다.');
    Exit;
  end;
  if Not WriteCardInfo(stCardNo) then
  begin
    showmessage('카드 발급에 실패하였습니다.');
    Exit;
  end;
  if SearchCardInfo(stCardNo) < 1 then
  begin
    //showmessage('발급 정보와 조회 정보가 일치하지 않습니다.');
    Exit;
  end;

  stCompanyCode := '000';
  stJijumCode := '000';
  stDepartCode := '000';
  stPosiCode := '000';
  stEmCode := '';

  if cmb_sCompany.ItemIndex > 0 then stCompanyCode := copy(sCompanyCodeList.Strings[cmb_sCompany.itemIndex],1,3);
  if cmb_sJijum.ItemIndex > 0 then stJijumCode := copy(sJijumCodeList.Strings[cmb_sJijum.itemIndex],4,3);
  if cmb_sDepart.ItemIndex > 0 then  stDepartCode := copy(sDepartCodeList.Strings[cmb_sDepart.itemIndex],7,3);
  if cmb_sPosi.ItemIndex > 0 then  stPosiCode := copy(sPosiCodeList.Strings[cmb_sPosi.ItemIndex],4,3);
  stEmCode := ed_sEmpNo.Text;

  if L_stStopCard <> '' then
  begin
    if stCardNo <> L_stStopCard then
    begin
      DeleteTB_DEVICECARDNOCardNo(stCardNo); // 권한테이블에 새로 등록할 카드에 대한 찌꺼기가 남아 있으면 삭제
      CopyGradeOldCard(L_stStopCard,stCardNo); //여기서 권한을 복사 L_stStopCard -> stCardNo
      //ChangeCardNo(L_stStopCard,stCardNo);
      UpdateTB_DEVICECARDNOPermitDelete(L_stStopCard);//L_stStopCard 권한 삭제
      stSql := CommonSql.InsertIntoTB_EMPHIS(stCompanyCode,stEmCode,lb_FdmsID.Caption,'2',L_stStopCard,'2',
             ed_sEmpNM.Text,'',cmb_sCompany.Text,cmb_sJijum.Text,cmb_sDepart.Text,cmb_sPosi.Text);
      DataModule1.ProcessExecSQL(stSql);
      //DeleteTB_CARDCardNo(L_stStopCard);//L_stStopCard 카드 삭제
      UpdateTB_CARDCardNo(L_stStopCard,stCardNo);
      stSql := CommonSql.InsertIntoTB_EMPLOYEECHANGE(stCompanyCode,stEmCode,L_stStopCard,'KTCardCreate','2');
      DataModule1.ProcessExecSQL(stSql);
    end;
  end;
  //테스트를 위함
  //ed_CardNo.Text := stCardNo;
  if Not EmployeeInfoSave then
  begin
    showmessage('사원정보 저장 실패');
    Exit;
  end;  //여기서 사원정보 저장
  SaveTB_KTCARDISSUE(Trim(ed_sEmpNo.Text),Trim(ed_CardSeq.Text),'Y',FormatDateTime('yyyymmdd',Now));
  //SaveKTCARDISSUEIntegrate(Trim(ed_sEmpNo.Text),stCardNo,Trim(ed_CardSeq.Text));
  L_stReadCardNo := '';
  if chk_DupCard.Checked then
  begin
    L_stStopCard := '';
    chk_DupCard.Checked := False;
    L_bKTDupCardReg := True;
  end else
  begin
    ed_sEmpNo.Enabled := True;
    btn_Update.Enabled := False;
    FormClear;
    L_bKTDupCardReg := False;
  end;
  showmessage('발급완료');
end;

function TfmKTCardCreate.InialzeCard: Boolean;
var
  stSendData : string;
  PastTime : dword;
begin
  result := False;
  if Not fmMain.CardCreatePort.Open then
  begin
    showmessage('포트가 오픈되지 않았습니다.');
    Exit;
  end;
  stSendData :=   #$51 + #$5D;
  L_bSendResult := False;
  L_bWait := False;
  fmMain.CardCreatePort.PutString(stSendData);
  mem_com.Lines.Add('[TX]' + Ascii2Hex(stSendData));

  PastTime := GetTickCount + KTDelayTime;
  while Not L_bWait do
  begin
    if Not fmMain.CardCreatePort.Open then Exit;
    Application.ProcessMessages;
    if GetTickCount > PastTime then Exit;  //3000밀리동안 응답 없으면 실패로 처리함
  end;
  if L_bSendResult then Result := true;
end;

function TfmKTCardCreate.SearchCardInfo(aCardNo: string;aCheck:Boolean=True): integer;
var
  stSendData : string;
  PastTime : dword;
  stCardNo : string;
begin
  result := -1;
  if Not fmMain.CardCreatePort.Open then
  begin
    showmessage('포트가 오픈되지 않았습니다.');
    Exit;
  end;
  stSendData :=   'R' + #$5D;
  L_bSendResult := False;
  L_bWait := False;
  fmMain.CardCreatePort.PutString(stSendData);
  mem_com.Lines.Add('[TX]' + Ascii2Hex(stSendData));

  PastTime := GetTickCount + KTDelayTime;
  while Not L_bWait do
  begin
    if Not fmMain.CardCreatePort.Open then Exit;
    Application.ProcessMessages;
    if GetTickCount > PastTime then Exit;  //3000밀리동안 응답 없으면 실패로 처리함
  end;

  if Not aCheck then
  begin
    if Trim(ed_CardNo.Text) <> '' then  result := 0
    else result := 1;{
    begin
      L_stReadCardNo := Trim(ed_CardNo.Text);
      stCardNo := ed_CardNo.Text;
      ed_EmpNo.Text := copy(stCardNo,1,9);
      btn_SearchClick(self);
      ed_sEmpNo.Text := copy(stCardNo,1,9);
      ed_sEmpNM.SetFocus;
      EmployeeSearch(TRUE);
      ed_CardSeq.Text := copy(stCardNo,10,2);
      ed_CardNo.Text := stCardNo;
      btn_Update.Enabled := False;
      btn_employeesave.Enabled := True;
      ed_sEmpNo.Enabled := False;
    end;  }
    Exit;
  end;

  if Trim(ed_CardNo.Text) = aCardNo then Result := 1
  else
  begin
    if Trim(ed_CardNo.Text) <> '' then
    begin
      showmessage('발급 정보와 조회 정보가 일치하지 않습니다.');
      Exit;
    end;
  end;

end;

function TfmKTCardCreate.WriteCardInfo(aCardNo: string): Boolean;
var
  stSendData : string;
  PastTime : dword;
begin
  result := False;
  if Not fmMain.CardCreatePort.Open then
  begin
    showmessage('포트가 오픈되지 않았습니다.');
    Exit;
  end;     
  stSendData :=   'W' + aCardNo + #$5D;
  L_bSendResult := False;
  L_bWait := False;
  fmMain.CardCreatePort.PutString(stSendData);
  mem_com.Lines.Add('[TX]' + Ascii2Hex(stSendData));

  PastTime := GetTickCount + KTDelayTime;
  while Not L_bWait do
  begin
    if Not fmMain.CardCreatePort.Open then Exit;
    Application.ProcessMessages;
    if GetTickCount > PastTime then Exit;  //3000밀리동안 응답 없으면 실패로 처리함
  end;

  if L_bSendResult then Result := true;
end;

procedure TfmKTCardCreate.RcvCardDataByReader(aData: String);
var
  nPos : integer;
begin
  mem_com.Lines.Add('[RX]' + Ascii2Hex(aData));
  nPos := Pos(#$02,aData);
  if nPos = 0 then Exit;
  Delete(aData,1,nPos);

  if ACKCheck(aData) then Exit;
  if NACKCheck(aData) then Exit;
//  if CardReadCheck(aData) then Exit;
  L_bWait := True;
  nPos := Pos(#$03,aData);
  ed_CardNo.Text := copy(aData,1,nPos - 1);


end;

function TfmKTCardCreate.CopyGradeOldCard(aOldCard,
  aNewCard: string): Boolean;
begin
  result := InsertTB_DEVICECARDNONotExist(aOldCard,aNewCard);
end;

function TfmKTCardCreate.CheckTB_CARDCardNo(aCardNo: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' Select * from TB_CARD ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  With ADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if RecordCount < 1 then Exit;
    result := True;
  end;

end;

function TfmKTCardCreate.DeleteTB_DEVICECARDNOCardNo(
  aCardNo: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Delete From TB_DEVICECARDNO ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmKTCardCreate.InsertTB_DEVICECARDNONotExist(aOldCardNO,
  aNewCardNO: string): Boolean;
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

function TfmKTCardCreate.UpdateTB_DEVICECARDNOPermitDelete(
  aOldCardNo: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_DEVICECARDNO set DE_PERMIT = ''N'', ';
  stSql := stSql + ' DE_RCVACK = ''N'' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aOldCardNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmKTCardCreate.DeleteTB_CARDCardNo(aOldCardNO: string): Boolean;
var
  stSql :string;
begin

  stSql := ' Delete From TB_CARD ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aOldCardNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
  
end;

function TfmKTCardCreate.EmployeeInfoSave: Boolean;
var
  stCompanyCode : string;
  stJijumCode : string;
  stDepartCode : string;
  stPosiCode : string;
  stEmCode : string;
  stFdmsId : string;
  bResult : Boolean;
  stEmTypeCode : string;
  stCophone : string;
begin
  result := False;
  stCompanyCode := '000';
  stJijumCode := '000';
  stDepartCode := '000';
  stPosiCode := '000';
  stEmCode := '';

  if cmb_sCompany.ItemIndex > 0 then stCompanyCode := copy(sCompanyCodeList.Strings[cmb_sCompany.itemIndex],1,3);
  if cmb_sJijum.ItemIndex > 0 then stJijumCode := copy(sJijumCodeList.Strings[cmb_sJijum.itemIndex],4,3);
  if cmb_sDepart.ItemIndex > 0 then  stDepartCode := copy(sDepartCodeList.Strings[cmb_sDepart.itemIndex],7,3);
  if cmb_sPosi.ItemIndex > 0 then  stPosiCode := copy(sPosiCodeList.Strings[cmb_sPosi.ItemIndex],4,3);
  stEmCode := ed_sEmpNo.Text;

  stEmTypeCode := '001';
  if cmb_emType.ItemIndex > 0 then stEmTypeCode := EmpTypeCodeList.Strings[cmb_emType.ItemIndex];

  stCophone :=  ed_sCompanyPhone.Text;
  if G_bEmployeeCophoneEncrypt then stCophone := MimeEncodeString(stCophone);

  if DupCheckTB_Employee(stCompanyCode,stEmCode) then
  begin
    bResult := UpdateTB_EMPLOYEE(stEmCode,ed_sEmpNM.Text,stCompanyCode,stJijumCode,
                                 stDepartCode,stPosiCode,stCophone,
                                 FormatDateTime('yyyymmdd',dt_sJoinDt.Date),FormatDateTime('yyyymmdd',dt_sRetireDt.Date),
                                 ed_sZipcode.Text,ed_sAddr1.Text,ed_sAddr2.Text,ed_sHomePhone.Text,ed_sHandphone.Text,
                                 '1',ed_CardNo.Text,ed_EmpImg.Text,stEmTypeCode);
  end else
  begin
    stFdmsId := CommonModule.GetNextFdmsID;
    bResult := InsertTB_EMPLOYEE(stEmCode,ed_sEmpNM.Text,stCompanyCode,stJijumCode,
                                 stDepartCode,stPosiCode,stCophone,
                                 FormatDateTime('yyyymmdd',dt_sJoinDt.Date),FormatDateTime('yyyymmdd',dt_sRetireDt.Date),
                                 ed_sZipcode.Text,ed_sAddr1.Text,ed_sAddr2.Text,ed_sHomePhone.Text,ed_sHandphone.Text,
                                 '1',ed_CardNo.Text,ed_EmpImg.Text,stFdmsId,stEmTypeCode);
  end;
  result := bResult;
end;

function TfmKTCardCreate.DupCheckTB_Employee(aCompanyCode,
  aEmCode: string): Boolean;
var
  stSql : string;
begin
  result := False;

  stSql := ' Select * from TB_Employee ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';

  with ADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    result := True;
  end;

end;

function TfmKTCardCreate.InsertTB_EMPLOYEE(aEmpID, aEmpNM, aCompanyCode,
  aJijumCode, aDepartCode, aPosiCod, aCompanyPhone, aJoinDate, aRetireDate,
  aZipcode, aAddr1, aAddr2, aHomePhone, aHandphone, aRegGubun, aCardNo,
  aEmpImg, afdmsId,aEmTypeCode: string): Boolean;
var
  stSql : string;
  bResult : Boolean;
  stMode : string;
  stImg : string;
begin
  Result := False;
  bResult := False;
  bResult := InsertTB_CARD(aCardNo,'1',aRegGubun,aEmpID,aCompanyCode);

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
  if G_bEmployeeCophoneEncrypt then stSql := stSql + 'EM_COTELENCRYPT, ';
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
  stSql := stSql + '''' + Master_ID + ''',';
  if G_bEmployeeCophoneEncrypt then stSql := stSql + '''Y'', ';
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
  stSql := CommonSql.InsertIntoTB_EMPLOYEECHANGE(aCompanyCode,aEmpID,aCardNo,'KTCardCreate','1');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmKTCardCreate.UpdateTB_EMPLOYEE(aEmpID, aEmpNM, aCompanyCode,
  aJijumCode, aDepartCode, aPosiCod, aCompanyPhone, aJoinDate, aRetireDate,
  aZipcode, aAddr1, aAddr2, aHomePhone, aHandphone, aRegGubun, aCardNo,
  aEmpImg,aEmTypeCode: string): Boolean;
var
  stMsg : string;
  bResult : Boolean;
  stMode : string;
  stSql : string;
  stImage : string;
  stFdmsID : string;
begin
  Result := False;

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
           aEmpNM,aHandphone,cmb_sCompany.Text,cmb_sJijum.Text,cmb_sDepart.Text,cmb_sPosi.Text);//수정
  result := DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_EMPLOYEECHANGE(aCompanyCode,aEmpID,aCardNo,'KTCardCreate','2');
  DataModule1.ProcessExecSQL(stSql);

end;


function TfmKTCardCreate.CheckTB_CARD(aCardNo, aCompanyCode, aEmpID,
  aCardType: string; var Mode: string): Boolean;
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

      Mode := 'Insert';
      if RecordCount < 1 then
      begin
        Exit;
      end;

      Mode := 'Update';

      if (FindField('CO_COMPANYCODE').AsString = aCompanyCode) AND
         (FindField('EM_CODE').AsString = aEmpID) then
      begin
        if FindField('CA_CARDTYPE').AsString = aCardType then  Result := False
        else Result := True;
        Exit;
      end;
    
      stMsg := '(' + aCardNo + ')카드번호는 ' + FM101 + '(' +
          FindField('EM_CODE').AsString + ') 으로 등록되어 있습니다. ' + #13 +
          FM101 + '(' + aEmpID + ') 으로 변경하시겠습니까? ';

      if (Application.MessageBox(PChar(stMsg),'변경',MB_OKCANCEL) = ID_CANCEL)  then
      begin
        Result := False;
        Exit;
      end;
      UpdateTB_DEVICECARDNO(aCardNo,'N'); //기존카드번호의 권한을 삭제합니다.
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TfmKTCardCreate.InsertTB_CARD(aCardNo, aCardGubun, aCardType,
  aEmpID, aCompanyCode: string): Boolean;
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

  Result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmKTCardCreate.UpdateTB_CARD(aCardNo, aCardGubun, aCardType,
  aEmpID, aCompanyCode: string): Boolean;
var
  stSql : string;
begin
  result := False;
  if Length(aCardNo) = 0 then Exit;
  if Not IsDigit(aCardGubun) then aCardGubun := '1';

  stSql := ' Update TB_CARD set ';
  stSql := stSql + 'CA_GUBUN = ''' + aCardGubun + ''',' ;
  stSql := stSql + 'CA_CARDTYPE = ''' + aCardType + ''',' ;
  stSql := stSql + 'EM_CODE = ''' + aEmpID + ''',' ;
  stSql := stSql + 'CO_COMPANYCODE = ''' + aCompanyCode + ''',' ;
  stSql := stSql + ' CA_MEMLOAD = ''N'',';
  stSql := stSql + 'CA_UPDATETIME = ''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',' ;
  stSql := stSql + 'CA_UPDATEOPERATOR = ''' + MASTER_ID + ''' ' ;
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  Result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmKTCardCreate.GetEmployeeFdmsID(aCompanyCode,
  aEmpID: string): string;
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

function TfmKTCardCreate.UpdateTB_DEVICECARDNO(aCardNo,
  aPermit: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Update TB_DEVICECARDNO Set ';
  stSql := stSql + ' DE_PERMIT = ''' + aPermit + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmKTCardCreate.GetMaxPositionNum: integer;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := 1;

  stSql := 'Select Max(PositionNum) as MaxPosition From TB_CARD ';

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
      if Not IsDigit(FindField('MaxPosition').AsString) then
      begin
        Exit;
      end;
      result := FindField('MaxPosition').AsInteger + 1;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmKTCardCreate.btn_CardReadClick(Sender: TObject);
begin
  btn_CardRead.Enabled := False;
  ed_sEmpNM.SetFocus;
  L_stReadCardNo := '';
  SearchCardInfo('',False);
  btn_CardRead.Enabled := True;
end;

function TfmKTCardCreate.SaveTB_KTCARDISSUE(aEmCode,
  aCardSeq: string;aWrite:string = 'N';aWriteDate:string = ''): Boolean;
var
  stSql : string;
  stCardSeq : string;
begin
  if Not IsDigit(aCardSeq) then Exit;

  if Trim(aWriteDate)='' then aWriteDate := FormatDateTime('yyyymmdd',Now);

  if Not CheckTB_KTCARDISSUE(aEmCode,stCardSeq) then
    InsertTB_KTCARDISSUE(aEmCode,aCardSeq,aWrite,aWriteDate)
  else
  begin
    if strtoint(stCardSeq) < strtoint(aCardSeq) then
      UpdateTB_KTCARDISSUE(aEmCode,aCardSeq,aWrite,aWriteDate)
    else UpdateTB_KTCARDISSUE(aEmCode,stCardSeq,aWrite,aWriteDate);
  end;

end;

function TfmKTCardCreate.CheckTB_KTCARDISSUE(aEmCode: string;var aCardSeq:string): Boolean;
var
  stSql : string;
begin
  aCardSeq := '';
  result := False;
  stSql := ' Select * from TB_KTCARDISSUE ';
  stsql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';

  With AdoQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if RecordCount < 1 then Exit;
    aCardSeq := inttostr(FindField('CARD_SEQ').AsInteger);
    result := True;
  end;

end;

function TfmKTCardCreate.InsertTB_KTCARDISSUE(aEmCode,
  aCardSeq,aWrite,aWriteDate: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_KTCARDISSUE(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' EM_CODE,';
  stSql := stSql + ' CARD_SEQ, ';
  stSql := stSql + ' KI_WRITE, ';
  stSql := stSql + ' KI_WRITEDATE ) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aEmCode + ''',';
  stSql := stSql + inttostr(strtoint(aCardSeq)) + ',';
  stSql := stSql + '''' + aWrite + ''',';
  stSql := stSql + '''' + aWriteDate + ''')';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmKTCardCreate.UpdateTB_KTCARDISSUE(aEmCode,
  aCardSeq,aWrite,aWriteDate: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_KTCARDISSUE Set ';
  stSql := stSql + ' CARD_SEQ = ' + inttostr(strtoint(aCardSeq)) + ',';
  stSql := stSql + ' KI_WRITE = ''' + aWrite + ''',';
  stSql := stSql + ' KI_WRITEDATE = ''' + aWriteDate + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + '''';

  result := DataModule1.ProcessExecSQL(stSql);

end;

procedure TfmKTCardCreate.cmb_ComPortChange(Sender: TObject);
var
  ini_fun : TiniFile;
begin
{  if cmb_ComPort.text = '' then Exit;
  if fmMain.CardCreatePort.Open then fmMain.CardCreatePort.Open := False;
  if cmb_ComPort.ItemIndex < 0 then Exit;

  Try
    ApdDataPacket1.AutoEnable := false;
    ApdDataPacket1.StartCond := scString;
    ApdDataPacket1.StartString := #$02;
    ApdDataPacket1.EndCond := [ecString];
    ApdDataPacket1.EndString := #$03;
    ApdDataPacket1.Timeout := 0;

    ReaderPort.ComNumber := cmb_ComPort.ItemIndex + 1; //Integer(ComPortList.Objects[cmb_ComPort.ItemIndex]);
    ReaderPort.Open := true;
    ApdDataPacket1.Enabled := True;
  Except
    showmessage('포트오픈실패');
  End;
  ini_fun := TiniFile.Create(ExeFolder + '\zmos.INI');
  ini_fun.WriteInteger('CARDCREATE','COMPORT',cmb_ComPort.ItemIndex);
  ini_fun.Free;   }

end;

function TfmKTCardCreate.CardReadCheck(aData: string): Boolean;
var
  nPos : integer;
begin
  result := False;
  result := True;
end;

function TfmKTCardCreate.ACKCheck(aData: string): Boolean;
var
  nPos : integer;
begin
  result := False;
  nPos := Pos(#$06,aData); //ACK 가 왔는지 체크
  if nPos = 0 then Exit;
  L_bWait := True;
  L_bSendResult := True;
  result := True;
end;

function TfmKTCardCreate.NACKCheck(aData: string): Boolean;
var
  nPos : integer;
begin
  result := False;
  nPos := Pos(#$07,aData); //NACK 가 왔는지 체크
  if nPos = 0 then  Exit;
  L_bWait := True;
  L_bSendResult := False;
  result := True;
end;

procedure TfmKTCardCreate.btn_employeesaveClick(Sender: TObject);
var
  stCardNo : string;
begin
  if cmb_sCompany.ItemIndex < 1 then
  begin
    showmessage('회사코드는 반드시 선택하셔야 합니다.');
    Exit;
  end;
  ed_sEmpNo.Enabled := True;
  stCardNo := Trim(ed_sEmpNo.Text) + Trim(ed_CardSeq.Text);
  if Length(stCardNo) <> 11 then
  begin
    showmessage('사번과 차수 정보를 확인하세요.');
    Exit;
  end;

  if L_stStopCard <> '' then
  begin
    if L_stStopCard <> stCardNo then
    begin
      DeleteTB_DEVICECARDNOCardNo(stCardNo); // 권한테이블에 새로 등록할 카드에 대한 찌꺼기가 남아 있으면 삭제
      CopyGradeOldCard(L_stStopCard,stCardNo); //여기서 권한을 복사 L_stStopCard -> stCardNo
      UpdateTB_DEVICECARDNOPermitDelete(L_stStopCard);//L_stStopCard 권한 삭제
      DeleteTB_CARDCardNo(L_stStopCard);//L_stStopCard 카드 삭제
    end;
  end;
  //테스트를 위함
  //ed_CardNo.Text := stCardNo;
  if Not EmployeeInfoSave then
  begin
    showmessage('사원정보 저장 실패');
    Exit;
  end;  //여기서 사원정보 저장
  SaveTB_KTCARDISSUE(Trim(ed_sEmpNo.Text),Trim(ed_CardSeq.Text));
  btn_Update.Enabled := False;

  btn_employeesave.Enabled := False;
  FormClear;
  showmessage('저장완료');
  //btn_Update.Enabled := True;
end;

function TfmKTCardCreate.EmployeeSearch(aClick: Boolean): string;
begin
  FormClear(False);
  //if aClick then L_stReadCardNo := '';
  L_stStopCard := '';
  btn_Update.Enabled := False;
  btn_employeesave.Enabled := False;

  if aClick then
  begin
    if Length(ed_sEmpNo.Text) <> 9 then
    begin
      showmessage('사번은 9자리 입니다.');
      Exit;
    end;
    if Not CheckEmployee(ed_sEmpNo.Text) then
    begin
      ed_sEmpNo.Text := '';
      Exit;
    end;
    btn_Update.Enabled := True;

    ed_CardSeq.Text := GetCardNextSeq(ed_sEmpNo.Text);
  end;
end;

function TfmKTCardCreate.ChangeCardNo(aOldCard, aNewCard: string): Boolean;
begin
  ChangeTB_ACCESSEVENTCardNo(aOldCard, aNewCard);
  ChangeTB_ATCARDCardno(aOldCard, aNewCard);

  result := True;
//  ChangeTB_ATEVENTCardno(aOldCard, aNewCard);

end;

function TfmKTCardCreate.ChangeTB_ACCESSEVENTCardNo(aOldCard,
  aNewCard: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Updeate TB_ACCESSEVENT set CA_CARDNO = ''' + aNewCard + ''' ';
  stSql := stSql + ' Where CA_CARDNO = ''' + aOldCard + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmKTCardCreate.ChangeTB_ATCARDCardno(aOldCard,
  aNewCard: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Updeate TB_ATCARD set CA_CARDNO = ''' + aNewCard + ''' ';
  stSql := stSql + ' Where CA_CARDNO = ''' + aOldCard + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmKTCardCreate.UpdateTB_CARDCardNo(aOldCardNo,
  aNewCardNo: string): Boolean;
var
  stSql :string;
begin

  stSql := ' Update TB_CARD set CA_CARDNO = ''' + aNewCardNo + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aOldCardNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

procedure TfmKTCardCreate.FormActivate(Sender: TObject);
begin
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'KTCardCreate';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;

end;

procedure TfmKTCardCreate.ed_sEmpNMEnter(Sender: TObject);
var
  TIMC: HIMC;
  dwSentence : DWORD;
  dwConversion : DWORD;
begin
  TIMC := ImmGetContext(TEdit(Sender).Handle);
  ImmGetConversionStatus(TIMC, dwConversion, dwSentence);
  ImmSetConversionStatus(TIMC, IME_CMODE_NATIVE, dwSentence); //영문시 IME_CMODE_ALPHANUMERIC
  ImmReleaseContext(TEdit(Sender).Handle, TIMC);

end;

function TfmKTCardCreate.SaveKTCARDISSUEIntegrate(aEmpID, aCardNo,
  aCardSeq: string): Boolean;
var
  conStr : string;
begin
  conStr := 'http://zeron.able.or.kr/ktcard/addCard.php?empid=' + aEmpID + '&cardno='+ aCardNo +'&issueno='+ aCardSeq;
  WebBrowser1.Navigate(conStr);

end;

procedure TfmKTCardCreate.ed_sEmpNoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if length(ed_sEmpNo.Text) = ed_sEmpNo.MaxLength then
      Perform(WM_NEXTDLGCTL,0,0);

end;

procedure TfmKTCardCreate.CommandArrayCommandsTCloseExecute(
  Command: TCommand; Params: TStringList);
begin
  inherited;
  Close;
end;

initialization
  RegisterClass(TfmKTCardCreate);
Finalization
  UnRegisterClass(TfmKTCardCreate);

end.
