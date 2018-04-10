unit uBatchEmployee;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvEdit, AdvEdBtn, PlannerDatePicker, ExtCtrls, StdCtrls,
  Buttons, Grids, BaseGrid, AdvGrid, ComCtrls,DB,Jpeg, uSubForm,
  CommandArray, OoMisc, AdPort,WinSpool, AdPacket, ADODB,
  LMDCustomComponent, LMDFileCtrl, RzLstBox, RzChkLst,ActiveX, AdvObj;

type
  TfmBatchEmployee = class(TfmASubForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    RzOpenDialog1: TOpenDialog;
    ReaderPort: TApdComPort;
    ApdDataPacket1: TApdDataPacket;
    ADOQuery: TADOQuery;
    FileCtrl: TLMDFileCtrl;
    Panel6: TPanel;
    GroupBox3: TGroupBox;
    btn_FormatCreate: TSpeedButton;
    btn_EmployInsert: TSpeedButton;
    btn_Close: TSpeedButton;
    sg_Employ: TAdvStringGrid;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    ADOExec: TADOQuery;
    btn_Search: TSpeedButton;
    btn_Delete: TSpeedButton;
    chk_CardReg: TCheckBox;
    cmb_ComPort: TComboBox;
    btn_Backup: TSpeedButton;
    ADOQuery1: TADOQuery;
    fdmsADOQuery: TADOQuery;
    lb_CompanyName: TLabel;
    cmb_Company: TComboBox;
    lb_JijumName: TLabel;
    cmb_Jijum: TComboBox;
    lb_DepartName: TLabel;
    cmb_Depart: TComboBox;
    lb_PosiName: TLabel;
    cmb_Posi: TComboBox;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chk_CardRegClick(Sender: TObject);
    procedure cmb_ComPortChange(Sender: TObject);
    procedure ApdDataPacket1StringPacket(Sender: TObject; Data: String);
    procedure rg_CardReaderClick(Sender: TObject);
    procedure btn_FormatCreateClick(Sender: TObject);
    procedure btn_EmployInsertClick(Sender: TObject);
    procedure btn_DeleteClick(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure CommandArrayCommandsTCommand1Execute(Command: TCommand;
      Params: TStringList);
    procedure FormShow(Sender: TObject);
    procedure btn_BackupClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cmb_CompanyChange(Sender: TObject);
    procedure cmb_JijumChange(Sender: TObject);
    procedure cmb_DepartChange(Sender: TObject);
    procedure cmb_PosiChange(Sender: TObject);

  private
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
    L_nInputCardType : integer;
    { Private declarations }
    procedure LoadDoorList(cmb_Box:TComboBox);

    procedure GridInit(sg:TStringGrid;aCol:integer);
    procedure SearchCardGrade;
    procedure InsertDoorGrade;

    Function InsertTB_DEVICECARDNO(aCardNo,aNodeNo,aECUID,aDoorNO,aTimCode,aPermit,aValue:string):Boolean;
    Function InsertIntoTB_EMPLOYEE(aEmpID,aEmpNM,aCompanyCode,aJijumCode,aDepartCode,aPosiCode,aCompanyPhone,
                                 aJoinDate,aRetireDate,aZipcode,aAddr1,aAddr2,aHomePhone,aHandphone,
                                 afdmsID,aCardNo,aEmpImg:string):Boolean;
    Function InsertTB_CARD(aCardNo,aCardGubun,aCardType,aEmpID,aCompanyCode:string) : Boolean;

    Function UpdateTB_DEVICECARDNODelete(aCardNo,aPermit:string):Boolean; //모든 카드 권한을 삭제 처리함
    Function UpdateTB_DEVICECARDNO_CardNoChange(aOldCardNo,aNewCardNo:string):Boolean;
    Function UpdateTB_EMPLOYEE(aEmpID,aEmpNM,aCompanyCode,aJijumCode,aDepartCode,aPosiCode,aCompanyPhone,
                                 aJoinDate,aRetireDate,aZipcode,aAddr1,aAddr2,aHomePhone,aHandphone,
                                 aCardNo,aEmpImg:string):Boolean;
    Function UpdateTB_CARD(aCardNo,aCardGubun,aCardType,aEmpID,aCompanyCode:string) : Boolean;
    Function UpdateTB_ACCESSEVENTCARDNO(OldCardNo,aCardNo:string):Boolean;
    Function UpdateTB_ATEVENTCARDNO(OldCardNo,aCardNo:string):Boolean;
    Function UpdateTB_FoodEventCARDNO(OldCardNo,aCardNo:string):Boolean;
    Function UpdateTB_DEVICECARDNO(aCardNo,aNodeNo,aECUID,aDoorNO,aTimCode,aPermit,aValue: string):Boolean;

    Function DeleteTB_CARD(aCardNo:string):Boolean;
    Function DeleteTB_CARDEmployeeNo(aCompanyCode,aEmCode,aCardNo:String):Boolean;
    Function DeleteTB_DEVICECARDNO(aCardNo:string):Boolean;
    Function DeleteTB_EMPLOYEEAll:Boolean;

    Function CheckTB_DEVICECARDNO(aCardNo,aNodeNo,aECUID : String):Boolean;
    Function CheckTB_CARD(aCardNo:string) : Boolean;
    Function CheckTB_EMPLOYEE(aCompanyCode,aEmpID:string):Boolean;
    function CheckCardNo(aCardNo:string; var aCompany,aEmpNo:string):Boolean;
    Function CheckTB_CARDEmployeeNo(aCompanyCode,aEmCode:string):Boolean;

    Procedure RcvCardDataByReader(aData:String);

    function EmployeeFormCheck:Boolean;
    function EmployeeInsert:Boolean;
    procedure FormNameSet;
    Function GetFdmsID:string;
    Function GetEmployeeFdmsID(aCompanyCode,aEmpID:string):string;


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
  fmBatchEmployee: TfmBatchEmployee;

implementation

uses
  uDataModule1,
  uLomosUtil,
  uZipCode,
  uCommonSql,
  uCompanyCodeLoad, udmAdoQuery;

{$R *.dfm}

procedure TfmBatchEmployee.btn_CloseClick(Sender: TObject);
begin
  Close;
end;


procedure TfmBatchEmployee.FormCreate(Sender: TObject);
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

  State := '';
  AutoSabun := 1;
//  LoadDoorList(cmb_ComPort);
  bDoorClick := False;
  GridInit(sg_Employ,4);

  EmployeeList := TStringList.Create;
end;

procedure TfmBatchEmployee.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if ReaderPort.Open then
  begin
    ApdDataPacket1.Enabled := False;
    ReaderPort.Open:= False;
  end;

  sCompanyCodeList.Free;
  sPosiCodeList.Free;
  sDepartCodeList.Free;
  DoorList.Free;
  CurCheckedList.Free;

  CompanyCodeList.Free;
  JijumCodeList.Free;
  PosiCodeList.Free;
  DepartCodeList.Free;

  ComPortList.Free;
  DoorCodeList.Free;

  EmployeeList.Free;

  ApdDataPacket1.Free;
  ReaderPort.Free;

end;


procedure TfmBatchEmployee.GridInit(sg: TStringGrid;aCol:integer);
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

function TfmBatchEmployee.DeleteTB_CARD(aCardNo: string): Boolean;
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

function TfmBatchEmployee.UpdateTB_DEVICECARDNODelete(aCardNo,
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


function TfmBatchEmployee.UpdateTB_EMPLOYEE(aEmpID,aEmpNM,aCompanyCode,aJijumCode,aDepartCode,aPosiCode,aCompanyPhone,
aJoinDate,aRetireDate,aZipcode,aAddr1,aAddr2,aHomePhone,aHandphone,
aCardNo,aEmpImg: string): Boolean;
var
  stSql : string;
  stCompanyName,stJijumName,stDepartName,stPosiName : string;
  stfdmsID :string;
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
  stSql := stSql + 'EM_UPDATEOPERATOR = ''' + Master_ID + ''' ';
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
  stfdmsID := DataModule1.GetFdmsID(aCompanyCode,aEmpID);

  stSql := CommonSql.InsertIntoTB_EMPHIS(aCompanyCode,aEmpID,stfdmsID,'2',aCardNo,'1',
             aEmpNM,aHandphone,stCompanyName,stJijumName,stDepartName,stPosiName);//수정
  result := DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_EMPLOYEECHANGE(aCompanyCode,aEmpID,aCardNo,'BatchEmployee','2');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmBatchEmployee.CheckTB_CARD(aCardNo:string): Boolean;
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

function TfmBatchEmployee.InsertTB_CARD(aCardNo, aCardGubun, aCardType, aEmpID,
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

function TfmBatchEmployee.UpdateTB_CARD(aCardNo, aCardGubun, aCardType, aEmpID,
  aCompanyCode: string): Boolean;
var
  stSql : string;
begin
  if Length(aCardNo) = 0 then Exit;

  if (CARDLENGTHTYPE = 0) and IsNumericCardNo then
  begin
    if Length(aCardNo) <> 10 then Exit;
  end;

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

function TfmBatchEmployee.CheckTB_EMPLOYEE(aCompanyCode,aEmpID: string): Boolean;
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

procedure TfmBatchEmployee.chk_CardRegClick(Sender: TObject);
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
      cmb_ComPort.Clear;
    end;
    //LoadDoorList(cmb_ComPort);
  end;

end;

function TfmBatchEmployee.GetSerialPortList(List: TStringList;
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

function TfmBatchEmployee.DecodeCommportName(PortName: String): WORD;
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

function TfmBatchEmployee.EncodeCommportName(PortNum: WORD): String;
begin
 if PortNum < 10
    then Result := 'COM' + IntToStr(PortNum) + ':'
    else Result := '\\.\COM'+IntToStr(PortNum);

end;

procedure TfmBatchEmployee.cmb_ComPortChange(Sender: TObject);
begin
  if chk_CardReg.Checked then
  begin
    if cmb_ComPort.text = '' then Exit;
    ReaderPort.Open := False;
    ReaderPort.ComNumber := Integer(ComPortList.Objects[cmb_ComPort.ItemIndex]);
    //ReaderPort.ComNumber := strtoint(copy(cmb_ComPort.text,4,Pos(':',cmb_ComPort.text) -4));
    ReaderPort.Open := true;
  end;
end;

procedure TfmBatchEmployee.ApdDataPacket1StringPacket(Sender: TObject;
  Data: String);
begin
  RcvCardDataByReader(Data);
  ApdDataPacket1.Enabled := True;

end;

procedure TfmBatchEmployee.RcvCardDataByReader(aData: String);
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

procedure TfmBatchEmployee.rg_CardReaderClick(Sender: TObject);
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

procedure TfmBatchEmployee.LoadDoorList(cmb_Box: TComboBox);
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

function TfmBatchEmployee.UpdateTB_ACCESSEVENTCARDNO(OldCardNo,
  aCardNo: string): Boolean;
var
  stSql :string;
begin
  stSql := 'Update TB_ACCESSEVENT set CA_CARDNO = ''' + aCardNo + ''' ';
  stSql := stSql + ' Where CA_CARDNO = ''' + aCardNo + ''' ';

  result := DataModule1.ProcessEventExecSQL(stSql);
end;

function TfmBatchEmployee.UpdateTB_ATEVENTCARDNO(OldCardNo,
  aCardNo: string): Boolean;
var
  stSql :string;
begin
  stSql := 'Update TB_ATEVENT set CA_CARDNO = ''' + aCardNo + ''' ';
  stSql := stSql + ' Where CA_CARDNO = ''' + aCardNo + ''' ';

  result := DataModule1.ProcessEventExecSQL(stSql);

end;

function TfmBatchEmployee.UpdateTB_FoodEventCARDNO(OldCardNo,
  aCardNo: string): Boolean;
var
  stSql :string;
begin
  stSql := 'Update TB_FoodEvent set CA_CARDNO = ''' + aCardNo + ''' ';
  stSql := stSql + ' Where CA_CARDNO = ''' + aCardNo + ''' ';

  result := DataModule1.ProcessEventExecSQL(stSql);

end;

procedure TfmBatchEmployee.SearchCardGrade;

begin

end;

procedure TfmBatchEmployee.InsertDoorGrade;

begin

end;

function TfmBatchEmployee.CheckTB_DEVICECARDNO(aCardNo, aNodeNo,
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

function TfmBatchEmployee.InsertTB_DEVICECARDNO(aCardNo, aNodeNo, aECUID, aDoorNO,
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

function TfmBatchEmployee.UpdateTB_DEVICECARDNO(aCardNo, aNodeNo, aECUID, aDoorNO,
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

procedure TfmBatchEmployee.btn_FormatCreateClick(Sender: TObject);
var
  stFile : string;
begin
  GridInitialize(sg_Employ);
  SaveDialog1.InitialDir:= ExtractFileDir(Application.ExeName);
  SaveDialog1.DefaultExt:= 'CSV';
  SaveDialog1.Filter := 'CSV files (*.CSV)|*.CSV';
  if SaveDialog1.Execute then
  begin
    stFile:= SaveDialog1.FileName;
    sg_Employ.SaveToCSV(stFile);
  end;
  btn_SearchClick(self);


end;

procedure TfmBatchEmployee.btn_EmployInsertClick(Sender: TObject);
var
  stFile : string;
  i : integer;
begin
  L_nInputCardType := 0;
  if Application.MessageBox(pchar('업로드할 파일의 회사코드 및 지점 부서코드를 정확히 확인 하셨습니까?'),'정보',mb_okcancel) = idcancel then Exit;
  GridInitialize(sg_Employ);
  OpenDialog1.InitialDir:= ExtractFileDir(Application.ExeName);
  OpenDialog1.DefaultExt:= 'CSV';
  OpenDialog1.Filter := 'CSV files (*.CSV)|*.CSV';
  if OpenDialog1.Execute then
  begin
    stFile:= OpenDialog1.FileName;
    sg_Employ.LoadFromCSV(stFile);
  end else Exit;

(*  if Not EmployeeFormCheck then
  begin
    GridInitialize(sg_Employ);
    btn_SearchClick(self);
    Exit;
  end;
*)

  if Not EmployeeInsert then
  begin
    showmessage('사원정보 입력에 실패했습니다.');
    GridInitialize(sg_Employ);
    btn_SearchClick(self);
    Exit;
  end;
  showmessage('사원정보 입력 완료!!!');
  btn_SearchClick(self);

end;



function TfmBatchEmployee.EmployeeFormCheck: Boolean;
var
  i : integer;
  stCompanyCode,stEmployee:string;
begin
  result := False;
  EmployeeList.Clear;
  for i := 1 to sg_Employ.RowCount - 1 do
  begin
    StatusBar1.Panels[0].Text := inttostr(i) + '/' + inttostr(sg_Employ.RowCount - 1) + ' 데이터 체크중...';
    if Length(sg_Employ.Cells[0,i]) > 3 then
    begin
      showmessage(FM001 + '는 3자리 이내입니다.');
      Exit;
    end;
    if Trim(sg_Employ.Cells[0,i])='' then
    begin
      showmessage(FM001 + '는 필수 코드 입니다.');
      Exit;
    end;
    if Not IsDigit(sg_Employ.Cells[0,i]) then
    begin
      showmessage(FM001 + '는 숫자로만 등록하세요.');
      Exit;
    end;
{    if EmployeeList.IndexOf(sg_Employ.Cells[0,i] + Trim(sg_Employ.Cells[1,i])) > -1 then
    begin
      showmessage('중복 데이터가 포함되어 있습니다. ' + FM001 + ':' + sg_Employ.Cells[0,i] + ',' + FM101 + ':' + Trim(sg_Employ.Cells[1,i]) );
      Exit;
    end;
    EmployeeList.Add(sg_Employ.Cells[0,i] + Trim(sg_Employ.Cells[1,i]));
}
    if Length(Trim(sg_Employ.Cells[1,i])) = 0 then
    begin
      showmessage(FM101 + '은 필수 코드 입니다.');
      Exit;
    end;
    if Length(sg_Employ.Cells[2,i]) > 50 then
    begin
      showmessage(FM102 + '은 50자리 이내입니다.');
      Exit;
    end;
    {if Length(Trim(sg_Employ.Cells[3,i])) > 0 then
    begin
      showmessage('카드번호는 카드등록기로만 입력이 가능합니다.');
      Exit;
    end; }
    if Length(sg_Employ.Cells[4,i]) > 3 then
    begin
      showmessage(FM011 + '는 3자리 이내입니다.');
      Exit;
    end;
    if (Trim(sg_Employ.Cells[4,i]) <> '') and (Not IsDigit(sg_Employ.Cells[4,i])) then
    begin
      showmessage(FM011 + '는 숫자로만 등록해주세요.');
      Exit;
    end;
    if Length(sg_Employ.Cells[5,i]) > 3 then
    begin
      showmessage(FM021 + '는 3자리 이내입니다.');
      Exit;
    end;
    if (Trim(sg_Employ.Cells[5,i]) <> '') and (Not IsDigit(sg_Employ.Cells[5,i])) then
    begin
      showmessage(FM021 + '는 숫자로만 등록해주세요.');
      Exit;
    end;
    if Length(sg_Employ.Cells[6,i]) > 3 then
    begin
      showmessage(FM031 + '는 3자리 이내입니다.');
      Exit;
    end;
    if (Trim(sg_Employ.Cells[6,i]) <> '') and (Not IsDigit(sg_Employ.Cells[6,i])) then
    begin
      showmessage(FM031 + '는 숫자로만 등록해주세요.');
      Exit;
    end;
    (*if Length(sg_Employ.Cells[7,i]) > 14 then
    begin
      showmessage(FM103 +'는 14자리 이내입니다.');
      Exit;
    end;
    if Length(sg_Employ.Cells[8,i]) > 14 then
    begin
      showmessage('집전화번호는 14자리 이내입니다.');
      Exit;
    end;
    if Length(sg_Employ.Cells[9,i]) > 14 then
    begin
      showmessage('핸드폰번호는 14자리 이내입니다.');
      Exit;
    end; *)
    if Length(sg_Employ.Cells[10,i]) > 7 then
    begin
      showmessage('우편번호는 7자리 이내입니다.');
      Exit;
    end;
    if Length(sg_Employ.Cells[11,i]) > 50 then
    begin
      showmessage('집주소1는 50자리 이내입니다.');
      Exit;
    end;
    if Length(sg_Employ.Cells[12,i]) > 50 then
    begin
      showmessage('집주소2는 50자리 이내입니다.');
      Exit;
    end;
    sg_Employ.Cells[12,i] :=  stringReplace(sg_Employ.Cells[12,i],'-','',[rfReplaceAll]);
    if Length(sg_Employ.Cells[13,i]) > 8 then
    begin
      showmessage(FM104 + '은 8자리 이내입니다.');
      Exit;
    end;
    sg_Employ.Cells[13,i] :=  stringReplace(sg_Employ.Cells[12,i],'-','',[rfReplaceAll]);
    if Length(sg_Employ.Cells[14,i]) > 8 then
    begin
      showmessage(FM105 + '은 8자리 이내입니다.');
      Exit;
    end;
(*    if Length(sg_Employ.Cells[15,i]) > 100 then
    begin
      showmessage('사진위치는은 100자리 이내입니다.');
      Exit;
    end;
*)
  end;
  result := True;
end;

function TfmBatchEmployee.EmployeeInsert: Boolean;
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
  stJoinDate : string;
  stRetireDate : string;
  stTemp1 : string;
  stTemp2 : string;
  stTemp3 : string;
  stTemp4 : string;
begin
  result := False;
  DataModule1.ADOConnection.BeginTrans;
  for i := 1 to sg_Employ.RowCount - 1 do
  begin
    stCompanyCode := Trim(sg_Employ.Cells[0,i]);
    stJijumCode := Trim(sg_Employ.Cells[4,i]);
    stDepartCode := Trim(sg_Employ.Cells[5,i]);
    stEmCode := Trim(sg_Employ.Cells[1,i]);
    stPosiCode := Trim(sg_Employ.Cells[6,i]);
    stJoinDate := Trim(sg_Employ.Cells[13,i]);
    stCardNo := Trim(sg_Employ.Cells[3,i]);
    if stJoinDate = '' then stJoinDate := FormatDateTime('yyyymmdd',now);
    stRetireDate := Trim(sg_Employ.Cells[14,i]);
    if stRetireDate = '' then stRetireDate := '99991231';

    stTemp1 :=Trim(sg_Employ.Cells[7,i]);
    stTemp2 :=Trim(sg_Employ.Cells[8,i]);
    stTemp3 :=Trim(sg_Employ.Cells[9,i]);
    stTemp4 :=Trim(sg_Employ.Cells[15,i]);
    if Length(stTemp1) > 14 then stTemp1 := copy(stTemp1,1,14);
    if Length(stTemp2) > 14 then stTemp2 := copy(stTemp2,1,14);
    if Length(stTemp3) > 14 then stTemp3 := copy(stTemp3,1,14);
    if Length(stTemp4) > 100 then stTemp4 := copy(stTemp4,1,100);

    if Not IsDigit(stCompanyCode) then stCompanyCode := '1';
    if Not IsDigit(stJijumCode) then stJijumCode := '0';
    if Not IsDigit(stDepartCode) then stDepartCode := '0';
    if Not IsDigit(stPosiCode) then stPosiCode := '0';
    stCompanyCode := FillZeroNumber(strtoint(stCompanyCode),3);
    stJijumCode := FillZeroNumber(strtoint(stJijumCode),3);
    stDepartCode := FillZeroNumber(strtoint(stDepartCode),3);
    stPosiCode := FillZeroNumber(strtoint(stPosiCode),3);

    if stEmCode = '' then continue;

    if stCardNo <> '' then
    begin
      if (Length(stCardNo) < 11) and isDigit(stCardno) and (L_nInputCardType < 1) then
      begin
        if CARDLENGTHTYPE = 1 then
        begin
          stCardNo := Dec2Hex64(strtoint64(stCardno),8);
          stCardNo := FillCharString(stCardNo,'*',16);
        end else if CARDLENGTHTYPE = 2 then   //KT사옥용
        begin
          stCardNo := Dec2Hex64(strtoint64(stCardno),8);
          stCardNo := stCardNo + '0**';
        end;
      end else if (Length(stCardno) = 11) and (L_nInputCardType < 2) then
      begin
        L_nInputCardType := 1;
        if CARDLENGTHTYPE = 0 then
        begin
          stCardNo := copy(stCardNo,1,8);
          stCardNo := FillZeroNumber(Hex2Dec64(stCardNo),10);
        end else if CARDLENGTHTYPE = 1 then   //가변길이
        begin
          //stCardNo := copy(stCardNo,1,8);
          stCardNo := FillCharString(stCardNo,'*',16);
        end;
      end else
      begin
        L_nInputCardType := 3;
        if Length(stCardNo) < 8 then
        begin
          stCardNo := FillZeroStrNum(stCardNo,8);
        end;
        stCardNo := FillCharString(stCardNo,'*',16);
        if CARDLENGTHTYPE = 0 then
        begin
          stCardNo := copy(stCardNo,1,8);
          stCardNo := FillZeroNumber(Hex2Dec64(stCardNo),10);
        end else if CARDLENGTHTYPE = 1 then   //가변길이
        begin
          //stCardNo := copy(stCardNo,1,8);
          stCardNo := FillCharString(stCardNo,'*',16);
        end else if CARDLENGTHTYPE = 2 then   //KT사옥용
        begin
          stCardNo := copy(stCardNo,1,8);
          stCardNo := stCardNo + '0**';
        end;  
      end;
    end;

    stfdmsID := GetFdmsID;

    StatusBar1.Panels[0].Text := inttostr(i) + '/' + inttostr(sg_Employ.RowCount - 1) + FM106 +'정보 입력중...';
    if Not CheckTB_EMPLOYEE(stCompanyCode,stEmCode) then
    begin
      InsertIntoTB_EMPLOYEE(stEmCode,copy(Trim(sg_Employ.Cells[2,i]),1,100),
                            stCompanyCode,stJijumCode,stDepartCode,
                            stPosiCode,stTemp1,
                            stJoinDate,stRetireDate,copy(Trim(sg_Employ.Cells[10,i]),1,7),
                            copy(Trim(sg_Employ.Cells[11,i]),1,50),copy(Trim(sg_Employ.Cells[12,i]),1,50),
                            stTemp2,stTemp3,
                            stfdmsID,stCardNo,stTemp4);
    end else
    begin
      UpdateTB_EMPLOYEE(stEmCode,copy(Trim(sg_Employ.Cells[2,i]),1,100),
                            stCompanyCode,stJijumCode,stDepartCode,
                            stPosiCode,Trim(sg_Employ.Cells[7,i]),
                            stJoinDate,stRetireDate,copy(Trim(sg_Employ.Cells[10,i]),1,7),
                            copy(Trim(sg_Employ.Cells[11,i]),1,50),copy(Trim(sg_Employ.Cells[12,i]),1,50),
                            stTemp2,stTemp3,
                            stCardNo,stTemp4);
    end;
    {
    stSql := ' insert Into TB_EMPLOYEE ';
    stSql := stSql + '( ';
    stSql := stSql + 'GROUP_CODE,';
    stSql := stSql + 'EM_CODE,';
    stSql := stSql + 'CO_COMPANYCODE,';
    stSql := stSql + 'CO_JIJUMCODE,';
    stSql := stSql + 'CO_DEPARTCODE,';
    stSql := stSql + 'PO_POSICODE,';    Trim(sg_Employ.Cells[6,i])
    stSql := stSql + 'EM_NAME,';        Trim(sg_Employ.Cells[2,i])
    stSql := stSql + 'EM_COPHONE,';     Trim(sg_Employ.Cells[7,i])
    stSql := stSql + 'EM_HOMEPHONE,';   Trim(sg_Employ.Cells[8,i])
    stSql := stSql + 'EM_HANDPHONE,';   Trim(sg_Employ.Cells[9,i])
    stSql := stSql + 'ZI_ZIPCODE,';     Trim(sg_Employ.Cells[10,i])
    stSql := stSql + 'EM_ADDR1,';       Trim(sg_Employ.Cells[11,i])
    stSql := stSql + 'EM_ADDR2,';       Trim(sg_Employ.Cells[12,i])
    stSql := stSql + 'EM_JOINDATE,';    Trim(sg_Employ.Cells[13,i])
    stSql := stSql + 'EM_RETIREDATE,';  Trim(sg_Employ.Cells[14,i])
    if FileExists(Trim(sg_Employ.Cells[15,i])) then
    begin
      stSql := stSql + 'EM_IMAGE,';
    end;
    stSql := stSql + 'FDMS_ID,';
    stSql := stSql + 'FDMS_RELAY,';
    stSql := stSql + 'EM_UPDATETIME, ';
    stSql := stSql + 'RG_CODE ) ';
    stSql := stSql + ' VALUES (';
    stSql := stSql + '''' + GROUPCODE + ''', ';
    stSql := stSql + '''' + Trim(sg_Employ.Cells[1,i]) + ''', ';
    stSql := stSql + '''' + stCompanyCode + ''', ';
    stSql := stSql + '''' + stJijumCode + ''', ';
    stSql := stSql + '''' + stDepartCode + ''', ';
    stSql := stSql + '''' + Trim(sg_Employ.Cells[6,i]) + ''', ';
    stSql := stSql + '''' + Trim(sg_Employ.Cells[2,i]) + ''', ';
    stSql := stSql + '''' + Trim(sg_Employ.Cells[7,i]) + ''', ';
    stSql := stSql + '''' + Trim(sg_Employ.Cells[8,i]) + ''', ';
    stSql := stSql + '''' + Trim(sg_Employ.Cells[9,i]) + ''', ';
    stSql := stSql + '''' + Trim(sg_Employ.Cells[10,i]) + ''', ';
    stSql := stSql + '''' + Trim(sg_Employ.Cells[11,i]) + ''', ';
    stSql := stSql + '''' + Trim(sg_Employ.Cells[12,i]) + ''', ';
    stSql := stSql + '''' + Trim(sg_Employ.Cells[13,i]) + ''', ';
    stSql := stSql + '''' + Trim(sg_Employ.Cells[14,i]) + ''', ';
    if FileExists(Trim(sg_Employ.Cells[15,i])) then
    begin
      stSql := stSql + ':EM_IMAGE,';
    end;
    stSql := stSql + stfdmsID + ',';
    stSql := stSql + '''N'',';
    stSql := stSql + '''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''', ';
    stSql := stSql + '''001'') ';

    with DataModule1.ADOExecQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;
      if FileExists(Trim(sg_Employ.Cells[15,i])) then
      begin
        if DBTYPE = 'MSSQL' then Parameters.ParamByName( 'EM_IMAGE' ).LoadFromFile( Trim(sg_Employ.Cells[14,i]), ftGraphic )
        else Parameters.ParamByName( 'EM_IMAGE' ).Value := Trim(sg_Employ.Cells[15,i]) ;
      end;

      Try
        ExecSQL;
      Except
        //DataModule1.ADOConnection.RollbackTrans;
        //Exit;
        Continue;
      End;
      stSql := CommonSql.InsertIntoTB_EMPHIS(stCompanyCode,Trim(sg_Employ.Cells[1,i]),stfdmsID,'1',Trim(sg_Employ.Cells[3,i]),'1');//입력
      result := DataModule1.ProcessExecSQL(stSql);

    end;
{    if Length(stCardNo) <> 0 then
    begin
      if (CARDLENGTHTYPE = 0) and IsNumericCardNo then
          stCardNo := FillZeroStrNum(stCardNo,10);
    end;  }
    if stCardNo <> '' then
    begin
      if DUPCARDTYPE = 0 then //1인당 카드 한장만 사용시
      begin
        if CheckTB_CARDEmployeeNo(stCompanyCode,stEmCode) then
        begin
          DeleteTB_CARDEmployeeNo(stCompanyCode,stEmCode,stCardNo);
        end;
      end;
      if Not CheckTB_CARD(stCardNo) then
      begin
        InsertTB_CARD(stCardNo,'1','1',stEmCode,stCompanyCode);
      end else
      begin
        UpdateTB_CARD(stCardNo,'1','1',stEmCode,stCompanyCode);
      end;
      {
      if Not InsertTB_CARD(stCardNo,'1','1',Trim(sg_Employ.Cells[1,i]),Trim(sg_Employ.Cells[0,i])) then
      begin
        //showmessage(sg_Employ.Cells[3,i] + ' 카드번호 등록에 실패했습니다. ');
        //DataModule1.ADOConnection.RollbackTrans;
        //Exit;
        Continue;
      end;  }
    end;
    Application.ProcessMessages;

  end;
  DataModule1.ADOConnection.CommitTrans;

  result := True;
end;

function TfmBatchEmployee.CheckCardNo(aCardNo: string; var aCompany,
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

procedure TfmBatchEmployee.btn_DeleteClick(Sender: TObject);
var
  stMsg:string;
  stSql : string;
begin
    stMsg := '일괄삭제 작업 시 DB에 저장된 모든 데이터가 삭제 됩니다. 삭제 하시겠습니까?' ;
    if (Application.MessageBox(PChar(stMsg),'경고',MB_OKCANCEL) = ID_CANCEL)  then Exit;
    DeleteTB_EMPLOYEEAll;
    //stSql := 'Delete from TB_EMPLOYEE ';
    //DataModule1.ProcessExecSQL(stSql);
    stSql := 'Delete From TB_CARD ';
    DataModule1.ProcessExecSQL(stSql);
    stSql := 'Update TB_DEVICECARDNO set DE_PERMIT = ''N'',DE_RCVACK = ''N'' ';
    DataModule1.ProcessExecSQL(stSql);
    GridInitialize(sg_Employ);
    btn_SearchClick(self);

end;

procedure TfmBatchEmployee.btn_SearchClick(Sender: TObject);
var
  stSql :string;
  nRow : integer;
  i : integer;
begin
  GridInitialize(sg_Employ);
  stSql := ' select a.*,b.CA_CARDNO ';
  stSql := stSql + ' From TB_EMPLOYEE a ';
  stSql := stSql + ' Left Join TB_CARD b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.EM_CODE = b.EM_CODE )';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';

  if (Not IsMaster) and (CompanyGrade <> '0') then
  begin
    if CompanyGrade = '1' then
    begin
      if cmb_Company.ItemIndex < 1 then
      begin
        if CompanyCodeList.Count < 2 then
        begin
          showmessage('조회할수 있는 권한이 없습니다.');
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
          showmessage('조회할수 있는 권한이 없습니다.');
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
          showmessage('조회할수 있는 권한이 없습니다.');
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

  stSql := stSql + ' order by a.EM_CODE ';
  
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
    sg_Employ.RowCount := recordCount + 1;
    nRow := 1;
    while Not Eof do
    begin
      with sg_Employ do
      begin
        Cells[0,nRow] := FindField('CO_COMPANYCODE').AsString;
        Cells[1,nRow] := FindField('EM_CODE').AsString;
        Cells[2,nRow] := FindField('EM_NAME').AsString;
        Cells[3,nRow] := FindField('CA_CARDNO').AsString;
        Cells[4,nRow] := FindField('CO_JIJUMCODE').AsString;
        Cells[5,nRow] := FindField('CO_DEPARTCODE').AsString;
        Cells[6,nRow] := FindField('PO_POSICODE').AsString;
        Cells[7,nRow] := FindField('EM_COPHONE').AsString;
        Cells[8,nRow] := FindField('EM_HOMEPHONE').AsString;
        Cells[9,nRow] := FindField('EM_HANDPHONE').AsString;
        Cells[10,nRow] := FindField('ZI_ZIPCODE').AsString;
        Cells[11,nRow] := FindField('EM_ADDR1').AsString;
        Cells[12,nRow] := FindField('EM_ADDR2').AsString;
        Cells[13,nRow] := FindField('EM_JOINDATE').AsString;
        Cells[14,nRow] := FindField('EM_RETIREDATE').AsString;
        Cells[15,nRow] := FindField('EM_IMAGE').AsString;
        Cells[15,nRow] := stringReplace(Cells[15,nRow],'\\','\',[rfReplaceAll]);
      end;
      inc(nRow);
      Next;
    end;
  end;

end;

procedure TfmBatchEmployee.CommandArrayCommandsTCommand1Execute(
  Command: TCommand; Params: TStringList);
var
  stCardNo : string;
  stNodeNo : string;
  stECUID : string;
  stDOORNO : string;
  stDoorCode :string;
  stCompany,stEmpNo : string;
  stMsg : string;
begin
//  if rg_CardReader.ItemIndex <> 1 then Exit;
  if cmb_ComPort.ItemIndex < 1 then Exit;
  stCardNo := Params.Values['CARDNO'];
  stNodeNo  := Params.Values['NODENO'];
  stECUID := Params.Values['ECUID'];
  stDOORNO  := Params.Values['DOORNO'];
  stDoorCode := DoorCodeList.Strings[cmb_ComPort.itemIndex];
  if strtoint(stNodeNo) <> strtoint(copy(stDoorCode,1,3)) then Exit;
  if stECUID <> copy(stDoorCode,4,2) then Exit;
  if stDoorNo <> copy(stDoorCode,6,1) then Exit;
  //showmessage(stCardNo);
  with sg_Employ do
  begin
    if CheckCardNo(stCardNo,stCompany,stEmpNo) then
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
          stCardNo + ') 으로 변경하시겠습니까? ' ;
      if Trim(Cells[3,row]) <> stCardNo then
      begin
        if (Application.MessageBox(PChar(stMsg),'변경',MB_OKCANCEL) = ID_CANCEL)  then Exit;
        DeleteTB_CARD(Trim(Cells[3,row]));
        UpdateTB_ACCESSEVENTCARDNO(Trim(Cells[3,row]),stCardNo);
        UpdateTB_ATEVENTCARDNO(Trim(Cells[3,row]),stCardNo);
        UpdateTB_FoodEventCARDNO(Trim(Cells[3,row]),stCardNo);

      end;
    end;
    Cells[3,row] := stCardNo;
    if Not InsertTB_CARD(stCardNo,'1','1',Trim(Cells[1,row]),Trim(Cells[0,row])) then
    begin
      showmessage('카드데이터 입력에 실패 했습니다.');
      Exit;
    end;
    if (row + 1 < rowCount) then
    begin
      SelectRange(3,3,row + 1,row + 1);
    end;
  end;
end;

procedure TfmBatchEmployee.FormShow(Sender: TObject);
var
  stCompanyCode : string;
  stJijumCode : string;
  nIndex : integer;
begin
  if Not IsMaster then
  begin
    if IsInsertGrade then btn_EmployInsert.Enabled := True
    else btn_EmployInsert.Enabled := False;
    if IsUpdateGrade then chk_CardReg.Enabled := True
    else chk_CardReg.Enabled := False;
    if IsDeleteGrade then btn_Delete.Enabled := True
    else btn_Delete.Enabled := False;
  end;

  LoadCompanyCode(CompanyCodeList,cmb_Company);
  stCompanyCode := '000';
  stJijumCode := '000';
  if cmb_Company.ItemIndex > 0 then stCompanyCode := CompanyCodeList.Strings[cmb_Company.ItemIndex];
  LoadJijumCode(stCompanyCode,JijumCodeList,cmb_Jijum);
  if cmb_Jijum.ItemIndex > 0 then stJijumCode := copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3);
  LoadDepartCode(stCompanyCode,stJijumCode,DepartCodeList,cmb_Depart);
  LoadPosiCode(stCompanyCode,PosiCodeList,cmb_Posi);
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

end;

procedure TfmBatchEmployee.btn_BackupClick(Sender: TObject);
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

procedure TfmBatchEmployee.FormActivate(Sender: TObject);
begin
  FormNameSet;
  Panel6.Caption := fmBatchEmployee.Caption;
  btn_SearchClick(self);

end;

procedure TfmBatchEmployee.FormNameSet;
begin
  with sg_Employ do
  begin
    Cells[0,0] := FM001;
    Cells[1,0] := FM101;
    Cells[2,0] := FM102;
    Cells[4,0] := FM011;
    Cells[5,0] := FM021;
    Cells[6,0] := FM031;
    Cells[7,0] := FM103;
    Cells[13,0] := FM104;
    Cells[14,0] := FM105;
  end;
  lb_CompanyName.Caption := FM002;
  lb_JijumName.Caption := FM012;
  lb_DepartName.Caption := FM022;
  lb_PosiName.Caption := FM032;
end;

function TfmBatchEmployee.DeleteTB_EMPLOYEEAll: Boolean;
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

function TfmBatchEmployee.GetEmployeeFdmsID(aCompanyCode,
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

function TfmBatchEmployee.GetFdmsID: string;
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

procedure TfmBatchEmployee.cmb_CompanyChange(Sender: TObject);
begin
  LoadJijumCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],JijumCodeList,cmb_Jijum);
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
  LoadPosiCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],PosiCodeList,cmb_Posi);
  btn_SearchClick(self);
end;

procedure TfmBatchEmployee.cmb_JijumChange(Sender: TObject);
begin
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
  btn_SearchClick(self);
end;

procedure TfmBatchEmployee.cmb_DepartChange(Sender: TObject);
begin
  btn_SearchClick(self);

end;

procedure TfmBatchEmployee.cmb_PosiChange(Sender: TObject);
begin
  btn_SearchClick(self);

end;

function TfmBatchEmployee.InsertIntoTB_EMPLOYEE(aEmpID, aEmpNM,
  aCompanyCode, aJijumCode,aDepartCode, aPosiCode, aCompanyPhone, aJoinDate,
  aRetireDate, aZipcode, aAddr1, aAddr2, aHomePhone, aHandphone, afdmsID,
  aCardNo, aEmpImg: string): Boolean;
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
    stSql := stSql + '''001'') ';

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

    stSql := CommonSql.InsertIntoTB_EMPLOYEECHANGE(aCompanyCode,aEmpID,aCardNo,'BatchEmployee','1');
    DataModule1.ProcessExecSQL(stSql);
end;



function TfmBatchEmployee.CheckTB_CARDEmployeeNo(aCompanyCode,
  aEmCode: string): Boolean;
var
  stSql :string;
begin
  result := False;
  stSql := 'select * from TB_CARD ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';
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
  end;
  result := True;
end;

function TfmBatchEmployee.DeleteTB_CARDEmployeeNo(aCompanyCode,
  aEmCode,aCardNo: String): Boolean;
var
  stSql : string;
  bResult : Boolean;
  TempQuery :TADOQuery;
begin
  Result := False;

  stSql := 'select * from TB_CARD ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' +  aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' +  aEmCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' +  aEmCode + ''' ';
  stSql := stSql + ' AND CA_CARDTYPE = ''1'' ';  //등록된 카드중
  
  Try
    //FCS.Enter;
    CoInitialize(nil);
    TempQuery := TADOQuery.Create(nil);
    TempQuery.Connection := DataModule1.ADOConnection;
    TempQuery.DisableControls;
    //if DBTYPE = 'MDB' then ADOConnection.BeginTrans;
    with TempQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      While not Eof do
      begin
        if FindField('CA_CARDNO').AsString <> aCardNo then
        begin
           DeleteTB_DEVICECARDNO(aCardNo); //신규 카드는 삭제 함
           UpdateTB_DEVICECARDNO_CardNoChange(FindField('CA_CARDNO').AsString,aCardNo); //모든 카드 권한을 삭제 처리
        end;
        Next;
      end;
    end;
  Finally
    TempQuery.EnableControls;
    TempQuery.Free;
    CoUninitialize;
  End;


  stSql := 'Delete From TB_CARD ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' +  aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' +  aEmCode + ''' ';
  stSql := stSql + ' AND CA_CARDNO <> ''' + aCardNo + ''' ';
  stSql := stSql + ' AND CA_CARDTYPE = ''1'' ';  //등록된 카드중

  result := DataModule1.ProcessExecSQL(stSql);
end;


function TfmBatchEmployee.DeleteTB_DEVICECARDNO(aCardNo: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Delete From TB_DEVICECARDNO ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmBatchEmployee.UpdateTB_DEVICECARDNO_CardNoChange(aOldCardNo,
  aNewCardNo: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_DEVICECARDNO set CA_CARDNO = ''' + aNewCardNo + ''',DE_RCVACK = ''N'' ';
  stSql := stSql + ' Where CA_CARDNO = ''' + aOldCardNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

initialization
  RegisterClass(TfmBatchEmployee);
Finalization
  UnRegisterClass(TfmBatchEmployee);

end.
