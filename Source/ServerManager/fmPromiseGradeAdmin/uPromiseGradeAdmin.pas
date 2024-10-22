unit uPromiseGradeAdmin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, Grids, BaseGrid, AdvGrid, StdCtrls, Buttons,
  AdPort, OoMisc, AdPacket,WinSpool, uSubForm, CommandArray, Gauges, AdvObj;

type
  TfmPromiseGradeAdmin = class(TfmASubForm)
    Panel3: TPanel;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label21: TLabel;
    cmb_Company: TComboBox;
    cmb_Depart: TComboBox;
    cmb_Posi: TComboBox;
    ed_EmpNo: TEdit;
    ed_EmpNM: TEdit;
    btn_Search: TBitBtn;
    ed_CardNo: TEdit;
    chk_NonGrade: TCheckBox;
    sg_Card: TAdvStringGrid;
    StatusBar1: TStatusBar;
    Splitter1: TSplitter;
    Panel1: TPanel;
    Panel2: TPanel;
    PageControl1: TPageControl;
    DoorTab: TTabSheet;
    Panel6: TPanel;
    sg_Door: TAdvStringGrid;
    AlarmTab: TTabSheet;
    Panel7: TPanel;
    sg_Alarm: TAdvStringGrid;
    FoodTab: TTabSheet;
    Panel11: TPanel;
    sg_Food: TAdvStringGrid;
    Panel4: TPanel;
    Label6: TLabel;
    cmb_PromiseGrade: TComboBox;
    btn_PromiseSet: TBitBtn;
    Panel12: TPanel;
    cmb_Jijum: TComboBox;
    Label7: TLabel;
    btn_Close: TBitBtn;
    Pan_Gauge: TPanel;
    Gauge1: TGauge;
    StaticText1: TStaticText;
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmb_CompanyChange(Sender: TObject);
    procedure cmb_DepartChange(Sender: TObject);
    procedure cmb_PosiChange(Sender: TObject);
    procedure chk_NonGradeClick(Sender: TObject);
    procedure sg_CardCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure cmb_PromiseGradeChange(Sender: TObject);
    procedure btn_PromiseSetClick(Sender: TObject);
    procedure sg_DoorCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure cmb_JijumChange(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    CompanyCodeList : TStringList;
    JijumCodeList : TStringList;
    DepartCodeList : TStringList;
    PosiCodeList : TStringList;
    ComPortList : TStringList;
    CheckCount : integer;
    { Private declarations }
    //procedure LoadCompanyCode(cmb_Box:TComboBox);
    //procedure LoadDepartCode(aCompanyCode:string;cmb_Box:TComboBox);
    //procedure LoadPosiCode(cmb_Box:TComboBox);
    Procedure RcvCardDataByReader(aData:String);
    procedure GridInit(sg:TAdvStringGrid;aCol:integer);
    procedure GetDepartCodeList;
    function GetSerialPortList(List : TStringList; const doOpenTest : Boolean = True) : LongWord;
    function EncodeCommportName(PortNum : WORD) : String;
    function DecodeCommportName(PortName : String) : WORD;
    procedure AdvStrinGridSetAllCheck(Sender: TObject;bchkState:Boolean);
    procedure LoadPromiseCode;
    procedure SetGrade;
    procedure SetDoorGrid;
    procedure SetAlarmGrid;
    procedure SetFoodGrid;
    procedure InsertPromiseGrade;
    Function UpdateTB_DEVICECARDNOExist(aCardNO,aPromiseGrade:string):Boolean;
    Function InsertTB_DEVICECARDNONotExist(aCardNO,aPromiseGrade:string):Boolean;
    Function UpdateTB_CARDDOORGRADE(aCardNo,aDoorGrade:string):Boolean;
    procedure CenterPanel;

  public
    { Public declarations }
  end;

var
  fmPromiseGradeAdmin: TfmPromiseGradeAdmin;

implementation
uses
  uDataModule1,
  uLomosUtil,
  uCompanyCodeLoad,
  uMssql,
  uPostGreSql,
  uMDBSql, uFireBird, udmAdoQuery;
{$R *.dfm}

procedure TfmPromiseGradeAdmin.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmPromiseGradeAdmin.btn_SearchClick(Sender: TObject);
var
  stSql : string;
  nRow : integer;
  i : integer;
begin
  GridInit(sg_Card,7);
  CheckCount := 0;
  if DBType = 'MSSQL' then stSql := MSSQL.SelectTB_CARDAdminJoinBase
  else if DBTYPE = 'PG' then stSql := PostGreSql.SelectTB_CARDAdminJoinBase
  else if DBType = 'MDB' then stSql := MDBSql.SelectTB_CARDAdminJoinBase
  else if DBType = 'FB' then stSql := FireBird.SelectTB_CARDAdminJoinBase
  else Exit;

  if Length(ed_CardNo.Text) > 0 then
    stSql := stSql + ' AND a.CA_CARDNO = ''' + Trim(ed_CardNo.Text)  + ''' ' ;

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
          if i = 1 then stSql := stSql + ' AND ( '
          else stSql := stSql + ' OR ';
          stSql := stSql + ' b.CO_COMPANYCODE = ''' + CompanyCodeList.Strings[i] + ''' ';
        end;
        stSql := stSql + ')'; 
      end else stSql := stSql + ' AND b.CO_COMPANYCODE = ''' + CompanyCodeList.Strings[cmb_Company.ItemIndex] + ''' ';
      if cmb_Jijum.ItemIndex > 0 then stSql := stSql + ' AND b.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3) + ''' ';
      if cmb_Depart.ItemIndex > 0 then stSql := stSql + ' AND b.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],7,3) + ''' ';
    end else if CompanyGrade = '2' then
    begin
      if cmb_Company.ItemIndex < 1 then
      begin
        showmessage('관리자 소속 회사코드가 이상합니다.');
        Exit;
      end;
      stSql := stSql + ' AND b.CO_COMPANYCODE = ''' + CompanyCodeList.Strings[cmb_Company.ItemIndex] + ''' ';
      if cmb_Jijum.ItemIndex < 1 then
      begin
        if JijumCodeList.Count < 2 then
        begin
          showmessage('관리할수 있는 지점 권한이 없습니다.');
          Exit;
        end;
        for i:= 1 to JijumCodeList.Count - 1 do
        begin
          if i = 1 then stSql := stSql + ' AND ( '
          else stSql := stSql + ' OR ';
          stSql := stSql + ' b.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[i],4,3) + ''' ';
        end;
        stSql := stSql + ')';
      end else stSql := stSql + ' AND b.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3) + ''' ';
      if cmb_Depart.ItemIndex > 0 then stSql := stSql + ' AND b.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],7,3) + ''' ';
    end else if CompanyGrade = '3' then
    begin
      if cmb_Company.ItemIndex < 1 then
      begin
        showmessage('관리자 소속 회사코드가 이상합니다.');
        Exit;
      end;
      stSql := stSql + ' AND b.CO_COMPANYCODE = ''' + CompanyCodeList.Strings[cmb_Company.ItemIndex] + ''' ';
      if cmb_Jijum.ItemIndex < 1 then
      begin
        showmessage('관리자 소속 지점코드가 이상합니다.');
        Exit;
      end;
      stSql := stSql + ' AND b.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3) + ''' ';
      if cmb_Depart.ItemIndex < 1 then
      begin
        if DepartCodeList.Count < 2 then
        begin
          showmessage('관리할수 있는 부서 권한이 없습니다.');
          Exit;
        end;
        for i:= 1 to DepartCodeList.Count - 1 do
        begin
          if i = 1 then stSql := stSql + ' AND ( '
          else stSql := stSql + ' OR ';
          stSql := stSql + ' b.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[i],7,3) + ''' ';
        end;
        stSql := stSql + ')';
      end else stSql := stSql + ' AND b.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],7,3) + ''' ';
    end;
  end else
  begin
    if cmb_Depart.ItemIndex > 0 then
    begin
      stSql := stSql + ' AND b.CO_COMPANYCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],1,3) + ''' ' ;
      stSql := stSql + ' AND b.CO_JIJUMCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],4,3) + ''' ' ;
      stSql := stSql + ' AND b.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],7,3) + ''' ' ;
    end else if cmb_Jijum.ItemIndex > 0 then
    begin
      stSql := stSql + ' AND b.CO_COMPANYCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3) + ''' ' ;
      stSql := stSql + ' AND b.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3) + ''' ' ;
    end else if cmb_Company.ItemIndex > 0 then
    begin
      stSql := stSql + ' AND b.CO_COMPANYCODE = ''' + CompanyCodeList.Strings[cmb_Company.ItemIndex] + ''' ' ;
    end;
  end;
  if cmb_Posi.ItemIndex > 0 then
    stSql := stSql + ' AND b.PO_POSICODE = ''' + copy(PosiCodeList.Strings[cmb_Posi.ItemIndex],4,3) + ''' ';
  if Trim(ed_EmpNo.Text) <> '' then
    stSql := stSql + ' AND b.EM_CODE = ''' + Trim(ed_EmpNo.Text)  + ''' ';
  if Trim(ed_EmpNM.Text) <> '' then
    stSql := stSql + ' AND b.EM_NAME LIKE ''' + Trim(ed_EmpNM.Text)  + '%'' ';

  if chk_NonGrade.Checked then
  begin
    stSql := stSql + ' AND a.CA_DOORGRADE <> ''Y'' ';
    //stSql := stSql + ' AND NOT EXISTS (SELECT CA_CARDNO FROM TB_DEVICECARDNO G WHERE G.CA_CARDNO = a.CA_CARDNO AND G.GROUP_CODE = a.GROUP_CODE ) ';
  end;
  stSql := stSql + ' order by a.CA_CARDNO ';


  with DataModule1.GetObject.ADOTmpQuery do
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
    sg_Card.RowCount := RecordCount + 1;
    nRow := 1;
    First;
    while Not Eof do
    begin
      with sg_Card do
      begin
        cells[0,nRow] := FindField('CO_COMPANYNAME').AsString;
        cells[1,nRow] := FindField('EM_CODE').AsString;
        cells[2,nRow] := FindField('EM_NAME').AsString;
        cells[3,nRow] := FindField('CA_CARDNO').AsString;
        cells[4,nRow] := FindField('CO_JIJUMNAME').AsString;
        cells[5,nRow] := FindField('CO_DEPARTNAME').AsString;
        cells[6,nRow] := FindField('PO_NAME').AsString;
        cells[7,nRow] := FindField('CO_COMPANYCODE').AsString;
        cells[8,nRow] := FindField('CO_JIJUMCODE').AsString;
        cells[9,nRow] := FindField('CO_DEPARTCODE').AsString;
        cells[10,nRow] := FindField('PO_POSICODE').AsString;
        AddCheckBox(0,nRow,False,False);

      end;
      nRow := nRow + 1;
      Next;
    end;
  end;
end;

procedure TfmPromiseGradeAdmin.RcvCardDataByReader(aData: String);
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

  bCardNo:= Hex2Dec64(aData);
  aCardNo:= FillZeroNumber2(bCardNo,10);

  ed_CardNo.Text := aCardNo;

  if G_nSearchIndex = 0 then btn_SearchClick(Self);

end;

procedure TfmPromiseGradeAdmin.FormShow(Sender: TObject);
begin
  LoadPromiseCode;
  if Not FoodUse then FoodTab.TabVisible := False;
  if PatrolUse then
  begin
    AlarmTab.TabVisible := True;
  end else
  begin
    AlarmTab.TabVisible := False;
  end;


end;


procedure TfmPromiseGradeAdmin.FormCreate(Sender: TObject);
begin
    CompanyCodeList := TStringList.Create;
    JijumCodeList := TStringList.Create;
    DepartCodeList := TStringList.Create;
    PosiCodeList := TStringList.Create;
    ComPortList := TStringList.Create;
end;

procedure TfmPromiseGradeAdmin.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    CompanyCodeList.Free;
    JijumCodeList.Free;
    DepartCodeList.Free;
    PosiCodeList.Free;
    ComPortList.Free;
end;

procedure TfmPromiseGradeAdmin.GetDepartCodeList;
var
  stSql : String;
begin
  DepartCodeList.Clear;
  DepartCodeList.Add('');

  if Not IsMaster then
  begin
    stSql := 'Select * from ';
    stSql := stSql + ' TB_ADMINCOMPANY  ';
    stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND AD_USERID = ''' + Master_ID + ''' ';
    stSql := stSql + ' AND CO_GUBUN = ''2'' ';
  end else
  begin
    stSql := 'Select * from ';
    stSql := stSql + ' TB_COMPANY  ';
    stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND CO_GUBUN = ''2'' ';
  end;

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
    First;
    While Not Eof do
    begin
      DepartCodeList.Add(FindField('CO_COMPANYCODE').AsString + FindField('CO_DEPARTCODE').AsString);
      Next;
    end;
  end;
end;

function TfmPromiseGradeAdmin.GetSerialPortList(List: TStringList;
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

function TfmPromiseGradeAdmin.DecodeCommportName(PortName: String): WORD;
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

function TfmPromiseGradeAdmin.EncodeCommportName(PortNum: WORD): String;
begin
 if PortNum < 10
    then Result := 'COM' + IntToStr(PortNum) + ':'
    else Result := '\\.\COM'+IntToStr(PortNum);

end;

procedure TfmPromiseGradeAdmin.cmb_CompanyChange(Sender: TObject);
begin
  LoadJijumCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],JijumCodeList,cmb_Jijum);
  LoadDepartCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],'',DepartCodeList,cmb_Depart);
  LoadPosiCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],PosiCodeList,cmb_Posi);
  if G_nSearchIndex = 0 then btn_SearchClick(Self);
end;

procedure TfmPromiseGradeAdmin.cmb_DepartChange(Sender: TObject);
begin
  if G_nSearchIndex = 0 then btn_SearchClick(Self);
end;

procedure TfmPromiseGradeAdmin.cmb_PosiChange(Sender: TObject);
begin
  if G_nSearchIndex = 0 then btn_SearchClick(Self);
end;

procedure TfmPromiseGradeAdmin.chk_NonGradeClick(Sender: TObject);
begin
  if G_nSearchIndex = 0 then btn_SearchClick(Self);
end;

procedure TfmPromiseGradeAdmin.sg_CardCheckBoxClick(Sender: TObject; ACol,
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

procedure TfmPromiseGradeAdmin.AdvStrinGridSetAllCheck(Sender: TObject;
  bchkState: Boolean);
var
  i : integer;
begin
    for i:= 1 to (Sender as TAdvStringGrid).RowCount - 1  do
    begin
      (Sender as TAdvStringGrid).SetCheckBoxState(0,i,bchkState);
    end;
end;

procedure TfmPromiseGradeAdmin.LoadPromiseCode;
var
  stSql :string;
begin
  cmb_PromiseGrade.Clear;
  stSql := 'select PR_NAME from TB_DEVICECARDNO_PROMISE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' Group by PR_NAME ';
  with DataModule1.GetObject.ADOTmpQuery do
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
    While Not Eof do
    begin
      cmb_PromiseGrade.Items.Add(FindField('PR_NAME').AsString);
      Next;
    end;
  end;

end;

procedure TfmPromiseGradeAdmin.SetGrade;
begin
  if cmb_PromiseGrade.Text = '' then Exit;
  SetDoorGrid;
  SetAlarmGrid;
  SetFoodGrid;

end;

procedure TfmPromiseGradeAdmin.SetAlarmGrid;
var
  stSql : string;
  nRow : integer;
  i : integer;
begin
  sg_Alarm.RowCount := 2;
  sg_Alarm.RemoveCheckBox(0,1);
  for i:= 0 to sg_Alarm.ColCount - 1 do
  begin
    sg_Alarm.Cells[i,1] := '';
  end;
  if DBTYPE = 'MDB' then stSql := MDBSql.selectTB_ARMAREAJoinPromiseCode(cmb_PromiseGrade.Text)
  else if DBTYPE = 'PG' then stSql := PostGreSql.selectTB_ARMAREAJoinPromiseCode(cmb_PromiseGrade.Text)
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.selectTB_ARMAREAJoinPromiseCode(cmb_PromiseGrade.Text)
  else if DBTYPE = 'FB' then stSql := FireBird.selectTB_ARMAREAJoinPromiseCode(cmb_PromiseGrade.Text)
  else Exit;

  with DataModule1.GetObject.ADOTmpQuery do
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
    with sg_Alarm do
    begin
      RowCount := RecordCount + 1;
      nRow := 1;
      while Not Eof do
      begin
        cells[0,nRow] := FindField('AR_NAME').AsString;
        cells[1,nRow] := FindField('AC_NODENO').AsString;
        //cells[2,nRow] := FindField('AC_MCUID').AsString;
        cells[3,nRow] := FindField('AC_ECUID').AsString;
        cells[4,nRow] := FillZeroNumber(FindField('AC_NODENO').AsInteger,3) + FindField('AC_ECUID').AsString + inttostr(FindField('AR_AREANO').AsInteger);
        if FindField('DE_PERMIT').AsString = 'L' then
        begin
            if FindField('DE_ALARM' + inttostr(FindField('AR_AREANO').AsInteger)).AsString = 'Y' then AddCheckBox(0,nRow,True,False)
            else AddCheckBox(0,nRow,False,False);
        end else AddCheckBox(0,nRow,False,False);
        nRow := nRow + 1;
        Next;
      end;
    end;
  end;
end;

procedure TfmPromiseGradeAdmin.SetDoorGrid;
var
  stSql : string;
  nRow : integer;
  i : integer;
begin
  sg_Door.RowCount := 2;
  sg_Door.RemoveCheckBox(0,1);
  for i:= 0 to sg_Door.ColCount - 1 do
  begin
    sg_Door.Cells[i,1] := '';
  end;
  if DBTYPE = 'MDB' then stSql := MDBSql.selectTB_DOORJoinPromiseCode(cmb_PromiseGrade.Text)
  else if DBTYPE = 'PG' then stSql := PostGreSql.selectTB_DOORJoinPromiseCode(cmb_PromiseGrade.Text)
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.selectTB_DOORJoinPromiseCode(cmb_PromiseGrade.Text)
  else if DBTYPE = 'FB' then stSql := FireBird.selectTB_DOORJoinPromiseCode(cmb_PromiseGrade.Text)
  else Exit;

  with DataModule1.GetObject.ADOTmpQuery do
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

    with sg_Door do
    begin
      RowCount := RecordCount + 1;
      nRow := 1;
      while Not Eof do
      begin
        cells[0,nRow] := FindField('DO_DOORNONAME').AsString;
        cells[1,nRow] := FindField('AC_NODENO').AsString;
        cells[2,nRow] := FindField('AC_MCUID').AsString;
        cells[3,nRow] := FindField('AC_ECUID').AsString;
        cells[4,nRow] := FindField('DO_DOORNO').AsString;
        if FindField('DO_DOORNO').AsString = '1' then
        begin
          if FindField('DE_PERMIT').AsString = 'L' then
          begin
            if FindField('DE_DOOR1').AsString = 'Y' then AddCheckBox(0,nRow,True,False)
            else AddCheckBox(0,nRow,False,False);
          end else AddCheckBox(0,nRow,False,False);
        end else if FindField('DO_DOORNO').AsString = '2' then
        begin
          if FindField('DE_PERMIT').AsString = 'L' then
          begin
            if FindField('DE_DOOR2').AsString = 'Y' then AddCheckBox(0,nRow,True,False)
            else AddCheckBox(0,nRow,False,False);
          end else AddCheckBox(0,nRow,False,False);
        end;
        nRow := nRow + 1;
        Next;
      end;
    end;
  end;
end;

procedure TfmPromiseGradeAdmin.SetFoodGrid;
var
  stSql : string;
  nRow : integer;
  i : integer;
begin
  sg_Food.RowCount := 2;
  sg_Food.RemoveCheckBox(0,1);
  for i:= 0 to sg_Food.ColCount - 1 do
  begin
    sg_Food.Cells[i,1] := '';
  end;

  if DBTYPE = 'MDB' then stSql := MDBSql.selectTB_FOODJoinPromiseCode(cmb_PromiseGrade.Text)
  else if DBTYPE = 'PG' then stSql := PostGreSql.selectTB_FOODJoinPromiseCode(cmb_PromiseGrade.Text)
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.selectTB_FOODJoinPromiseCode(cmb_PromiseGrade.Text)
  else if DBTYPE = 'FB' then stSql := FireBird.selectTB_FOODJoinPromiseCode(cmb_PromiseGrade.Text)
  else Exit;

  with DataModule1.GetObject.ADOTmpQuery do
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
    with sg_Food do
    begin
      RowCount := RecordCount + 1;
      nRow := 1;
      while Not Eof do
      begin
        cells[0,nRow] := FindField('FO_NAME').AsString;
        cells[1,nRow] := FindField('AC_NODENO').AsString;
        cells[2,nRow] := FindField('AC_MCUID').AsString;
        cells[3,nRow] := FindField('AC_ECUID').AsString;
        cells[4,nRow] := FindField('FO_DOORNO').AsString;
        if FindField('FO_DOORNO').AsString = '1' then
        begin
          if FindField('DE_PERMIT').AsString = 'L' then
          begin
            if FindField('DE_DOOR1').AsString = 'Y' then AddCheckBox(0,nRow,True,False)
            else AddCheckBox(0,nRow,False,False);
          end else AddCheckBox(0,nRow,False,False);
        end else if FindField('FO_DOORNO').AsString = '2' then
        begin
          if FindField('DE_PERMIT').AsString = 'L' then
          begin
            if FindField('DE_DOOR1').AsString = 'Y' then AddCheckBox(0,nRow,True,False)
            else AddCheckBox(0,nRow,False,False);
          end else AddCheckBox(0,nRow,False,False);
        end;
        nRow := nRow + 1;
        Next;
      end;
    end;
  end;
end;

procedure TfmPromiseGradeAdmin.cmb_PromiseGradeChange(Sender: TObject);
begin
  SetGrade;
end;

procedure TfmPromiseGradeAdmin.btn_PromiseSetClick(Sender: TObject);
begin
  if CheckCount < 1 then
  begin
    showmessage('사용자를 선택하여 주세요.');
    Exit;
  end;

  if cmb_PromiseGrade.Text = '' then
  begin
    showmessage('약속권한명이 없습니다.');
    Exit;
 end;

  btn_PromiseSet.Enabled := False;

  Pan_Gauge.Visible := True;
  InsertPromiseGrade;
  dmAdoQuery.NotGradePermitDelete;
  Pan_Gauge.Visible := False;

  btn_PromiseSet.Enabled := True;
  showmessage('약속권한 적용 완료!');
end;

procedure TfmPromiseGradeAdmin.sg_DoorCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
  with (Sender as TAdvStringGrid) do
  begin
    SetCheckBoxState(ACol,ARow,Not State);
  end;
end;

procedure TfmPromiseGradeAdmin.InsertPromiseGrade;
var
  UserLoop,DoorLoop : integer;
  bchkState : Boolean;
  stNodeNo,stECUID,stDoorNO : string;
  stCardNo : string;
  i : integer;
  stTemp : string;
begin
  i:=1;
  Gauge1.MaxValue := CheckCount;
  Gauge1.Progress := 0;
  for UserLoop := 1 to sg_Card.RowCount - 1 do   //체크되어 있는 사용자 모두를 인서트 시킴
  begin
    sg_Card.GetCheckBoxState(0,UserLoop, bchkState);
    if bchkState then  //체크 되어 있으면 권한 등록
    begin
      stCardNo := sg_Card.Cells[3,UserLoop];

      UpdateTB_DEVICECARDNOExist(stCardNO,cmb_PromiseGrade.Text);
      InsertTB_DEVICECARDNONotExist(stCardNO,cmb_PromiseGrade.Text);
      UpdateTB_CARDDOORGRADE(stCardNo,'Y');
      stTemp := cmb_PromiseGrade.Text;
      if Length(stTemp)> 20 then stTemp := copy(stTemp,1,20);
      DataModule1.TB_SYSTEMLOGInsert('0','00',GRADETYPE,'0',stCardNo , stTemp + '그룹권한');

      StatusBar1.Panels[0].Text := inttostr(i) + '/' + inttostr(CheckCount);
      Gauge1.Progress := i;
      inc(i);
      Application.ProcessMessages;
    end;
  end;
end;

function TfmPromiseGradeAdmin.InsertTB_DEVICECARDNONotExist(aCardNO,
  aPromiseGrade: string): Boolean;
var
  stSql : string;
begin
  if Trim(aCardNo) = '' then Exit;
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
    stSql := stSql + ' b.DE_DOOR1, ';
    stSql := stSql + ' b.DE_DOOR2, ';
    stSql := stSql + ' b.DE_USEACCESS, ';
    stSql := stSql + ' b.DE_USEALARM, ';
    stSql := stSql + ' b.DE_TIMECODE, ';
    stSql := stSql + ' b.DE_PERMIT, ';
    stSql := stSql + ' ''N'', ';
    stSql := stSql + ' '''+ formatDateTime('yyyymmddHHMMSS',Now) + ''', ';
    stSql := stSql + ' '''+ Master_ID + ''' ';
    stSql := stSql + ' From TB_DEVICECARDNO_PROMISE B  ';
    stSql := stSql + ' where B.GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND B.PR_NAME = ''' + aPromiseGrade + ''' ';
    stSql := stSql + ' AND NOT EXISTS ';
    stSql := stSql + ' (SELECT * FROM TB_DEVICECARDNO A ';
    stSql := stSql + ' WHERE A.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND A.AC_NODENO = b.AC_NODENO ';
    stSql := stSql + ' AND A.AC_ECUID = b.AC_ECUID  ';
    stSql := stSql + ' AND A.CA_CARDNO = ''' + aCardNO + ''')  ';

    result := False;
    with DataModule1.GetObject.ADOExecQuery do
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
    result := True;
end;

function TfmPromiseGradeAdmin.UpdateTB_DEVICECARDNOExist(aCardNO,
  aPromiseGrade: string): Boolean;
var
  stSql : string;
begin

    if DBTYPE = 'MSSQL' then stSql := MSSQL.UpdateTB_DEVICECARDNOFromPromise(aPromiseGrade,aCardNO)
    else if DBTYPE = 'PG' then stSql := PostGreSql.UpdateTB_DEVICECARDNOFromPromise(aPromiseGrade,aCardNO)
    else if DBTYPE = 'MDB' then stSql := MDBSql.UpdateTB_DEVICECARDNOFromPromise(aPromiseGrade,aCardNO)
    else if DBTYPE = 'FB' then stSql := FireBird.UpdateTB_DEVICECARDNOFromPromise(aPromiseGrade,aCardNO)
    else Exit;


    result := False;
    with DataModule1.GetObject.ADOExecQuery do
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
    result := True;
end;

procedure TfmPromiseGradeAdmin.FormActivate(Sender: TObject);
var
  nIndex : integer;
begin
  LoadCompanyCode(CompanyCodeList,cmb_Company);
  LoadJijumCode(CompanyCodeList.Strings[cmb_Company.itemIndex],JijumCodeList,cmb_Jijum);
  LoadDepartCode(copy(JijumCodeList.strings[cmb_Jijum.itemIndex],1,3),copy(JijumCodeList.strings[cmb_Jijum.itemIndex],4,3),DepartCodeList,cmb_Depart);
  LoadPosiCode(CompanyCodeList.Strings[cmb_Company.itemIndex],PosiCodeList,cmb_Posi);

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
  if G_nSearchIndex = 0 then btn_SearchClick(Self);
  SetGrade;
  PageControl1.ActivePageIndex := 0;
  GridInit(sg_Door,1);
  GridInit(sg_Alarm,1);
  GridInit(sg_Food,1);

end;

procedure TfmPromiseGradeAdmin.cmb_JijumChange(Sender: TObject);
begin
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
  if G_nSearchIndex = 0 then btn_SearchClick(Self);
end;

procedure TfmPromiseGradeAdmin.CenterPanel;
var
  nTotW,nTotH,nPanW,nPanH:integer;
  nTop,nLeft : integer;
  nStartH,nStartW : integer;
begin
  nStartH := 65;
  nStartW := 0;
  nTotW := fmPromiseGradeAdmin.Width;
  nTotH := fmPromiseGradeAdmin.Height;
  nPanW := Pan_Gauge.Width;
  nPanH := Pan_Gauge.Height;
  nTop := nStartH + (nTotH div 2) - (nPanH div 2);
  nLeft := nStartW + (nTotW div 2) - (nPanW div 2);
  Pan_Gauge.Top := nTop;
  Pan_Gauge.Left := nLeft;
end;

procedure TfmPromiseGradeAdmin.FormResize(Sender: TObject);
begin
  CenterPanel;
end;

procedure TfmPromiseGradeAdmin.GridInit(sg: TAdvStringGrid; aCol: integer);
var
  i:integer;
begin
  with sg do
  begin
    RowCount := 2;
    RemoveCheckBox(0,0);
    RemoveCheckBox(0,1);

    AddCheckBox(0,0,False,False);
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

function TfmPromiseGradeAdmin.UpdateTB_CARDDOORGRADE(aCardNo,
  aDoorGrade: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_CARD set CA_DOORGRADE = ''' + aDoorGrade + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);

end;


end.
