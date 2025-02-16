unit uLOMOSEmployee;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvEdit, AdvEdBtn, PlannerDatePicker, ExtCtrls, StdCtrls,
  Buttons, Grids, BaseGrid, AdvGrid, ComCtrls,DB,Jpeg, uSubForm,
  CommandArray, OoMisc, AdPort,WinSpool, AdPacket, ADODB,
  LMDCustomComponent, LMDFileCtrl, RzLstBox, RzChkLst,ActiveX, Gauges,
  AdvObj;

type
  TfmLOMOSEmployee = class(TfmASubForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    RzOpenDialog1: TOpenDialog;
    ReaderPort: TApdComPort;
    ApdDataPacket1: TApdDataPacket;
    ADOQuery: TADOQuery;
    FileCtrl: TLMDFileCtrl;
    Panel6: TPanel;
    sg_Employ: TAdvStringGrid;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    ADOExec: TADOQuery;
    ADOQuery1: TADOQuery;
    fdmsADOQuery: TADOQuery;
    GroupBox3: TGroupBox;
    btn_EmployInsert: TSpeedButton;
    GroupBox1: TGroupBox;
    lb_CompanyName: TLabel;
    lb_JijumName: TLabel;
    lb_DepartName: TLabel;
    lb_PosiName: TLabel;
    btn_Close: TSpeedButton;
    cmb_Company: TComboBox;
    cmb_Jijum: TComboBox;
    cmb_Depart: TComboBox;
    cmb_Posi: TComboBox;
    btn_Save: TBitBtn;
    lb_emType: TLabel;
    cmb_EmpType: TComboBox;
    Gauge1: TGauge;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ApdDataPacket1StringPacket(Sender: TObject; Data: String);
    procedure rg_CardReaderClick(Sender: TObject);
    procedure btn_EmployInsertClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_BackupClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure cmb_CompanyChange(Sender: TObject);
    procedure cmb_JijumChange(Sender: TObject);
    procedure sg_EmployCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);

  private
    CheckCount : integer;
    sCompanyCodeList : TStringList;
    DoorList: TStringList;
    CurCheckedList: TStringList;
    DoorCodeList : TStringList;
    sPosiCodeList : TStringList;
    sDepartCodeList : TStringList;
    ComPortList : TStringList;
    OldCardNo : string;
    AutoSabun : integer;
    bDoorClick : Boolean;
    CompanyCodeList : TStringList;
    JijumCodeList : TStringList;
    PosiCodeList : TStringList;
    DepartCodeList : TStringList;
    EmpTypeCodeList : TStringList;
    { Private declarations }
    procedure LoadDoorList(cmb_Box:TComboBox);

    procedure GridInit(sg:TStringGrid;aCol:integer);
    procedure SearchCardGrade;
    procedure InsertDoorGrade;
    Function CheckTB_DEVICECARDNO(aCardNo,aNodeNo,aECUID : String):Boolean;
    Function InsertTB_DEVICECARDNO(aCardNo,aNodeNo,aECUID,aDoorNO,aTimCode,aPermit,aValue:string):Boolean;
    Function UpdateTB_DEVICECARDNO(aCardNo,aNodeNo,aECUID,aDoorNO,aTimCode,aPermit,aValue: string):Boolean;

    Function DeleteTB_CARD(aCardNo:string):Boolean;
    Function UpdateTB_DEVICECARDNODelete(aCardNo,aPermit:string):Boolean; //모든 카드 권한을 삭제 처리함
    Function DeleteTB_EMPLOYEEAll:Boolean;
    Function InsertIntoTB_EMPLOYEE(aEmpID,aEmpNM,aCompanyCode,aJijumCode,aDepartCode,aPosiCode,aCompanyPhone,
                                 aJoinDate,aRetireDate,aZipcode,aAddr1,aAddr2,aHomePhone,aHandphone,
                                 afdmsID,aCardNo,aEmpImg,aEmType:string):Boolean;
    Function UpdateTB_EMPLOYEE(aEmpID,aEmpNM,aCompanyCode,aJijumCode,aDepartCode,aPosiCode,aCompanyPhone,
                                 aJoinDate,aRetireDate,aZipcode,aAddr1,aAddr2,aHomePhone,aHandphone,
                                 afdmsID,aCardNo,aEmpImg,aEmType:string):Boolean;
    Function CheckTB_CARD(aCardNo:string) : Boolean;
    Function InsertTB_CARD(aCardNo,aCardGubun,aCardType,aEmpID,aCompanyCode:string) : Boolean;
    Function UpdateTB_CARD(aCardNo,aCardGubun,aCardType,aEmpID,aCompanyCode:string) : Boolean;
    Function CheckTB_EMPLOYEE(aCompanyCode,aEmpID:string):Boolean;
    Procedure RcvCardDataByReader(aData:String);
    Function UpdateTB_ACCESSEVENTCARDNO(OldCardNo,aCardNo:string):Boolean;
    Function UpdateTB_ATEVENTCARDNO(OldCardNo,aCardNo:string):Boolean;
    Function UpdateTB_FoodEventCARDNO(OldCardNo,aCardNo:string):Boolean;

    Function CheckEmployeeNo(aCompanyCode ,aEmployNo:string):Boolean;
    function EmployeeFormCheck:Boolean;
    function EmployeeInsert:Boolean;
    function CheckCardNo(aCardNo:string; var aCompany,aEmpNo:string):Boolean;
    Function GetFdmsID:string;
    Function GetEmployeeFdmsID(aCompanyCode,aEmpID:string):string;


  private
    procedure FormNameSet;
    procedure AdvStrinGridSetAllCheck(Sender: TObject;bchkState:Boolean);

  public
    State : string;
    EmployeeNo:string;
    CompanyCode:string;
    EmployeeList : TStringList;
    { Public declarations }
    function GetSerialPortList(List : TStringList; const doOpenTest : Boolean = True) : LongWord;
    function EncodeCommportName(PortNum : WORD) : String;
    function DecodeCommportName(PortName : String) : WORD;

  end;

var
  fmLOMOSEmployee: TfmLOMOSEmployee;

implementation

uses
  uDataModule1,
  uLomosUtil,
  uZipCode,
  uCommonSql,
  uCompanyCodeLoad, udmAdoQuery;

{$R *.dfm}

procedure TfmLOMOSEmployee.btn_CloseClick(Sender: TObject);
begin
  Close;
end;


procedure TfmLOMOSEmployee.FormCreate(Sender: TObject);
var
  stCompanyCode : string;
  stJijumCode : string;
begin
  self.ModuleID := 'BatchEmploy';

  sCompanyCodeList := TStringList.Create;
  sPosiCodeList := TStringList.Create;
  sDepartCodeList := TStringList.Create;
  ComPortList := TStringList.Create;
  DoorCodeList := TStringList.Create;
  DoorList:= TStringList.Create;
  CurCheckedList:= TStringList.Create;

  CompanyCodeList := TStringList.Create;
  JijumCodeList := TStringList.Create;
  PosiCodeList := TStringList.Create;
  DepartCodeList := TStringList.Create;
  EmpTypeCodeList := TStringList.Create;

  State := '';
  AutoSabun := 1;
//  LoadDoorList(cmb_ComPort);
  bDoorClick := False;
  //GridInit(sg_Employ,4);

  EmployeeList := TStringList.Create;

  LoadsCompanyCode(CompanyCodeList,cmb_Company);
  stCompanyCode := '000';
  stJijumCode := '000';
  if cmb_Company.ItemIndex > 0 then stCompanyCode := CompanyCodeList.Strings[cmb_Company.ItemIndex];
  LoadsJijumCode(stCompanyCode,JijumCodeList,cmb_Jijum);
  if cmb_Jijum.ItemIndex > 0 then stJijumCode := copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3);
  LoadsDepartCode(stCompanyCode,stJijumCode,DepartCodeList,cmb_Depart);
  LoadsPosiCode(stCompanyCode,PosiCodeList,cmb_Posi);
  LoadsEmpType(EmpTypeCodeList,cmb_EmpType);

end;

procedure TfmLOMOSEmployee.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ApdDataPacket1.Enabled := False;
  ReaderPort.Open:= False;

  sCompanyCodeList.Free;
  sPosiCodeList.Free;
  sDepartCodeList.Free;
  DoorList.Free;
  CurCheckedList.Free;

  CompanyCodeList.Free;
  JijumCodeList.Free;
  PosiCodeList.Free;
  DepartCodeList.Free;
  EmpTypeCodeList.Free;

  ApdDataPacket1.Free;
  ReaderPort.Free;
  ComPortList.Free;
  DoorCodeList.Free;

  EmployeeList.Free;
  
end;


procedure TfmLOMOSEmployee.GridInit(sg: TStringGrid;aCol:integer);
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

function TfmLOMOSEmployee.DeleteTB_CARD(aCardNo: string): Boolean;
var
  stSql : string;
  bResult : Boolean;
begin
  Result := False;
  if aCardNo = '' then Exit;
  bResult := UpdateTB_DEVICECARDNODelete(aCardNo,'N'); //모든 카드 권한을 삭제 처리함
//  if Not bResult then Exit;

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

function TfmLOMOSEmployee.UpdateTB_DEVICECARDNODelete(aCardNo,
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


function TfmLOMOSEmployee.UpdateTB_EMPLOYEE(aEmpID,aEmpNM,aCompanyCode,aJijumCode,aDepartCode,aPosiCode,aCompanyPhone,
aJoinDate,aRetireDate,aZipcode,aAddr1,aAddr2,aHomePhone,aHandphone,
afdmsID,aCardNo,aEmpImg,aEmType: string): Boolean;
var
  stSql : string;
  stCompanyName,stJijumName,stDepartName,stPosiName : string;
begin
  Result := False;

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
  stSql := stSql + 'EM_UPDATETIME = ''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',';
  stSql := stSql + 'EM_UPDATEOPERATOR = ''' + Master_ID + ''', ';
  stSql := stSql + 'rg_code = ''' + aEmType + ''' ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmpID + '''';


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

  end;

  stCompanyName := DataModule1.GetCompanyName(aCompanyCode);
  stJijumName := DataModule1.GetJijumName(aCompanyCode,aJijumCode);
  stDepartName := DataModule1.GetDepartName(aCompanyCode,aJijumCode,aDepartCode);
  stPosiName := DataModule1.GetPosiName(aCompanyCode,aPosiCode);

  stSql := CommonSql.InsertIntoTB_EMPHIS(aCompanyCode,aEmpID,afdmsID,'2',aCardNo,'1',
             aEmpNM,aHandphone,stCompanyName,stJijumName,stDepartName,stPosiName);//수정
  result := DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_EMPLOYEECHANGE(aCompanyCode,aEmpID,aCardNo,'LOMOSEmployee','2');
  DataModule1.ProcessExecSQL(stSql);
end;

function TfmLOMOSEmployee.CheckTB_CARD(aCardNo:string): Boolean;
var
  stSql : string;
  stMsg : string;
  TempAdoQuery : TADOQuery;
begin
  Result := False;
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

    if RecordCount > 0 then  result := True;

  end;
  TempAdoQuery.Free;
  CoUninitialize;

end;

function TfmLOMOSEmployee.InsertTB_CARD(aCardNo, aCardGubun, aCardType, aEmpID,
  aCompanyCode: string): Boolean;
var
  stSql : string;
begin
  Result := False;
  if (CARDLENGTHTYPE = 0) and IsNumericCardNo then
  begin
    if Length(aCardNo) <> 10 then Exit;
  end;

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
  Result := True;
end;

function TfmLOMOSEmployee.UpdateTB_CARD(aCardNo, aCardGubun, aCardType, aEmpID,
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
  stSql := stSql + ' CA_MEMLOAD = ''N'',';
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

function TfmLOMOSEmployee.CheckTB_EMPLOYEE(aCompanyCode,aEmpID : string): Boolean;
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

function TfmLOMOSEmployee.GetSerialPortList(List: TStringList;
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

function TfmLOMOSEmployee.DecodeCommportName(PortName: String): WORD;
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

function TfmLOMOSEmployee.EncodeCommportName(PortNum: WORD): String;
begin
 if PortNum < 10
    then Result := 'COM' + IntToStr(PortNum) + ':'
    else Result := '\\.\COM'+IntToStr(PortNum);

end;

procedure TfmLOMOSEmployee.ApdDataPacket1StringPacket(Sender: TObject;
  Data: String);
begin
  RcvCardDataByReader(Data);
  ApdDataPacket1.Enabled := True;

end;

procedure TfmLOMOSEmployee.RcvCardDataByReader(aData: String);
var
  aIndex: Integer;
  aCardNo:String;
  bCardNo: int64;
  stMsg : string;
  stCompany,stEmpNo:string;
begin
  //STX 삭제
  aIndex:= Pos(#$2,aData);
  if aIndex > 0 then Delete(aData,aIndex,1);
  //ETX삭제
  aIndex:= Pos(#$3,aData);
  if aIndex > 0 then Delete(aData,aIndex,1);

  bCardNo:= Hex2Dec64(aData);
  aCardNo:= FillZeroNumber2(bCardNo,10);
  with sg_Employ do
  begin
    if CheckCardNo(aCardNo,stCompany,stEmpNo) then
    begin
      showmessage(FM001 + ':' + stCompany + ',' + FM101 + ':' + stEmpNo + ' : 이미 등록되어 있는 카드입니다.');
      Exit;
    end;
    if Trim(Cells[0,row]) = '' then
    begin
      showmessage(FM001 + '가 없습니다.');
      Exit;
    end;
    if Trim(Cells[1,row]) = '' then
    begin
      showmessage(FM101 + '이 없습니다.');
      Exit;
    end;
    if Trim(Cells[3,row]) <> '' then
    begin
      stMsg := '(' + Trim(Cells[3,row]) + ')카드번호가 존재 합니다. (' +
          aCardNo + ') 으로 변경하시겠습니까? ' ;
      if Trim(Cells[3,row]) <> aCardNo then
      begin
        if (Application.MessageBox(PChar(stMsg),'변경',MB_OKCANCEL) = ID_CANCEL)  then Exit;
        DeleteTB_CARD(Trim(Cells[3,row]));
        UpdateTB_ACCESSEVENTCARDNO(Trim(Cells[3,row]),aCardNo);
        UpdateTB_ATEVENTCARDNO(Trim(Cells[3,row]),aCardNo);
        UpdateTB_FoodEventCARDNO(Trim(Cells[3,row]),aCardNo);

      end;
    end;
    Cells[3,row] := aCardNo;
    if Not InsertTB_CARD(aCardNo,'1','1',Trim(Cells[1,row]),Trim(Cells[0,row])) then
    begin
      showmessage('카드데이터 입력에 실패 했습니다.');
      Exit;
    end;
    if (row + 1 < rowCount) then
    begin
      SelectRange(3,3,row + 1,row + 1);
    end;
  end;
{  if Trim(ed_CardNo.Text) <> '' then
  begin
    stMsg := '(' + ed_CardNo.Text + ')카드번호가 존재 합니다. (' +
        aCardNo + ') 으로 변경하시겠습니까? ' ;
    if Trim(ed_CardNo.Text) <> aCardNo then
    begin
      if (Application.MessageBox(PChar(stMsg),'변경',MB_OKCANCEL) = ID_CANCEL)  then Exit;
    end;
  end;
  ed_CardNo.Text := aCardNo;     }

end;

procedure TfmLOMOSEmployee.rg_CardReaderClick(Sender: TObject);
begin
{  if  rg_CardReader.ItemIndex = 0 then
  begin
    chk_CardReg.Checked := True;
    cmb_ComPort.Visible := True;
    cmb_ComPort.Top := 30;
  end else if rg_CardReader.ItemIndex = 1 then
  begin
    chk_CardReg.Checked := False;
    cmb_ComPort.Visible := True;
    cmb_ComPort.Top := 58;
  end else
  begin
    chk_CardReg.Checked := False;
    //cmb_ComPort.Clear;
    cmb_ComPort.Visible := False;
  end;  }
end;

procedure TfmLOMOSEmployee.LoadDoorList(cmb_Box: TComboBox);
var
  stSql :string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  DoorCodeList.Clear;

  stSql := ' select * from TB_DOOR ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';

  cmb_Box.Items.Add(' ');
  DoorCodeList.Add('');
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
      cmb_Box.Items.Add(FindField('DO_DOORNONAME').AsString);
      DoorCodeList.Add(FillZeroNumber(FindField('AC_NODENO').AsInteger,3) +
                       FindField('AC_ECUID').asstring +
                       FindField('DO_DOORNO').AsString);
      Next;
    end;

  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

function TfmLOMOSEmployee.UpdateTB_ACCESSEVENTCARDNO(OldCardNo,
  aCardNo: string): Boolean;
var
  stSql :string;
begin
  stSql := 'Update TB_ACCESSEVENT set CA_CARDNO = ''' + aCardNo + ''' ';
  stSql := stSql + ' Where CA_CARDNO = ''' + aCardNo + ''' ';

  result := DataModule1.ProcessEventExecSQL(stSql);
end;

function TfmLOMOSEmployee.UpdateTB_ATEVENTCARDNO(OldCardNo,
  aCardNo: string): Boolean;
var
  stSql :string;
begin
  stSql := 'Update TB_ATEVENT set CA_CARDNO = ''' + aCardNo + ''' ';
  stSql := stSql + ' Where CA_CARDNO = ''' + aCardNo + ''' ';

  result := DataModule1.ProcessEventExecSQL(stSql);

end;

function TfmLOMOSEmployee.UpdateTB_FoodEventCARDNO(OldCardNo,
  aCardNo: string): Boolean;
var
  stSql :string;
begin
  stSql := 'Update TB_FoodEvent set CA_CARDNO = ''' + aCardNo + ''' ';
  stSql := stSql + ' Where CA_CARDNO = ''' + aCardNo + ''' ';

  result := DataModule1.ProcessEventExecSQL(stSql);

end;

procedure TfmLOMOSEmployee.SearchCardGrade;

begin

end;

procedure TfmLOMOSEmployee.InsertDoorGrade;

begin

end;

function TfmLOMOSEmployee.CheckTB_DEVICECARDNO(aCardNo, aNodeNo,
  aECUID: String): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'select * from TB_DEVICECARDNO ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ';

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
  end;
  result := True;
end;

function TfmLOMOSEmployee.InsertTB_DEVICECARDNO(aCardNo, aNodeNo, aECUID, aDoorNO,
  aTimCode, aPermit, aValue: string): Boolean;
var
  stSql : string;
begin
  if Trim(aCardNo) = '' then Exit;
  result := False;
  stSql := ' Insert Into TB_DEVICECARDNO( ';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'CA_CARDNO,';
  stSql := stSql + 'AC_NODENO,';
  stSql := stSql + 'AC_ECUID,';
  if aDoorNO = '1' then  stSql := stSql + 'DE_DOOR1,'
  else if aDoorNO = '2'then  stSql := stSql + 'DE_DOOR2,';
  stSql := stSql + 'DE_USEACCESS,';
  stSql := stSql + 'DE_TIMECODE,';
  stSql := stSql + 'DE_PERMIT,';
  stSql := stSql + 'DE_RCVACK,';
  stSql := stSql + 'DE_UPDATETIME,';
  stSql := stSql + 'DE_UPDATEOPERATOR ) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aCardNo + ''',';
  stSql := stSql + aNodeNo + ',';
  stSql := stSql + '''' + aECUID + ''',';
  if aDoorNO = '1' then  stSql := stSql + '''' + aValue + ''','
  else if aDoorNO = '2'then  stSql := stSql + '''' + aValue + ''',';
  stSql := stSql + '''Y'',';
  stSql := stSql + '''' + aTimCode + ''',';
  stSql := stSql + '''' + aPermit + ''',';
  stSql := stSql + '''N'',';
  stSql := stSql + '''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',';
  stSql := stSql + '''' + Master_ID + ''') ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmLOMOSEmployee.UpdateTB_DEVICECARDNO(aCardNo, aNodeNo, aECUID, aDoorNO,
  aTimCode, aPermit, aValue: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' Update TB_DEVICECARDNO Set ';
  if aDoorNO = '1' then  stSql := stSql + 'DE_DOOR1 = ''' + aValue + ''','
  else if aDoorNO = '2'then  stSql := stSql + 'DE_DOOR2 = ''' + aValue + ''',';
  stSql := stSql + 'DE_USEACCESS = ''Y'',';
  stSql := stSql + 'DE_TIMECODE = ''' + aTimCode + ''',';
  stSql := stSql + 'DE_PERMIT = ''' + aPermit + ''',';
  stSql := stSql + 'DE_RCVACK = ''N'',';
  stSql := stSql + 'DE_UPDATETIME = ''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',';
  stSql := stSql + 'DE_UPDATEOPERATOR = ''' + Master_ID + ''' ';
  stSql := stSql + ' Where GROUP_CODE =''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO =''' + aCardNo + ''' ';
  stSql := stSql + ' AND AC_NODENO =' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + '''';

  result := DataModule1.ProcessExecSQL(stSql);

end;

procedure TfmLOMOSEmployee.btn_EmployInsertClick(Sender: TObject);
var
  stFile : string;
  i : integer;
begin
  sg_Employ.RemoveCols(0,1);
  GridInitialize(sg_Employ);
  OpenDialog1.InitialDir:= ExtractFileDir(Application.ExeName);
  OpenDialog1.DefaultExt:= 'CSV';
  OpenDialog1.Filter := 'CSV files (*.CSV)|*.CSV';
  if OpenDialog1.Execute then
  begin
    stFile:= OpenDialog1.FileName;
    sg_Employ.LoadFromCSV(stFile);
  end;
  sg_Employ.InsertCols(0,1);
  sg_Employ.ColWidths[0] := 20;
  with sg_Employ do
  begin
    for i := 0 to RowCount - 1 do
    begin
      AddCheckBox(0,i,False,False);
    end;
  end;
  if Not EmployeeFormCheck then
  begin
    Exit;
  end;

end;

function TfmLOMOSEmployee.CheckEmployeeNo(aCompanyCode,
  aEmployNo: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'select * from TB_EMPLOYEE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmployNo + ''' ';
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
    if recordCount < 1 then Exit;
  end;

  result := True;
end;

function TfmLOMOSEmployee.EmployeeFormCheck: Boolean;
var
  i,j,nEnd : integer;
  stCompanyCode,stEmployee:string;
begin
  result := False;
  EmployeeList.Clear;
  j := 1;
  nEnd := sg_Employ.RowCount - 1;
  for i := 1 to nEnd do
  begin
    StatusBar1.Panels[0].Text := inttostr(i) + '/' + inttostr(nEnd) + ' 데이터 체크중...';
    if Length(sg_Employ.Cells[1,j]) <> 10 then
    begin
      showmessage('카드번호는 10자리 입니다.');
      //sg_Employ.SelectRows(i,1);
      sg_Employ.RemoveRows(j,1);
      continue;
    end;
    if Trim(sg_Employ.Cells[10,j])='' then
    begin
      showmessage('사번은 필수 코드 입니다.');
      sg_Employ.RemoveRows(j,1);
      continue;
    end;
    if Trim(sg_Employ.Cells[11,j])='' then
    begin
      showmessage('이름은 필수 항목 입니다.');
      sg_Employ.RemoveRows(j,1);
      continue;
    end;
    inc(j);
  end;
  result := True;
end;

function TfmLOMOSEmployee.EmployeeInsert: Boolean;
var
  i: integer;
  stSql : string;
  stCardNo : string;
  stCompanyCode : string;
  stJijumCode : string;
  stDepartCode : string;
  stPosiCode : string;
  stfdmsID : string;
  stEmCode : string;
  stEmName : string;
  stJoinDate : string;
  stRetireDate : string;
  stEmType : string;
  bchkState : Boolean;
begin
  result := False;
  stCompanyCode := '000';
  stJijumCode := '000';
  stDepartCode := '000';
  stPosiCode := '000';
  stEmType := '000';
  stCompanyCode := CompanyCodeList.Strings[cmb_Company.itemindex];
  if cmb_Jijum.itemindex > 0 then
    stJijumCode := copy(JijumCodeList.Strings[cmb_Jijum.itemindex],4,3);
  if cmb_Depart.itemindex > 0 then
    stDepartCode := copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],7,3);
  if cmb_Posi.ItemIndex > 0 then stPosicode := copy(PosiCodeList.Strings[cmb_Posi.ItemIndex],4,3);
  if cmb_EmpType.ItemIndex > 0 then stEmType := EmpTypeCodeList.Strings[cmb_EmpType.ItemIndex];

  stJoinDate :=  FormatDateTime('yyyymmdd',Now);

  Gauge1.Visible := True;
  Gauge1.MaxValue := CheckCount;
  Gauge1.Progress := 0;
  DataModule1.ADOConnection.BeginTrans;
  for i := 1 to sg_Employ.RowCount - 1 do
  begin
    sg_Employ.GetCheckBoxState(0,i, bchkState);
    if Not bchkState then continue;
    Gauge1.Progress := Gauge1.Progress + 1;
    Application.ProcessMessages;
    
    stEmCode := Trim(sg_Employ.Cells[10,i]);
    stEmName := Trim(sg_Employ.Cells[11,i]);
    stCardNo := Trim(sg_Employ.Cells[1,i]);
    if length(stCardNo) <> 10 then continue;
    stRetireDate := '99991231';

    stfdmsID := GetFdmsID;

    StatusBar1.Panels[0].Text := inttostr(i) + '/' + inttostr(sg_Employ.RowCount - 1) + FM106 +'정보 입력중...';
    if Not CheckTB_EMPLOYEE(stCompanyCode,stEmCode) then
    begin
      InsertIntoTB_EMPLOYEE(stEmCode,stEmName,stCompanyCode,stJijumCode,stDepartCode,
                            stPosiCode,'',stJoinDate,stRetireDate,'',
                            '','','','',stfdmsID,stCardNo,'',stEmType);
    end else
    begin
    {
      UpdateTB_EMPLOYEE(stEmCode,stEmName,stCompanyCode,stJijumCode,stDepartCode,
                            stPosiCode,'',stJoinDate,stRetireDate,'',
                            '','','','',stfdmsID,stCardNo,'',stEmType);
    }
    end;

    if stCardNo <> '' then
    begin
      if Not CheckTB_CARD(stCardNo) then
      begin
        InsertTB_CARD(stCardNo,'1','1',stEmCode,stCompanyCode);
      end else
      begin
        UpdateTB_CARD(stCardNo,'1','1',stEmCode,stCompanyCode);
      end;
    end;

  end;
  DataModule1.ADOConnection.CommitTrans;
  Gauge1.Visible := False;

  result := True;
end;

function TfmLOMOSEmployee.CheckCardNo(aCardNo: string; var aCompany,
  aEmpNo: string): Boolean;
var
  stSql :string;
begin
  result := False;
  stSql := 'select * from TB_CARD ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';
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
    aCompany := FindField('CO_COMPANYCODE').AsString;
    aEmpNo := FindField('EM_CODE').AsString;
  end;
  result := True;
end;

procedure TfmLOMOSEmployee.FormShow(Sender: TObject);
var
  stCompanyCode : string;
  stJijumCode : string;
  nIndex : integer;
  i : integer;
begin
  if Not IsMaster then
  begin
    if IsInsertGrade then btn_EmployInsert.Enabled := True
    else btn_EmployInsert.Enabled := False;
  end;

  stCompanyCode := '000';
  stJijumCode := '000';

  for i := 0 to sg_Employ.ColCount - 1 do
  begin
    if (i <> 0 ) and
       (i <> 9) and
       (i <> 10) then
        sg_Employ.ColWidths[i] := 0;
  end;
  sg_Employ.InsertCols(0,1);
  sg_Employ.ColWidths[0] := 20;
  FormNameSet;
end;

procedure TfmLOMOSEmployee.btn_BackupClick(Sender: TObject);
var
  stFile : string;
begin
  SaveDialog1.InitialDir:= ExtractFileDir(Application.ExeName);
  SaveDialog1.DefaultExt:= 'CSV';
  SaveDialog1.Filter := 'CSV files (*.CSV)|*.CSV';
  if SaveDialog1.Execute then
  begin
    stFile:= SaveDialog1.FileName;
    sg_Employ.SaveToCSV(stFile);
  end;
end;

function TfmLOMOSEmployee.DeleteTB_EMPLOYEEAll: Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'select a.*,b.CA_CARDNO from TB_EMPLOYEE a ';
  stSql := stSql + ' Left Join TB_CARD b ';
  stSql := stSql + ' ON(a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.EM_CODE = b.EM_CODE ';
  stSql := stSql + ' AND a.GROUP_CODE = b.GROUP_CODE) ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  with ADOQuery1 do
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
      dmAdoQuery.DeleteTB_EMPLOYEE(FindField('EM_CODE').AsString,FindField('CO_COMPANYCODE').AsString,FindField('CA_CARDNO').AsString);
      Next;
    end;
  end;
  result := True;
end;

function TfmLOMOSEmployee.GetEmployeeFdmsID(aCompanyCode,
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

function TfmLOMOSEmployee.GetFdmsID: string;
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

function TfmLOMOSEmployee.InsertIntoTB_EMPLOYEE(aEmpID, aEmpNM,
  aCompanyCode, aJijumCode,aDepartCode, aPosiCode, aCompanyPhone, aJoinDate,
  aRetireDate, aZipcode, aAddr1, aAddr2, aHomePhone, aHandphone, afdmsID,
  aCardNo, aEmpImg,aEmType: string): Boolean;
var
  stSql : string;
  stCompanyName,stJijumName,stDepartName,stPosiName : string;
begin
    stSql := ' insert Into TB_EMPLOYEE ';
    stSql := stSql + '( ';
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
    stSql := stSql + 'FDMS_ID,';
    stSql := stSql + 'FDMS_RELAY,';
    stSql := stSql + 'EM_UPDATETIME, ';
    stSql := stSql + 'RG_CODE ) ';
    stSql := stSql + ' VALUES (';
    stSql := stSql + '''' + GROUPCODE + ''', ';
    stSql := stSql + '''' + aEmpID + ''', ';
    stSql := stSql + '''' + aCompanyCode + ''', ';
    stSql := stSql + '''' + aJijumCode + ''', ';
    stSql := stSql + '''' + aDepartCode + ''', ';
    stSql := stSql + '''' + aPosiCode + ''', ';
    stSql := stSql + '''' + aEmpNM + ''', ';
    stSql := stSql + '''' + aCompanyPhone + ''', ';
    stSql := stSql + '''' + aHomePhone + ''', ';
    stSql := stSql + '''' + aHandphone + ''', ';
    stSql := stSql + '''' + aZipcode + ''', ';
    stSql := stSql + '''' + aAddr1 + ''', ';
    stSql := stSql + '''' + aAddr2 + ''', ';
    stSql := stSql + '''' + aJoinDate + ''', ';
    stSql := stSql + '''' + aRetireDate + ''', ';
    if FileExists(aEmpImg) then
    begin
      stSql := stSql + ':EM_IMAGE,';
    end;
    stSql := stSql + afdmsID + ',';
    stSql := stSql + '''N'',';
    stSql := stSql + '''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''', ';
    stSql := stSql + ''''+ aEmType +''') ';

    with DataModule1.ADOExecQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;
      if FileExists(aEmpImg) then
      begin
        if DBTYPE = 'MSSQL' then Parameters.ParamByName( 'EM_IMAGE' ).LoadFromFile( aEmpImg, ftGraphic )
        else Parameters.ParamByName( 'EM_IMAGE' ).Value := aEmpImg ;
      end;

      Try
        ExecSQL;
      Except
        Exit;
      End;

    end;
    stCompanyName := DataModule1.GetCompanyName(aCompanyCode);
    stJijumName := DataModule1.GetJijumName(aCompanyCode,aJijumCode);
    stDepartName := DataModule1.GetDepartName(aCompanyCode,aJijumCode,aDepartCode);
    stPosiName := DataModule1.GetPosiName(aCompanyCode,aPosiCode);

    stSql := CommonSql.InsertIntoTB_EMPHIS(aCompanyCode,aEmpID,afdmsID,'1',aCardNo,'1',
             aEmpNM,aHandphone,stCompanyName,stJijumName,stDepartName,stPosiName);//입력
    DataModule1.ProcessExecSQL(stSql);
    stSql := CommonSql.InsertIntoTB_EMPLOYEECHANGE(aCompanyCode,aEmpID,aCardNo,'LOMOSEmployee','1');
    DataModule1.ProcessExecSQL(stSql);
end;



procedure TfmLOMOSEmployee.btn_SaveClick(Sender: TObject);
begin
  if CheckCount < 1 then
  begin
    showmessage('저장할 데이터를 선택 하세요.');
    Exit;
  end;
  if cmb_Company.ItemIndex < 1 then
  begin
    showmessage('분류할 ' + FM001 + '를 선택 하세요.');
    Exit;
  end;
{  if Not EmployeeFormCheck then
  begin
    if (Application.MessageBox(PChar('비정상적인 데이터는 저장되지 않습니다.계속하시겠습니까?'),'정보',MB_OKCANCEL) = ID_CANCEL)  then Exit;
  end;}
  btn_Save.Enabled := False;
  btn_EmployInsert.Enabled := False;
  if Not EmployeeInsert then
  begin
    //showmessage('사원정보 입력에 실패했습니다.');
    //Exit;
  end;
  btn_Save.Enabled := True;
  btn_EmployInsert.Enabled := True;
  //showmessage('사원정보 입력 완료');
end;

procedure TfmLOMOSEmployee.FormNameSet;
begin
  lb_CompanyName.Caption := FM002;

  lb_JijumName.Caption := FM012;

  lb_DepartName.Caption := FM022;

  lb_PosiName.Caption := FM032;

  lb_emType.Caption := FM042;
end;

procedure TfmLOMOSEmployee.cmb_CompanyChange(Sender: TObject);
begin
  LoadsJijumCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],JijumCodeList,cmb_Jijum);
  LoadsDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
  LoadsPosiCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],PosiCodeList,cmb_Posi);

end;

procedure TfmLOMOSEmployee.cmb_JijumChange(Sender: TObject);
begin
  LoadsDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);

end;

procedure TfmLOMOSEmployee.sg_EmployCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
  if ARow = 0 then //전체선택 또는 해제
  begin
    if State then CheckCount := (Sender as TAdvStringGrid).RowCount - 1
    else CheckCount := 0;
    AdvStrinGridSetAllCheck(Sender,State);
  end else
  begin
    if State then CheckCount := CheckCount + 1
    else CheckCount := CheckCount - 1 ;
  end;

end;

procedure TfmLOMOSEmployee.AdvStrinGridSetAllCheck(Sender: TObject;
  bchkState: Boolean);
var
  i : integer;
begin
    for i:= 1 to (Sender as TAdvStringGrid).RowCount - 1  do
    begin
      (Sender as TAdvStringGrid).SetCheckBoxState(0,i,bchkState);
    end;

end;

initialization
  RegisterClass(TfmLOMOSEmployee);
Finalization
  UnRegisterClass(TfmLOMOSEmployee);

end.
