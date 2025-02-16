unit uTreeEmployee;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, BaseGrid, AdvGrid, uSubForm, CommandArray,
  AdvPageControl, ComCtrls, AdvPanel, Buttons, StdCtrls,
  htmlbtns, XiButton, RzCmboBx,AdoDB,ActiveX, ImgList, Gauges,Jpeg,DB,
  LMDCustomComponent, LMDFileCtrl,IniFiles, Menus, AdvObj;

type

  TfmTreeEmployee = class(TfmASubForm)
    AdvPageControl1: TAdvPageControl;
    AdvTabSheet1: TAdvTabSheet;
    Splitter2: TSplitter;
    AdvPanel1: TAdvPanel;
    AdvPanelStyler1: TAdvPanelStyler;
    AdvPanel2: TAdvPanel;
    btn_Close: TXiButton;
    btn_Update: TXiButton;
    btn_Add: TXiButton;
    pan_Employee: TAdvPanel;
    AdvPanelStyler2: TAdvPanelStyler;
    btn_Delete: TXiButton;
    Splitter1: TSplitter;
    cmb_Company: TRzComboBox;
    lb_CompanyName: TLabel;
    lb_JijumName: TLabel;
    cmb_Jijum: TRzComboBox;
    lb_DepartName: TLabel;
    cmb_Depart: TRzComboBox;
    lb_PosiName: TLabel;
    cmb_Posi: TRzComboBox;
    lb_emType: TLabel;
    cmb_emType: TRzComboBox;
    lb_sabun: TLabel;
    ed_EmpNo: TEdit;
    ed_Name: TEdit;
    lb_Name: TLabel;
    Label6: TLabel;
    ed_Handphone: TEdit;
    Label7: TLabel;
    ed_CardNo: TEdit;
    Panel5: TPanel;
    Image1: TImage;
    btn_Save: TXiButton;
    btn_Cancel: TXiButton;
    lb_OutDate: TLabel;
    dt_RetireDt: TDateTimePicker;
    btn_Excel: TXiButton;
    toolslist: TImageList;
    AdvPanel3: TAdvPanel;
    TreeView_Location: TTreeView;
    TreeView_LocationCode: TTreeView;
    ed_SelectID: TEdit;
    sg_Employ: TAdvStringGrid;
    pan_gauge: TPanel;
    Label8: TLabel;
    Gauge1: TGauge;
    ed_EmpImg: TEdit;
    RzOpenDialog1: TOpenDialog;
    fdmsADOQuery: TADOQuery;
    FileCtrl: TLMDFileCtrl;
    SaveDialog1: TSaveDialog;
    PopupMenu_Employee: TPopupMenu;
    mn_add: TMenuItem;
    mn_Update: TMenuItem;
    mn_delete: TMenuItem;
    st_Exit: TStaticText;
    ed_CompanyPhone: TEdit;
    lb_CompanyPhone: TLabel;
    ed_OldEmpNo: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_AddClick(Sender: TObject);
    procedure btn_UpdateClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure TreeView_LocationClick(Sender: TObject);
    procedure sg_EmployResize(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure dt_RetireDtChange(Sender: TObject);
    procedure cmb_CompanyChange(Sender: TObject);
    procedure cmb_JijumChange(Sender: TObject);
    procedure btn_DeleteClick(Sender: TObject);
    procedure btn_ExcelClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sg_EmployDblClick(Sender: TObject);
    procedure st_ExitClick(Sender: TObject);
    procedure sg_EmploySelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sg_EmploySelectionChanged(Sender: TObject; ALeft, ATop,
      ARight, ABottom: Integer);
    procedure CommandArrayCommandsTCloseExecute(Command: TCommand;
      Params: TStringList);
  private
    L_bEmployeeInfoVisible : Boolean;
    { Private declarations }
    procedure LoadTreeCompany;
    procedure ShowEmployee(SearchCode,aCode : string;aTopRow:integer = 0);
    procedure ShowEmployeeCardNo(aCardNo : string);
    procedure FormNameSet;

    Function GetFdmsID:string;
    Function GetMaxPositionNum : integer;
  private
    Function CheckTB_EMPLOYEE(aEmpID,aCompanyCode:string):Boolean;
    Function CheckTB_CARD(aCardNo,aCompanyCode,aEmpID,aCardType :string;var Mode:string) : Boolean;
    Function CheckTB_CARDFromEmployeeID(aCompanyCode,aEmpID:string):Boolean;

    Function InsertTB_CARD(aCardNo,aCardGubun,aCardType,aEmpID,aCompanyCode:string) : Boolean;
    Function InsertTB_DEVICECARDNONotExist(aOldCardNO,aNewCardNO:string):Boolean;
    Function InsertTB_EMPLOYEE(aEmpID,aEmpNM,aCompanyCode,aJijumCode,aDepartCode,aPosiCode,aCompanyPhone,
                                 aJoinDate,aRetireDate,aZipcode,aAddr1,aAddr2,aHomePhone,aHandphone,
                                 aRegGubun,aCardNo,aEmpImg,afdmsId,aEmTypeCode:string):Boolean;
    Function InsertTB_EMPHISCardStop(aCardNo:string):Boolean;

    Function UpdateTB_CARD(aCardNo,aCardGubun,aCardType,aEmpID,aCompanyCode:string) : Boolean;
    Function UpdatTB_CARD_Change(aOldCardNo,aNewCardNo:string):Boolean;
    Function UpdateTB_DEVICECARDNO_AllPermit(aCardNo,aPermit:string):Boolean; //모든 카드 권한을 삭제 처리함
    Function UpdateTB_DEVICECARDNORcvAck(aCardNo,aRcvAck:string):Boolean;
    Function UpdateTB_EMPLOYEE(aOldEmpID,aEmpID, aEmpNM, aCompanyCode,
                              aJijumCode, aDepartCode, aPosiCode, aRetireDate, aHandphone, aRegGubun,
                              aCardNo, aEmpImg, aEmTypeCode,aCompanyPhone:string):Boolean;

    Function DeleteTB_CARD(aCardNo:string):Boolean;
    Function DeleteTB_DEVICECARDNOCardNo(aCardNo:string):Boolean;

    Function CopyGradeOldCard(aOldCard,aNewCard:string):Boolean;
  private
    L_nTopRow : integer;
    L_stState : string;
    L_stSelectID : string;
    L_bValidateUpdate : Boolean; //유효기간 변경 여부
    L_stOldCardNo : string;

    CompanyCodeList : TStringList;
    JijumCodeList : TStringList;
    DepartCodeList : TStringList;
    PosiCodeList : TStringList;
    EmpTypeCodeList : TStringList;
    procedure MemoryCreate;
    procedure MemoryFree;

    procedure FormClear;
    procedure FormEnable(aState:string);
    procedure ButtonEnable(aState:string);
    procedure WorkEnable(aValue:Boolean);
  public
    { Public declarations }
    procedure CardReadProcess(aCardNo:string;aCheckBox:Boolean=True);
  end;

var
  fmTreeEmployee: TfmTreeEmployee;

implementation

uses
  uDataModule1,
  uCompanyCodeLoad,
  uLomosUtil,
  uMssql,
  uPostGreSql,
  uMDBSql,
  uFireBird, uCommonSql, uExcelSave, udmAdoQuery,
  DIMime;

{$R *.dfm}

procedure TfmTreeEmployee.FormCreate(Sender: TObject);
begin
  self.ModuleID := 'TreeEmployee';
  L_stSelectID := '';
  L_bEmployeeInfoVisible := True;
  WindowState := wsNormal;
  MemoryCreate;
  LoadTreeCompany;
  ShowEmployee(L_stSelectID,'');
  
  LoadCompanyCode(CompanyCodeList,TComboBox(cmb_Company));
  FormNameSet;
end;

procedure TfmTreeEmployee.FormActivate(Sender: TObject);
begin
  inherited;
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'TreeEMPLOYEE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;
  WindowState := wsMaximized;
end;

procedure TfmTreeEmployee.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  MemoryFree;

  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'TreeEMPLOYEE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;
  Action := caFree;

end;

procedure TfmTreeEmployee.btn_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmTreeEmployee.btn_AddClick(Sender: TObject);
var
  stCompanyGubun : string;  //0:전체,1:회사,2:지점,3:부서
  stCompanyCode : string;
  stJijumCode : string;
  stDepartCode : string;
  nIndex : integer;
begin
  inherited;
  pan_Employee.Visible := True;
  pan_Employee.Caption.Text := '<FONT size="12"><center><B>추가</B></center></FONT>';
  L_nTopRow := sg_Employ.TopRow;
  L_stState := 'INSERT';
  FormClear;
  FormEnable(L_stState);
  ButtonEnable(L_stState);

  stCompanyGubun := '0';
  if L_stSelectID <> '' then
  begin
    stCompanyGubun := copy(L_stSelectID,1,1);
    if Length(L_stSelectID) > 3 then stCompanyCode := copy(L_stSelectID,2,3);
    if Length(L_stSelectID) > 6 then stJijumCode := copy(L_stSelectID,5,3);
    if Length(L_stSelectID) > 9 then stDepartCode := copy(L_stSelectID,8,3);
  end;

  LoadsCompanyCode(CompanyCodeList,TComboBox(cmb_Company));
  if strtoint(stCompanyGubun) > 0 then
  begin
    nIndex := CompanyCodeList.IndexOf(stCompanyCode);
    if nIndex > -1 then
    begin
      cmb_Company.ItemIndex := nIndex;
      LoadsJijumCode(stCompanyCode,JijumCodeList,TComboBox(cmb_Jijum));
      nIndex := JijumCodeList.IndexOf(stCompanyCode + stJijumCode);
      if nIndex > -1 then
      begin
        cmb_Jijum.ItemIndex := nIndex;
        LoadsDepartCode(stCompanyCode,stJijumCode,DepartCodeList,TComboBox(cmb_Depart));
        nIndex := DepartCodeList.IndexOf(stCompanyCode + stJijumCode + stDepartCode);
        if nIndex > -1 then cmb_Depart.ItemIndex := nIndex;
      end;
    end;
  end;
  LoadsPosiCode(stCompanyCode,PosiCodeList,TComboBox(cmb_Posi));
  LoadsEmpType(EmpTypeCodeList,TComboBox(cmb_EmType));
  sg_Employ.InsertRows(sg_Employ.Row,1);
end;

procedure TfmTreeEmployee.btn_UpdateClick(Sender: TObject);
var
  nIndex : integer;
  MapJpg : TJpegImage;
  MapStream : TMemoryStream;
  BlobField : TBlobField;
  TempAdoQuery : TADOQuery;
  stSql : string;
  stImage : string;
begin
  inherited;
  FormClear;

  with sg_Employ do
  begin
    if cells[4,Row] = '' then
    begin
      showmessage('수정할 대상을 선택하여 주세요.');
      exit;    //사번
    end;
    ed_EmpNo.Text := cells[4,Row];
    ed_OldEmpNo.Text := cells[4,Row];
    ed_Name.Text := cells[5,Row];
    LoadsCompanyCode(CompanyCodeList,TComboBox(cmb_Company));
    nIndex := CompanyCodeList.IndexOf(cells[7,Row]);
    if nIndex > -1 then  cmb_Company.ItemIndex := nIndex;
    LoadsJijumCode(cells[7,Row],JijumCodeList,TComboBox(cmb_Jijum));
    nIndex := JijumCodeList.IndexOf(cells[7,Row] + cells[8,Row]);
    if nIndex > -1 then  cmb_Jijum.ItemIndex := nIndex;
    LoadsDepartCode(cells[7,Row],cells[8,Row],DepartCodeList,TComboBox(cmb_Depart));
    nIndex := DepartCodeList.IndexOf(cells[7,Row] + cells[8,Row] + cells[9,Row]);
    if nIndex > -1 then  cmb_Depart.ItemIndex := nIndex;
    LoadsPosiCode(cells[7,Row],PosiCodeList,TComboBox(cmb_Posi));
    nIndex := PosiCodeList.IndexOf(cells[7,Row] + cells[10,Row]);
    if nIndex > -1 then  cmb_Posi.ItemIndex := nIndex;
    LoadsEmpType(EmpTypeCodeList,TComboBox(cmb_EmType));
    nIndex := EmpTypeCodeList.IndexOf(cells[20,Row]);
    if nIndex > -1 then cmb_emType.ItemIndex := nIndex;
    if length(cells[13,Row]) = 8 then
      dt_RetireDt.Date := strToDate(copy(cells[13,Row],1,4) + '-' + copy(cells[13,Row],5,2) + '-' + copy(cells[13,Row],7,2) ) ;
    ed_Handphone.Text := cells[18,Row];
    ed_CardNo.Text := cells[6,Row];
    L_stOldCardNo := ed_CardNo.Text ;

    MapJpg := TJpegImage.Create;
    MapStream := TMemoryStream.Create;
    stSql := ' select * from TB_EMPLOYEE ' ;
    stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND EM_CODE = ''' + cells[4,Row] + ''' ';
    stSql := stSql + ' AND CO_COMPANYCODE = ''' + cells[7,Row] + ''' ';

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
  end;

  pan_Employee.Visible := True;
  pan_Employee.Caption.Text := '<FONT size="12"><center><B>수정</B></center></FONT>';
  L_nTopRow := sg_Employ.TopRow;
  L_stState := 'UPDATE';
  FormEnable(L_stState);
  ButtonEnable(L_stState);

end;

procedure TfmTreeEmployee.btn_SaveClick(Sender: TObject);
var
  stCompanyCode : string;
  stJijumCode : string;
  stDepartCode : string;
  stPosiCode : string;
  bResult : Boolean;
  stFdmsId : string;
  stEmTypeCode : string;
  stCophone : string;
begin
  inherited;
  if Trim(ed_EmpNo.Text) = '' then
  begin
    Showmessage(FM101 + '이 등록되지 않았습니다.');
    ed_EmpNo.SetFocus;
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
  
  stCompanyCode := '000';
  stJijumCode := '000';
  stPosiCode := '000';
  stDepartCode := '000';
  if cmb_Company.ItemIndex > 0 then stCompanyCode := copy(CompanyCodeList.Strings[cmb_Company.itemIndex],1,3)
  else if UpperCase(L_stState) = 'INSERT' then
  begin
    showmessage('회사코드는 반드시 선택하셔야 합니다.');
    Exit;
  end;
  if cmb_Jijum.ItemIndex > 0 then stJijumCode := copy(JijumCodeList.Strings[cmb_Jijum.itemIndex],4,3);
  if cmb_Depart.ItemIndex > 0 then  stDepartCode := copy(DepartCodeList.Strings[cmb_Depart.itemIndex],7,3);
  if cmb_Posi.ItemIndex > 0 then  stPosiCode := copy(PosiCodeList.Strings[cmb_Posi.ItemIndex],4,3);

  stEmTypeCode := '001';
  if cmb_emType.ItemIndex > 0 then stEmTypeCode := EmpTypeCodeList.Strings[cmb_emType.ItemIndex];

  stCophone :=  ed_CompanyPhone.Text;
  if G_bEmployeeCophoneEncrypt then stCophone := MimeEncodeString(stCophone);
  if UpperCase(L_stState) = 'INSERT' then
  begin
    stFdmsId := GetFdmsID;
    if CheckTB_EMPLOYEE(ed_EmpNo.Text,stCompanyCode) then
    begin
      showmessage(ed_EmpNo.Text + FM101 + '은 이미 사용중인 ' + FM101 + '입니다.');
      Exit;
    end;

    bResult := InsertTB_EMPLOYEE(ed_EmpNo.Text,ed_Name.Text,stCompanyCode,stJijumCode,
                                 stDepartCode,stPosiCode,stCophone,FormatDateTime('yyyymmdd',Now),FormatDateTime('yyyymmdd',dt_RetireDt.Date),
                                 '','','','',ed_Handphone.Text,'1',ed_CardNo.Text,ed_EmpImg.Text,stFdmsId,stEmTypeCode);
  end  else if UpperCase(L_stState) = 'UPDATE' then
  begin
    if ed_EmpNo.Text <> ed_OldEmpNo.Text then
    begin
      if CheckTB_EMPLOYEE(ed_EmpNo.Text,stCompanyCode) then
      begin
        showmessage(ed_EmpNo.Text + FM101 + '은 이미 사용중인 ' + FM101 + '입니다.');
        Exit;
      end;
    end;
    bResult := UpdateTB_EMPLOYEE(ed_OldEmpNo.Text,ed_EmpNo.Text,ed_Name.Text,stCompanyCode,stJijumCode,stDepartCode,stPosiCode,FormatDateTime('yyyymmdd',dt_RetireDt.Date),ed_Handphone.Text,'1',ed_CardNo.Text,ed_EmpImg.Text,stEmTypeCode,stCophone);
    if L_bValidateUpdate then
    begin
      UpdateTB_DEVICECARDNORcvAck(ed_CardNo.Text,'N'); //유효기간 변경 된경우 재전송
    end;
  end;
  
  if Not bResult then
  begin
    showmessage('데이터 저장에 실패하였습니다.');
    Exit;
  end;

  pan_Employee.Visible := L_bEmployeeInfoVisible;
  btn_Save.Visible := Not L_bEmployeeInfoVisible;
  btn_Cancel.Visible := Not L_bEmployeeInfoVisible;
  st_Exit.Visible := L_bEmployeeInfoVisible;
  WorkEnable(True);
  stCompanyCode := '000';
  if cmb_Company.ItemIndex > 0 then stCompanyCode := CompanyCodeList.Strings[cmb_Company.ItemIndex];

  ShowEmployee(L_stSelectID,stCompanyCode + ed_EmpNo.Text ,L_nTopRow);
end;

procedure TfmTreeEmployee.btn_CancelClick(Sender: TObject);
var
  stCompanyCode : string;
begin
  inherited;
  pan_Employee.Visible := L_bEmployeeInfoVisible;
  btn_Save.Visible := Not L_bEmployeeInfoVisible;
  btn_Cancel.Visible := Not L_bEmployeeInfoVisible;
  st_Exit.Visible := L_bEmployeeInfoVisible;
  WorkEnable(True);
  stCompanyCode := '000';
  if cmb_Company.ItemIndex > 0 then stCompanyCode := CompanyCodeList.Strings[cmb_Company.ItemIndex];
  ShowEmployee(L_stSelectID,stCompanyCode + ed_EmpNo.Text ,L_nTopRow);
end;

procedure TfmTreeEmployee.LoadTreeCompany;
var
  stSql : string;
  TempAdoQuery : TADOQuery;

  aTreeView   : TTreeview;
  vTreeView : TTreeview;
  aNode,bNode,cNode,dNode   : TTreeNode;
  vNode1,vNode2,vNode3 : TTreeNode;
  stParentCode : string;
  stLocationCode : string;
  stLocationCaption : string;
begin
  aTreeView := TreeView_Location;
  aTreeView.ReadOnly:= True;
  aTreeView.Items.Clear;
  vTreeView := TreeView_LocationCode;   //위치 코드 등록으로 현재 상태를 파악하기 위함
  vTreeView.ReadOnly := True;
  vTreeView.Items.Clear;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;

    aNode:= aTreeView.Items.Add(nil,'전체');
    aNode.ImageIndex:=4;
    aNode.SelectedIndex:=4;
    aNode.StateIndex:= -1;
    vNode1 := vTreeView.Items.Add(nil,'0000');

    //회사로드
    stSql := 'Select * from TB_Company ';
    stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND CO_GUBUN = ''1''';
    if Not IsMaster then
    begin
      if strtoint(CompanyGrade) > 1 then
      begin
        stSql := stSql + ' AND CO_COMPANYCODE = ''' + MasterCompany + ''' ';
      end;
    end;
    if G_nCompanySearchIndex = 0 then
    begin
      stSql := stSql + ' Order by CO_COMPANYCODE ';
    end else
    begin
      stSql := stSql + ' Order by CO_NAME ';
    end;
    
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

      While Not Eof do
      begin
        bNode:= aTreeView.Items.Add(nil,FindField('CO_NAME').AsString);
        bNode.ImageIndex:=0;
        bNode.SelectedIndex:=0;
        bNode.StateIndex:= -1;
        vNode2 := vTreeView.Items.Add(nil,'1' + FindField('CO_COMPANYCODE').AsString );
        Next;
      end;
      aNode.Expanded := True;
    end;
    //지점로드
    stSql := 'Select * from TB_Company ';
    stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND CO_GUBUN = ''2''';
    if Not IsMaster then
    begin
      if strtoint(CompanyGrade) = 2 then
      begin
        stSql := stSql + ' AND CO_COMPANYCODE = ''' + MasterCompany + ''' ';
      end else if strtoint(CompanyGrade) > 2 then
      begin
        stSql := stSql + ' AND CO_COMPANYCODE = ''' + MasterCompany + ''' ';
        stSql := stSql + ' AND CO_JIJUMCODE = ''' + MasterJijum + ''' ';
      end;
    end;
    if G_nCompanySearchIndex = 0 then
    begin
      stSql := stSql + ' Order by CO_COMPANYCODE ';
    end else
    begin
      stSql := stSql + ' Order by CO_NAME ';
    end;
    
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

      While Not Eof do
      begin
        stParentCode := '1' + FindField('CO_COMPANYCODE').AsString ;
        vNode1:= GetNodeByText(vTreeView,stParentCode,True);
        stLocationCode := '2' + FindField('CO_COMPANYCODE').AsString + FindField('CO_JIJUMCODE').AsString ;
        stLocationCaption := FindField('CO_NAME').AsString;

        if vNode1 <> nil then
        begin
          bNode := aTreeView.Items.Item[vNode1.AbsoluteIndex];
          if bNode <> nil then
          begin
            cNode:= aTreeView.Items.AddChild(bNode,stLocationCaption);
            cNode.ImageIndex:=1;
            cNode.SelectedIndex:=1;
            cNode.StateIndex:= -1;
          end;
          vNode2:= vTreeView.Items.Item[vNode1.AbsoluteIndex];
          if vNode2 <> nil then
          begin
            vNode3:= vTreeView.Items.AddChild(vNode2,stLocationCode);
          end;
          vNode1.Expanded := True;
          bNode.Expanded := True;
        end;
        Next;
      end;
    end;
    //부서로드
    stSql := 'Select * from TB_Company ';
    stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND CO_GUBUN = ''3''';
    if Not IsMaster then
    begin
      if strtoint(CompanyGrade) = 2 then
      begin
        stSql := stSql + ' AND CO_COMPANYCODE = ''' + MasterCompany + ''' ';
      end else if strtoint(CompanyGrade) = 3 then
      begin
        stSql := stSql + ' AND CO_COMPANYCODE = ''' + MasterCompany + ''' ';
        stSql := stSql + ' AND CO_JIJUMCODE = ''' + MasterJijum + ''' ';
      end else if strtoint(CompanyGrade) > 3 then
      begin
        stSql := stSql + ' AND CO_COMPANYCODE = ''' + MasterCompany + ''' ';
        stSql := stSql + ' AND CO_JIJUMCODE = ''' + MasterJijum + ''' ';
        stSql := stSql + ' AND CO_DEPARTCODE = ''' + MasterDepart + ''' ';
      end;
    end;
    if G_nCompanySearchIndex = 0 then
    begin
      stSql := stSql + ' Order by CO_COMPANYCODE ';
    end else
    begin
      stSql := stSql + ' Order by CO_NAME ';
    end;
    
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

      While Not Eof do
      begin
        stParentCode := '2' + FindField('CO_COMPANYCODE').AsString + FindField('CO_JIJUMCODE').AsString;
        vNode1:= GetNodeByText(vTreeView,stParentCode,True);
        stLocationCode := '3' + FindField('CO_COMPANYCODE').AsString + FindField('CO_JIJUMCODE').AsString + FindField('CO_DEPARTCODE').AsString;
        stLocationCaption := FindField('CO_NAME').AsString;

        if vNode1 <> nil then
        begin
          bNode := aTreeView.Items.Item[vNode1.AbsoluteIndex];
          if bNode <> nil then
          begin
            cNode:= aTreeView.Items.AddChild(bNode,stLocationCaption);
            cNode.ImageIndex:=2;
            cNode.SelectedIndex:=2;
            cNode.StateIndex:= -1;
          end;
          vNode2:= vTreeView.Items.Item[vNode1.AbsoluteIndex];
          if vNode2 <> nil then
          begin
            vNode3:= vTreeView.Items.AddChild(vNode2,stLocationCode);
          end;
          vNode1.Expanded := True;
          bNode.Expanded := True;
        end;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmTreeEmployee.TreeView_LocationClick(Sender: TObject);
begin
  inherited;
  L_stSelectID := TreeView_LocationCode.Items.Item[TreeView_Location.Selected.AbsoluteIndex].Text;
  ShowEmployee(L_stSelectID,'');
  ed_SelectID.Text := L_stSelectID;

end;

procedure TfmTreeEmployee.ShowEmployee(SearchCode, aCode: string;
  aTopRow: integer);
var
  stSql : string;
  nRow : integer;
  i : integer;
  TempAdoQuery : TADOQuery;
  bWhereSearch : Boolean;
  stCompanyGubun : string;  //0:전체,1:회사,2:지점,3:부서
  stCompanyCode : string;
  stJijumCode : string;
  stDepartCode : string;
begin
  GridInit(sg_Employ,7); //스트링그리드 초기화

  bWhereSearch := False;

  if DBTYPE = 'MSSQL' then stSql := MSSQL.SelectTB_EMPLOYEEJoinBase
  else if DBType = 'PG' then stSql := PostGreSql.SelectTB_EMPLOYEEJoinBase
  else if DBType = 'MDB' then stSql := MDBSql.SelectTB_EMPLOYEEJoinBase
  else if DBType = 'FB' then stSql := FireBird.SelectTB_EMPLOYEEJoinBase
  else Exit;

  stCompanyGubun := '0';
  if SearchCode <> '' then
  begin
    stCompanyGubun := copy(SearchCode,1,1);
    if Length(SearchCode) > 3 then stCompanyCode := copy(SearchCode,2,3);
    if Length(SearchCode) > 6 then stJijumCode := copy(SearchCode,5,3);
    if Length(SearchCode) > 9 then stDepartCode := copy(SearchCode,8,3);
  end;

  case strtoint(stCompanyGubun) of
    1 : begin
          stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + stCompanyCode + ''' ';
        end;
    2 : begin
          stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + stCompanyCode + ''' ';
          stSql := stSql + ' AND a.CO_JIJUMCODE = ''' + stJijumCode + ''' ';
        end;
    3 : begin
          stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + stCompanyCode + ''' ';
          stSql := stSql + ' AND a.CO_JIJUMCODE = ''' + stJijumCode + ''' ';
          stSql := stSql + ' AND a.CO_DEPARTCODE = ''' + stDepartCode + ''' ';
        end;
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
      nRow := 1;
      First;
      while Not Eof do
      begin
        with sg_Employ do
        begin
          cells[0,nRow] := FindField('COMPANYNAME').AsString;
          cells[1,nRow] := FindField('JIJUMNAME').AsString;
          cells[2,nRow] := FindField('DEPARTNAME').AsString;
          cells[3,nRow] := FindField('PO_NAME').AsString;
          cells[4,nRow] := FindField('EM_CODE').AsString;
          cells[5,nRow] := FindField('EM_NAME').AsString;
          cells[6,nRow] := FindField('CA_CARDNO').AsString;
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
          cells[12,nRow] := FindField('EM_JOINDATE').AsString;
          cells[13,nRow] := FindField('EM_RETIREDATE').AsString;
          cells[14,nRow] := FindField('ZI_ZIPCODE').AsString;
          cells[15,nRow] := FindField('EM_ADDR1').AsString;
          cells[16,nRow] := FindField('EM_ADDR2').AsString;
          cells[17,nRow] := FindField('EM_HOMEPHONE').AsString;
          cells[18,nRow] := FindField('EM_HANDPHONE').AsString;
          cells[19,nRow] := FindField('CA_CARDTYPE').AsString;
          cells[20,nRow] := FindField('RG_CODE').AsString;
          cells[21,nRow] := FindField('FDMS_ID').AsString;
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
  if L_bEmployeeInfoVisible then sg_EmployDblClick(Self);
end;

procedure TfmTreeEmployee.sg_EmployResize(Sender: TObject);
var
  i : integer;
begin
  inherited;
  sg_Employ.DefaultColWidth := (sg_Employ.Width - 50) div 7;

  for i := 7 to sg_Employ.ColCount - 1 do
  begin
    sg_Employ.ColWidths[i] := 0;
  end;

end;

procedure TfmTreeEmployee.MemoryCreate;
begin
  CompanyCodeList := TStringList.Create;
  JijumCodeList := TStringList.Create;
  DepartCodeList := TStringList.Create;
  PosiCodeList := TStringList.Create;
  EmpTypeCodeList := TStringList.Create;
end;

procedure TfmTreeEmployee.MemoryFree;
begin
  CompanyCodeList.Free;
  JijumCodeList.Free;
  DepartCodeList.Free;
  PosiCodeList.Free;
  EmpTypeCodeList.Free;
end;

procedure TfmTreeEmployee.FormClear;
begin
  L_bValidateUpdate := False;
  cmb_Company.Clear;
  cmb_Jijum.Clear;
  cmb_Depart.Clear;
  cmb_Posi.Clear;
  cmb_emType.Clear;
  ed_EmpNo.Text := '';
  ed_Name.Text := '';
  ed_Handphone.Text := '';
  ed_CardNo.Text := '';
  Image1.Picture.Graphic := Nil;
  ed_EmpImg.Text := '';
  dt_RetireDt.Date := strToDate('9999-12-30');
end;

procedure TfmTreeEmployee.ButtonEnable(aState: string);
begin
  btn_Save.Visible := True;
  btn_Cancel.Visible := True;
  if upperCase(aState) = 'INSERT'  then
  begin
  end else if upperCase(aState) = 'SEARCH' then
  begin
    btn_Save.Visible := False;
    btn_Cancel.Visible := False;
  end else if upperCase(aState) = 'CLICK' then
  begin
    btn_Save.Visible := False;
    btn_Cancel.Visible := False;
  end else if upperCase(aState) = 'UPDATE' then
  begin
  end;
end;

procedure TfmTreeEmployee.FormEnable(aState: string);
begin
  st_Exit.Visible := False;
  if upperCase(aState) = 'INSERT'  then
  begin
    WorkEnable(False);

    if (Not IsMaster) and ( strtoint(CompanyGrade) > 1) then cmb_Company.Enabled := False
    else cmb_Company.Enabled := True;
    if (Not IsMaster) and ( strtoint(CompanyGrade) > 2) then cmb_Jijum.Enabled := False
    else cmb_Jijum.Enabled := True;
    cmb_Depart.Enabled := True;
    cmb_Posi.Enabled := True;
    cmb_emType.Enabled := True;
    ed_EmpNo.Enabled := True;
    ed_Name.Enabled := True;
    ed_Handphone.Enabled := True;
    ed_CompanyPhone.Enabled := True;
    ed_CardNo.Enabled := True;
    dt_RetireDt.Enabled := True;
  end else if upperCase(aState) = 'SEARCH' then
  begin
    st_Exit.Visible := True;
    WorkEnable(True);
    cmb_Company.Enabled := False;

    cmb_Jijum.Enabled := False;
    cmb_Depart.Enabled := False;
    cmb_Posi.Enabled := False;
    cmb_emType.Enabled := False;
    ed_EmpNo.Enabled := False;
    ed_Name.Enabled := False;
    ed_Handphone.Enabled := False;
    ed_CompanyPhone.Enabled := False;
    ed_CardNo.Enabled := False;
    dt_RetireDt.Enabled := False;
  end else if upperCase(aState) = 'CLICK' then
  begin
    WorkEnable(True);
    cmb_Company.Enabled := False;

    cmb_Jijum.Enabled := False;
    cmb_Depart.Enabled := False;
    cmb_Posi.Enabled := False;
    cmb_emType.Enabled := False;
    ed_EmpNo.Enabled := False;
    ed_Name.Enabled := False;
    ed_Handphone.Enabled := False;
    ed_CompanyPhone.Enabled := False;
    ed_CardNo.Enabled := False;
    dt_RetireDt.Enabled := False;
  end else if upperCase(aState) = 'UPDATE' then
  begin
    WorkEnable(False);
    cmb_Company.Enabled := False;

    if (Not IsMaster) and ( strtoint(CompanyGrade) > 2) then cmb_Jijum.Enabled := False
    else cmb_Jijum.Enabled := True;
    cmb_Depart.Enabled := True;
    cmb_Posi.Enabled := True;
    cmb_emType.Enabled := True;
    ed_EmpNo.Enabled := True;
    ed_Name.Enabled := True;
    ed_Handphone.Enabled := True;
    ed_CompanyPhone.Enabled := True;
    ed_CardNo.Enabled := True;
    dt_RetireDt.Enabled := True;
  end;
end;

procedure TfmTreeEmployee.WorkEnable(aValue: Boolean);
begin
  if aValue then L_stState := 'SEARCH';
  TreeView_Location.Enabled := aValue;
  sg_Employ.Enabled := aValue;
  btn_Add.Enabled := aValue;
  btn_Update.Enabled := aValue;
  btn_Delete.Enabled := aValue;
  btn_Excel.Enabled := aValue;
end;

procedure TfmTreeEmployee.Image1Click(Sender: TObject);
begin
  inherited;
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

procedure TfmTreeEmployee.FormNameSet;
begin

  with sg_Employ do
  begin
    Cells[0,0] := FM002;
    Cells[1,0] := FM012;
    Cells[2,0] := FM022;
    Cells[3,0] := FM032;
    Cells[4,0] := FM101;
    Cells[5,0] := FM102;
    Cells[11,0] := FM103;
  end;
  lb_CompanyName.Caption := FM002;
  lb_JijumName.Caption := FM012;
  lb_DepartName.Caption := FM022;
  lb_PosiName.Caption := FM032;
  lb_emType.Caption := FM042;
  lb_sabun.Caption := FM101;
  lb_Name.Caption := FM102;
  lb_CompanyPhone.Caption := FM103;
  lb_OutDate.Caption := FM105;
end;

function TfmTreeEmployee.GetFdmsID: string;
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

function TfmTreeEmployee.InsertTB_EMPLOYEE(aEmpID, aEmpNM, aCompanyCode,
  aJijumCode, aDepartCode, aPosiCode, aCompanyPhone, aJoinDate, aRetireDate,
  aZipcode, aAddr1, aAddr2, aHomePhone, aHandphone, aRegGubun, aCardNo,
  aEmpImg, afdmsId, aEmTypeCode: string): Boolean;
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
    ed_EmpNo.SetFocus;
    Exit;
  end;

  bResult := False;
  if Length(aCardNo) <> 0 then
  begin
    if (CARDLENGTHTYPE = 0) and IsNumericCardNo then
        aCardNo := FillZeroStrNum(aCardNo,10);
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
  if G_bEmployeeCophoneEncrypt then stSql := stSql + 'EM_COTELENCRYPT, ';
  stSql := stSql + 'RG_CODE ) ';
  stSql := stSql + 'VALUES ( ';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aEmpID + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aJijumCode + ''',';
  stSql := stSql + '''' + aDepartCode + ''',';
  stSql := stSql + '''' + aPosiCode + ''',';
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
      ON E: Exception do
        begin
          DataModule1.SQLErrorLog('DBError('+ E.Message + ')' + stSql);
          Exit;
        end;
    End;

  end;

  stSql := CommonSql.InsertIntoTB_EMPHIS(aCompanyCode,aEmpID,afdmsID,'1',aCardNo,'1',
           aEmpNM,aHandphone,cmb_Company.Text,cmb_Jijum.Text,cmb_Depart.Text,cmb_Posi.Text);//입력
  result := DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_EMPLOYEECHANGE(aCompanyCode,aEmpID,aCardNo,'TreeEmployee','1');
  DataModule1.ProcessExecSQL(stSql);
end;

function TfmTreeEmployee.UpdateTB_EMPLOYEE(aOldEmpID,aEmpID, aEmpNM, aCompanyCode,
  aJijumCode, aDepartCode, aPosiCode, aRetireDate, aHandphone, aRegGubun,
  aCardNo, aEmpImg, aEmTypeCode,aCompanyPhone: string): Boolean;
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
  end;
  if (Trim(L_stOldCardNo) <> '') and (Trim(L_stOldCardNo) <> aCardNo) then
  begin
    stMsg := '(' + L_stOldCardNo + ')카드번호 에서 (' +
        aCardNo + ') 으로 변경되었습니다. ' + #13 +
        '(' + L_stOldCardNo + ')를 정지 하시겠습니까 ';
    if (Application.MessageBox(PChar(stMsg),'변경',MB_OKCANCEL) = ID_OK)  then
    begin
      //bResult := DeleteTB_CARD(L_stOldCardNo);
      bResult := UpdatTB_CARD_Change(L_stOldCardNo,aCardNo);
      if Not bResult then showmessage(L_stOldCardNo + ' 정지에 실패하였습니다.');
    end;

    bResult := False;
    bResult := CheckTB_CARD(aCardNo,aCompanyCode,aOldEmpID,aRegGubun,stMode);
    if bResult then //카드번호 입력하자.
    begin
      if stMode = 'Insert' then  bResult := InsertTB_CARD(aCardNo,'1',aRegGubun,aOldEmpID,aCompanyCode)
      else if stMode = 'Update' then bResult := UpdateTB_CARD(aCardNo,'1',aRegGubun,aOldEmpID,aCompanyCode);

      if Not bResult then
      begin
        showmessage('카드등록에 실패하였습니다.관리자에게 문의 주세요.');
        Exit;
      end;
    end;
  end else
  begin
    bResult := False;
    bResult := CheckTB_CARD(aCardNo,aCompanyCode,aOldEmpID,aRegGubun,stMode);
    if bResult then //카드번호 입력하자.
    begin
      if stMode = 'Insert' then  bResult := InsertTB_CARD(aCardNo,'1',aRegGubun,aOldEmpID,aCompanyCode)
      else if stMode = 'Update' then bResult := UpdateTB_CARD(aCardNo,'1',aRegGubun,aOldEmpID,aCompanyCode);

      if Not bResult then
      begin
        showmessage('카드등록에 실패하였습니다.관리자에게 문의 주세요.');
        Exit;
      end;
    end;
  end;

  if aOldEmpID <> aEmpID then    //사원번호가 바뀌었으면  카드 데이터를 변경해야 됨.
  begin
    stSql := 'Update TB_CARD SET ' ;
    stSql := stSql + ' EM_CODE = ''' +  aEmpID + ''',';
    stSql := stSql + ' CO_COMPANYCODE = ''' +  aCompanyCode + ''', ';
    stSql := stSql + ' CA_MEMLOAD = ''N'' ';
    stSql := stSql + ' Where GROUP_CODE = ''' +  GROUPCODE + ''' ';
    stSql := stSql + ' AND CA_CARDNO = ''' +  aCardNo + ''' ';
    DataModule1.ProcessExecSQL(stSql);
  end;


  stSql := 'Update TB_EMPLOYEE Set ';
  stSql := stSql + 'EM_CODE = ''' + aEmpID + ''',';
  stSql := stSql + 'CO_JIJUMCODE = ''' + aJijumCode + ''',';
  stSql := stSql + 'CO_DEPARTCODE = ''' + aDepartCode + ''',';
  stSql := stSql + 'PO_POSICODE = ''' + aPosiCode + ''',';
  stSql := stSql + 'EM_NAME = ''' + aEmpNM + ''',';
  stSql := stSql + 'EM_HANDPHONE = ''' + aHandphone + ''',';
  stSql := stSql + 'EM_RETIREDATE = ''' + aRetireDate + ''',';
  stSql := stSql + 'FDMS_RELAY = ''N'',';
  stSql := stSql + 'EM_UPDATETIME = ''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',';
  stSql := stSql + 'EM_UPDATEOPERATOR = ''' + Master_ID + ''', ';
  stSql := stSql + 'RG_CODE = ''' + aEmTypeCode + ''', ';
  if G_bEmployeeCophoneEncrypt then stSql := stSql + 'EM_COTELENCRYPT = ''Y'', ';
  stSql := stSql + 'EM_COPHONE = ''' + aCompanyPhone + ''' ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aOldEmpID + ''' ';
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
  stFdmsID := DataModule1.GetFdmsID(aCompanyCode,aEmpID);

  stSql := CommonSql.InsertIntoTB_EMPHIS(aCompanyCode,aEmpID,stFdmsID,'2',aCardNo,aRegGubun,
           aEmpNM,aHandphone,stCompanyName,stJijumName,stDepartName,stPosiName);//수정
  result := DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_EMPLOYEECHANGE(aCompanyCode,aEmpID,aCardNo,'TreeEmployee','2');
  DataModule1.ProcessExecSQL(stSql);

end;

procedure TfmTreeEmployee.dt_RetireDtChange(Sender: TObject);
begin
  inherited;
  L_bValidateUpdate := True;
end;

function TfmTreeEmployee.UpdateTB_DEVICECARDNORcvAck(aCardNo,
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

function TfmTreeEmployee.CheckTB_EMPLOYEE(aEmpID,
  aCompanyCode: string): Boolean;
var
  stSql: string;
  TempAdoQuery : TADOQuery;
begin
  Result := False;
  stSql := 'select * from TB_EMPLOYEE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmpID + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' +  aCompanyCode + ''' ';

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

function TfmTreeEmployee.CheckTB_CARD(aCardNo, aCompanyCode, aEmpID,
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
      UpdateTB_DEVICECARDNO_AllPermit(aCardNo,'N'); //기존카드번호의 권한을 삭제합니다.
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmTreeEmployee.InsertTB_CARD(aCardNo, aCardGubun, aCardType,
  aEmpID, aCompanyCode: string): Boolean;
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

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmTreeEmployee.UpdateTB_CARD(aCardNo, aCardGubun, aCardType,
  aEmpID, aCompanyCode: string): Boolean;
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
  stSql := stSql + ' CA_MEMLOAD = ''N'',';
  stSql := stSql + ' CA_UPDATETIME = ''' +  FormatDateTime('yyyymmddHHMMSS',Now) + ''',';
  stSql := stSql + ' CA_UPDATEOPERATOR = ''' +  MASTER_ID + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' +  GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' +  aCardNo + ''' ';
  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmTreeEmployee.UpdatTB_CARD_Change(aOldCardNo,
  aNewCardNo: string): Boolean;
var
  stSql : string;
  bResult : Boolean;
begin
  Result := False;
  if aOldCardNo = '' then Exit;
  DeleteTB_DEVICECARDNOCardNo(aNewCardNo); // 권한테이블에 새로 등록할 카드에 대한 찌꺼기가 남아 있으면 삭제
  CopyGradeOldCard(aOldCardNo,aNewCardNo); //여기서 권한을 복사 L_stStopCard -> stCardNo
  bResult := UpdateTB_DEVICECARDNO_AllPermit(aOldCardNo,'N'); //모든 카드 권한을 삭제 처리함
  if Not bResult then Exit;

  stSql := ' delete from  TB_CARD ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' +  aOldCardNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);

  InsertTB_EMPHISCardStop(aOldCardNo);
end;

function TfmTreeEmployee.UpdateTB_DEVICECARDNO_AllPermit(aCardNo,
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

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmTreeEmployee.GetMaxPositionNum: integer;
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

function TfmTreeEmployee.DeleteTB_DEVICECARDNOCardNo(
  aCardNo: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Delete From TB_DEVICECARDNO ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmTreeEmployee.CopyGradeOldCard(aOldCard,
  aNewCard: string): Boolean;
begin
  result := InsertTB_DEVICECARDNONotExist(aOldCard,aNewCard);
end;

function TfmTreeEmployee.InsertTB_DEVICECARDNONotExist(aOldCardNO,
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

function TfmTreeEmployee.InsertTB_EMPHISCardStop(aCardNo: string): Boolean;
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
  stSql := CommonSql.InsertIntoTB_EMPLOYEECHANGE(stCompanyCode,stEmpID,aCardNo,'TreeEmployee','2');
  DataModule1.ProcessExecSQL(stSql);

end;

procedure TfmTreeEmployee.cmb_CompanyChange(Sender: TObject);
begin
  inherited;
  LoadsJijumCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],JijumCodeList,TComboBox(cmb_Jijum));
  cmb_Depart.Items.Clear;
  if cmb_Jijum.ItemIndex > 0 then
    LoadsDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,TComboBox(cmb_Depart));
  LoadsPosiCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],PosiCodeList,TComboBox(cmb_Posi));
end;

procedure TfmTreeEmployee.cmb_JijumChange(Sender: TObject);
begin
  inherited;
  LoadsDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,TComboBox(cmb_Depart));

end;

procedure TfmTreeEmployee.CardReadProcess(aCardNo: string;
  aCheckBox: Boolean);
var
  stCompanyCode : string;
  stEmCode : string;
  nIndex : integer;
begin
  if (UpperCase(L_stState) = 'INSERT') or
     (UpperCase(L_stState) = 'UPDATE') then
  begin
    ed_CardNo.Text := aCardNo;
  end else
  begin
    ShowEmployeeCardNo(aCardNo);
  end;
end;

procedure TfmTreeEmployee.ShowEmployeeCardNo(aCardNo: string);
var
  stSql : string;
  nRow : integer;
  i : integer;
  TempAdoQuery : TADOQuery;
  bWhereSearch : Boolean;
  stCompanyGubun : string;  //0:전체,1:회사,2:지점,3:부서
  stCompanyCode : string;
  stJijumCode : string;
  stDepartCode : string;
begin

  bWhereSearch := False;

  if DBTYPE = 'MSSQL' then stSql := MSSQL.SelectTB_EMPLOYEEJoinBase
  else if DBType = 'PG' then stSql := PostGreSql.SelectTB_EMPLOYEEJoinBase
  else if DBType = 'MDB' then stSql := MDBSql.SelectTB_EMPLOYEEJoinBase
  else if DBType = 'FB' then stSql := FireBird.SelectTB_EMPLOYEEJoinBase
  else Exit;
  stSql := stSql + ' AND b.CA_CARDNO = ''' + aCardNo + ''' ';
  stSql := stSql + ' order by a.EM_CODE ';

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

      if RecordCount < 1 then
      begin
        Exit;
      end;

      GridInit(sg_Employ,7); //스트링그리드 초기화
      sg_Employ.RowCount := RecordCount + 1;
      nRow := 1;
      First;
      while Not Eof do
      begin
        with sg_Employ do
        begin
          cells[0,nRow] := FindField('COMPANYNAME').AsString;
          cells[1,nRow] := FindField('JIJUMNAME').AsString;
          cells[2,nRow] := FindField('DEPARTNAME').AsString;
          cells[3,nRow] := FindField('PO_NAME').AsString;
          cells[4,nRow] := FindField('EM_CODE').AsString;
          cells[5,nRow] := FindField('EM_NAME').AsString;
          cells[6,nRow] := FindField('CA_CARDNO').AsString;
          cells[7,nRow] := FindField('CO_COMPANYCODE').AsString;
          cells[8,nRow] := FindField('CO_JIJUMCODE').AsString;
          cells[9,nRow] := FindField('CO_DEPARTCODE').AsString;
          cells[10,nRow] := FindField('PO_POSICODE').AsString;
          cells[11,nRow] := FindField('EM_COPHONE').AsString;
          cells[12,nRow] := FindField('EM_JOINDATE').AsString;
          cells[13,nRow] := FindField('EM_RETIREDATE').AsString;
          cells[14,nRow] := FindField('ZI_ZIPCODE').AsString;
          cells[15,nRow] := FindField('EM_ADDR1').AsString;
          cells[16,nRow] := FindField('EM_ADDR2').AsString;
          cells[17,nRow] := FindField('EM_HOMEPHONE').AsString;
          cells[18,nRow] := FindField('EM_HANDPHONE').AsString;
          cells[19,nRow] := FindField('CA_CARDTYPE').AsString;
          cells[20,nRow] := FindField('RG_CODE').AsString;
          cells[21,nRow] := FindField('FDMS_ID').AsString;
        end;
        nRow := nRow + 1;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmTreeEmployee.btn_DeleteClick(Sender: TObject);
var
  bCardDelete : Boolean;
  bResult : Boolean;
  stCompanyCode : string;
begin
  with sg_Employ do
  begin
    bResult := True;
    if cells[4,Row] = '' then Exit;
    if (Application.MessageBox(PChar(cells[5,Row] + '의 데이터를 삭제하시겠습니까?'),'삭제',MB_OKCANCEL) = ID_CANCEL)  then Exit;
    if cells[6,Row] <> '' then
    begin
      bResult := DeleteTB_CARD(cells[6,Row]);
      if Not bResult then
      begin
        showmessage('카드데이터 삭제 중 문제가 발생했습니다.');
        Exit;
      end;
    end;
    stCompanyCode := cells[7,Row];
    if Trim(stCompanyCode) = '' then stCompanyCode := '000';

    if CheckTB_CARDFromEmployeeID(stCompanyCode,cells[4,Row]) then  //2장 이상 카드는 인적사항을 삭제 하면 안됨
    begin
      ShowEmployee(L_stSelectID,stCompanyCode + cells[4,Row] ,sg_Employ.TopRow);
      Exit;
    end;
    bResult := dmAdoQuery.DeleteTB_EMPLOYEE(cells[4,Row],stCompanyCode,cells[6,Row]);
    if Not bResult then Exit;
    ShowEmployee(L_stSelectID,stCompanyCode + cells[4,Row] ,sg_Employ.TopRow);
  end;

end;

function TfmTreeEmployee.DeleteTB_CARD(aCardNo: string): Boolean;
var
  stSql : string;
  bResult : Boolean;
begin
  Result := False;
  if aCardNo = '' then Exit;
  bResult := UpdateTB_DEVICECARDNO_AllPermit(aCardNo,'N'); //모든 카드 권한을 삭제 처리함
  if Not bResult then Exit;

  stSql := 'Delete From TB_CARD ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' +  aCardNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmTreeEmployee.CheckTB_CARDFromEmployeeID(aCompanyCode,
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

procedure TfmTreeEmployee.btn_ExcelClick(Sender: TObject);
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
  stRefFileName  := ini_fun.ReadString('사원현황','참조파일','TreeEmployee.xls');
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

procedure TfmTreeEmployee.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
  begin
    btn_CancelClick(Self);
  end;

end;

procedure TfmTreeEmployee.sg_EmployDblClick(Sender: TObject);
var
  nIndex : integer;
  MapJpg : TJpegImage;
  MapStream : TMemoryStream;
  BlobField : TBlobField;
  TempAdoQuery : TADOQuery;
  stSql : string;
  stImage : string;
begin
  inherited;
  pan_Employee.Visible := False;
  FormClear;

  with sg_Employ do
  begin
    if cells[4,Row] = '' then
    begin
      exit;    //사번
    end;
    ed_EmpNo.Text := cells[4,Row];
    ed_Name.Text := cells[5,Row];
    LoadsCompanyCode(CompanyCodeList,TComboBox(cmb_Company));
    nIndex := CompanyCodeList.IndexOf(cells[7,Row]);
    if nIndex > -1 then  cmb_Company.ItemIndex := nIndex;
    LoadsJijumCode(cells[7,Row],JijumCodeList,TComboBox(cmb_Jijum));
    nIndex := JijumCodeList.IndexOf(cells[7,Row] + cells[8,Row]);
    if nIndex > -1 then  cmb_Jijum.ItemIndex := nIndex;
    LoadsDepartCode(cells[7,Row],cells[8,Row],DepartCodeList,TComboBox(cmb_Depart));
    nIndex := DepartCodeList.IndexOf(cells[7,Row] + cells[8,Row] + cells[9,Row]);
    if nIndex > -1 then  cmb_Depart.ItemIndex := nIndex;
    LoadsPosiCode(cells[7,Row],PosiCodeList,TComboBox(cmb_Posi));
    nIndex := PosiCodeList.IndexOf(cells[7,Row] + cells[10,Row]);
    if nIndex > -1 then  cmb_Posi.ItemIndex := nIndex;
    LoadsEmpType(EmpTypeCodeList,TComboBox(cmb_EmType));
    nIndex := EmpTypeCodeList.IndexOf(cells[20,Row]);
    if nIndex > -1 then cmb_emType.ItemIndex := nIndex;
    if length(cells[13,Row]) = 8 then
      dt_RetireDt.Date := strToDate(copy(cells[13,Row],1,4) + '-' + copy(cells[13,Row],5,2) + '-' + copy(cells[13,Row],7,2) ) ;
    ed_Handphone.Text := cells[18,Row];
    ed_CardNo.Text := cells[6,Row];
    L_stOldCardNo := ed_CardNo.Text ;

    MapJpg := TJpegImage.Create;
    MapStream := TMemoryStream.Create;
    stSql := ' select * from TB_EMPLOYEE ' ;
    stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND EM_CODE = ''' + cells[4,Row] + ''' ';
    stSql := stSql + ' AND CO_COMPANYCODE = ''' + cells[7,Row] + ''' ';

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
  end;

  pan_Employee.Visible := True;
  L_bEmployeeInfoVisible := True;
  pan_Employee.Caption.Text := '<FONT size="12"><center><B>조회</B></center></FONT>';
  L_nTopRow := sg_Employ.TopRow;
  L_stState := 'SEARCH';
  ButtonEnable(L_stState);
  FormEnable(L_stState);


end;

procedure TfmTreeEmployee.st_ExitClick(Sender: TObject);
begin
  inherited;
  pan_Employee.Visible := False;
  L_bEmployeeInfoVisible := False;
end;

procedure TfmTreeEmployee.sg_EmploySelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  nIndex : integer;
  MapJpg : TJpegImage;
  MapStream : TMemoryStream;
  BlobField : TBlobField;
  TempAdoQuery : TADOQuery;
  stSql : string;
  stImage : string;
begin
  inherited;
  FormClear;

  with sg_Employ do
  begin
    if cells[4,Row] = '' then
    begin
      exit;    //사번
    end;
    ed_EmpNo.Text := cells[4,Row];
    ed_Name.Text := cells[5,Row];
    LoadsCompanyCode(CompanyCodeList,TComboBox(cmb_Company));
    nIndex := CompanyCodeList.IndexOf(cells[7,Row]);
    if nIndex > -1 then  cmb_Company.ItemIndex := nIndex;
    LoadsJijumCode(cells[7,Row],JijumCodeList,TComboBox(cmb_Jijum));
    nIndex := JijumCodeList.IndexOf(cells[7,Row] + cells[8,Row]);
    if nIndex > -1 then  cmb_Jijum.ItemIndex := nIndex;
    LoadsDepartCode(cells[7,Row],cells[8,Row],DepartCodeList,TComboBox(cmb_Depart));
    nIndex := DepartCodeList.IndexOf(cells[7,Row] + cells[8,Row] + cells[9,Row]);
    if nIndex > -1 then  cmb_Depart.ItemIndex := nIndex;
    LoadsPosiCode(cells[7,Row],PosiCodeList,TComboBox(cmb_Posi));
    nIndex := PosiCodeList.IndexOf(cells[7,Row] + cells[10,Row]);
    if nIndex > -1 then  cmb_Posi.ItemIndex := nIndex;
    LoadsEmpType(EmpTypeCodeList,TComboBox(cmb_EmType));
    nIndex := EmpTypeCodeList.IndexOf(cells[20,Row]);
    if nIndex > -1 then cmb_emType.ItemIndex := nIndex;
    if length(cells[13,Row]) = 8 then
      dt_RetireDt.Date := strToDate(copy(cells[13,Row],1,4) + '-' + copy(cells[13,Row],5,2) + '-' + copy(cells[13,Row],7,2) ) ;
    ed_Handphone.Text := cells[18,Row];
    ed_CompanyPhone.Text := cells[11,Row];
    ed_CardNo.Text := cells[6,Row];
    L_stOldCardNo := ed_CardNo.Text ;

    MapJpg := TJpegImage.Create;
    MapStream := TMemoryStream.Create;
    stSql := ' select * from TB_EMPLOYEE ' ;
    stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND EM_CODE = ''' + cells[4,Row] + ''' ';
    stSql := stSql + ' AND CO_COMPANYCODE = ''' + cells[7,Row] + ''' ';

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
  end;

end;

procedure TfmTreeEmployee.sg_EmploySelectionChanged(Sender: TObject; ALeft,
  ATop, ARight, ABottom: Integer);
var
  nIndex : integer;
  MapJpg : TJpegImage;
  MapStream : TMemoryStream;
  BlobField : TBlobField;
  TempAdoQuery : TADOQuery;
  stSql : string;
  stImage : string;
begin
  inherited;
  FormClear;

  with sg_Employ do
  begin
    if cells[4,ATop] = '' then
    begin
      exit;    //사번
    end;
    ed_EmpNo.Text := cells[4,ATop];
    ed_OldEmpNo.Text := cells[4,ATop];
    ed_Name.Text := cells[5,ATop];
    LoadsCompanyCode(CompanyCodeList,TComboBox(cmb_Company));
    nIndex := CompanyCodeList.IndexOf(cells[7,ATop]);
    if nIndex > -1 then  cmb_Company.ItemIndex := nIndex;
    LoadsJijumCode(cells[7,ATop],JijumCodeList,TComboBox(cmb_Jijum));
    nIndex := JijumCodeList.IndexOf(cells[7,ATop] + cells[8,ATop]);
    if nIndex > -1 then  cmb_Jijum.ItemIndex := nIndex;
    LoadsDepartCode(cells[7,ATop],cells[8,ATop],DepartCodeList,TComboBox(cmb_Depart));
    nIndex := DepartCodeList.IndexOf(cells[7,ATop] + cells[8,ATop] + cells[9,ATop]);
    if nIndex > -1 then  cmb_Depart.ItemIndex := nIndex;
    LoadsPosiCode(cells[7,ATop],PosiCodeList,TComboBox(cmb_Posi));
    nIndex := PosiCodeList.IndexOf(cells[7,ATop] + cells[10,ATop]);
    if nIndex > -1 then  cmb_Posi.ItemIndex := nIndex;
    LoadsEmpType(EmpTypeCodeList,TComboBox(cmb_EmType));
    nIndex := EmpTypeCodeList.IndexOf(cells[20,ATop]);
    if nIndex > -1 then cmb_emType.ItemIndex := nIndex;
    if length(cells[13,ATop]) = 8 then
      dt_RetireDt.Date := strToDate(copy(cells[13,ATop],1,4) + '-' + copy(cells[13,ATop],5,2) + '-' + copy(cells[13,ATop],7,2) ) ;
    ed_Handphone.Text := cells[18,ATop];
    ed_CompanyPhone.Text := cells[11,ATop];
    ed_CardNo.Text := cells[6,ATop];
    L_stOldCardNo := ed_CardNo.Text ;

    MapJpg := TJpegImage.Create;
    MapStream := TMemoryStream.Create;
    stSql := ' select * from TB_EMPLOYEE ' ;
    stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND EM_CODE = ''' + cells[4,ATop] + ''' ';
    stSql := stSql + ' AND CO_COMPANYCODE = ''' + cells[7,ATop] + ''' ';

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
  end;
end;

procedure TfmTreeEmployee.CommandArrayCommandsTCloseExecute(
  Command: TCommand; Params: TStringList);
begin
  inherited;
  Close;
end;

initialization
  RegisterClass(TfmTreeEmployee);
Finalization
  UnRegisterClass(TfmTreeEmployee);

end.
