unit uCardAdmin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ComCtrls, Grids, BaseGrid, AdvGrid, StdCtrls, ExtCtrls,
  uSubForm, CommandArray, AdPacket, OoMisc, AdPort,ActiveX,ADODB,WinSpool,
  Gauges;

type
  TfmCardAdmin = class(TfmASubForm)
    Panel2: TPanel;
    ed_sCardNo: TEdit;
    Edit2: TEdit;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Splitter1: TSplitter;
    Panel3: TPanel;
    GroupBox2: TGroupBox;
    lb_CompanyName: TLabel;
    lb_DepartName: TLabel;
    lb_PosiName: TLabel;
    lb_sabun: TLabel;
    lb_Name: TLabel;
    Label21: TLabel;
    lb_JijumName: TLabel;
    cmb_Company: TComboBox;
    cmb_Depart: TComboBox;
    cmb_Posi: TComboBox;
    ed_EmpNo: TEdit;
    ed_EmpNM: TEdit;
    btn_Search: TBitBtn;
    ed_CardNo: TEdit;
    chk_CardReg: TCheckBox;
    cmb_ComPort: TComboBox;
    btn_Close: TBitBtn;
    chk_NonGrade: TCheckBox;
    cmb_Jijum: TComboBox;
    sg_Card: TAdvStringGrid;
    pn_Employ: TPanel;
    PageControl1: TPageControl;
    DoorTab: TTabSheet;
    Panel4: TPanel;
    sg_GradeDoor: TAdvStringGrid;
    Panel16: TPanel;
    Panel5: TPanel;
    btn_GradeInsert: TSpeedButton;
    btn_GradeDelete: TSpeedButton;
    Panel15: TPanel;
    Panel6: TPanel;
    sg_Door: TAdvStringGrid;
    Panel14: TPanel;
    Panel13: TPanel;
    GroupBox3: TGroupBox;
    lb_Building1: TLabel;
    lb_FloorCode1: TLabel;
    lb_AreaCode1: TLabel;
    cmb_BuildingCode: TComboBox;
    cmb_FloorCode: TComboBox;
    cmb_AreaCode: TComboBox;
    AlarmTab: TTabSheet;
    Panel7: TPanel;
    sg_Alarm: TAdvStringGrid;
    Panel19: TPanel;
    Panel8: TPanel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Panel20: TPanel;
    Panel9: TPanel;
    sg_GradeAlarm: TAdvStringGrid;
    Panel21: TPanel;
    Panel18: TPanel;
    GroupBox6: TGroupBox;
    lb_Building2: TLabel;
    lb_FloorCode2: TLabel;
    lb_AreaCode2: TLabel;
    cmb_BuildingCode1: TComboBox;
    cmb_FloorCode1: TComboBox;
    cmb_AreaCode1: TComboBox;
    FoodTab: TTabSheet;
    Panel10: TPanel;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Panel23: TPanel;
    Panel11: TPanel;
    sg_Food: TAdvStringGrid;
    Panel24: TPanel;
    Panel12: TPanel;
    sg_GradeFood: TAdvStringGrid;
    Panel22: TPanel;
    Panel17: TPanel;
    GroupBox1: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    cmb_BuildingCode2: TComboBox;
    cmb_FloorCode2: TComboBox;
    cmb_AreaCode2: TComboBox;
    ReaderPort: TApdComPort;
    ApdDataPacket1: TApdDataPacket;
    Pan_Gauge: TPanel;
    Gauge1: TGauge;
    StaticText1: TStaticText;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure cmb_CompanyChange(Sender: TObject);
    procedure chk_CardRegClick(Sender: TObject);
    procedure ApdDataPacket1StringPacket(Sender: TObject; Data: String);
    procedure cmb_DepartChange(Sender: TObject);
    procedure cmb_PosiChange(Sender: TObject);
    procedure ed_EmpNoKeyPress(Sender: TObject; var Key: Char);
    procedure ed_EmpNMKeyPress(Sender: TObject; var Key: Char);
    procedure ed_CardNoKeyPress(Sender: TObject; var Key: Char);
    procedure sg_CardClick(Sender: TObject);
    procedure cmb_BuildingCodeChange(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure cmb_BuildingCode1Change(Sender: TObject);
    procedure cmb_BuildingCode2Change(Sender: TObject);
    procedure cmb_FloorCodeChange(Sender: TObject);
    procedure cmb_FloorCode1Change(Sender: TObject);
    procedure cmb_FloorCode2Change(Sender: TObject);
    procedure cmb_AreaCodeChange(Sender: TObject);
    procedure cmb_AreaCode1Change(Sender: TObject);
    procedure cmb_AreaCode2Change(Sender: TObject);
    procedure sg_CardCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure btn_GradeInsertClick(Sender: TObject);
    procedure btn_GradeDeleteClick(Sender: TObject);
    procedure chk_NonGradeClick(Sender: TObject);
    procedure cmb_ComPortChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmb_JijumChange(Sender: TObject);
  private
    CompanyCodeList : TStringList;
    JijumCodeList : TStringList;
    DepartCodeList : TStringList;
    PosiCodeList : TStringList;
    ComPortList : TStringList;
    BuildingCodeList : TStringList;
    sBuildingCodeList : TStringList;
    FloorCodeList : TStringList;
    AreaCodeList : TStringList;
    sFloorCodeList : TStringList;
    sAreaCodeList : TStringList;
    CheckCount : integer;
    { Private declarations }
    procedure GetDepartCodeList;
    procedure GridInit(sg:TAdvStringGrid;aCol:integer);
    Procedure RcvCardDataByReader(aData:String);
    procedure AdvStrinGridSetAllCheck(Sender: TObject;bchkState:Boolean);
    procedure LoadBuildingCode(cmb_Box:TComboBox);
    procedure LoadsBuildingCode(cmb_Box:TComboBox);
    procedure LoadFloorCode(aBuildingCode:string;cmb_Box:TComboBox);
    procedure LoadAreaCode(aBuildingCode,aFloorCode:string;cmb_Box:TComboBox);
    procedure LoadsFloorCode(aBuildingCode:string;cmb_Box:TComboBox);
    procedure LoadsAreaCode(aBuildingCode,aFloorCode:string;cmb_Box:TComboBox);
    procedure DoorCodeSearch(aBuildingCode,aFloorCode,aAreaCode:string;sg:TAdvStringGrid);
    procedure AlarmCodeSearch(aBuildingCode,aFloorCode,aAreaCode:string;sg:TAdvStringGrid);
    procedure FoodCodeSearch(aBuildingCode,aFloorCode,aAreaCode:string;sg:TAdvStringGrid);
    procedure DoorGradeSearch(aBuildingCode,aFloorCode,aAreaCode,aCardNo:string;sg:TAdvStringGrid);
    procedure ClearSearcheDoorGrade;
    procedure SettingSearcheDoorGrade(aNodeNo:integer;aEcuID,aDoorNo:string);
    procedure AlarmGradeSearch(aBuildingCode,aFloorCode,aAreaCode,aCardNo:string;sg:TAdvStringGrid);
    procedure FoodGradeSearch(aBuildingCode,aFloorCode,aAreaCode,aCardNo:string;sg:TAdvStringGrid);
    procedure DoorSearch;
    procedure AlarmSearch;
    procedure FoodSearch;
    procedure InsertDoorGrade;
    procedure InsertAlarmGrade;
    procedure InsertFoodGrade;
    procedure DeleteDoorGrade;
    procedure DeleteAlarmGrade;
    procedure DeleteFoodGrade;
    Function CheckTB_DEVICECARDNO(aCardNo,aNodeNo,aECUID : String):Boolean;
    Function InsertTB_DEVICECARDNO(aCardNo,aNodeNo,aECUID,aDoorNO,aTimCode,aPermit,aValue,aGubun:string):Boolean;
    Function UpdateTB_DEVICECARDNO(aCardNo,aNodeNo,aECUID,aDoorNO,aTimCode,aPermit,aValue,aGubun: string):Boolean;
    Function UpdateTB_CARDDOORGRADE(aCardNo,aDoorGrade:string):Boolean;
    procedure FormNameSet;
    procedure CenterPanel;
  public
    { Public declarations }
    function GetSerialPortList(List : TStringList; const doOpenTest : Boolean = True) : LongWord;
    function EncodeCommportName(PortNum : WORD) : String;
    function DecodeCommportName(PortName : String) : WORD;
  end;

var
  fmCardAdmin: TfmCardAdmin;

implementation

uses uDataModule1,
     uLomosUtil,
     uCompanyCodeLoad,
     uMssql,
     uPostGreSql,
     uMDBSql, uFireBird;
{$R *.dfm}


{ TfmCardAdmin }

procedure TfmCardAdmin.AdvStrinGridSetAllCheck(Sender: TObject;
  bchkState: Boolean);
var
  i : integer;
begin
    for i:= 1 to (Sender as TAdvStringGrid).RowCount - 1  do
    begin
      (Sender as TAdvStringGrid).SetCheckBoxState(0,i,bchkState);
    end;

end;

procedure TfmCardAdmin.AlarmCodeSearch(aBuildingCode, aFloorCode,
  aAreaCode: string; sg: TAdvStringGrid);
var
  stSql : string;
  nRow : integer;
  i : integer;
begin
  sg.RowCount := 2;
  sg.RemoveCheckBox(0,1);
  sg.SetCheckBoxState(0,0,False);
  for i:= 0 to sg.ColCount - 1 do
  begin
    sg.Cells[i,1] := '';
  end;

  if DBTYPE = 'MDB' then stSql := MDBSql.selectTB_ALARMDEVICEJoinAdmin(aBuildingCode,aFloorCode,aAreaCode)
  else if DBTYPE = 'PG' then stSql := PostGreSql.selectTB_ALARMDEVICEJoinAdmin(aBuildingCode,aFloorCode,aAreaCode)
  else if DBTYPE = 'MSSQL' then stSql:= MSSql.selectTB_ALARMDEVICEJoinAdmin(aBuildingCode,aFloorCode,aAreaCode)
  else if DBTYPE = 'FB' then stSql:= FireBird.selectTB_ALARMDEVICEJoinAdmin(aBuildingCode,aFloorCode,aAreaCode)
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
    with sg do
    begin
      RowCount := RecordCount + 1;
      nRow := 1;
      while Not Eof do
      begin
        cells[0,nRow] := FindField('AL_ZONENAME').AsString;
        cells[1,nRow] := FillZeroNumber(FindField('AC_NODENO').AsInteger,3) + FindField('AC_ECUID').AsString;
        cells[2,nRow] := FindField('AC_NODENO').AsString;
        cells[3,nRow] := FindField('AC_MCUID').AsString;
        cells[4,nRow] := FindField('AC_ECUID').AsString;
        AddCheckBox(0,nRow,False,False);
        
        nRow := nRow + 1;
        Next;
      end;
    end;
  end;
end;

procedure TfmCardAdmin.AlarmGradeSearch(aBuildingCode, aFloorCode,
  aAreaCode, aCardNo: string; sg: TAdvStringGrid);
var
  stSql : string;
  nRow : integer;
  i : integer;
begin
  sg.RowCount := 2;
  sg.RemoveCheckBox(0,1);
  sg.SetCheckBoxState(0,0,False);
  for i:= 0 to sg.ColCount - 1 do
  begin
    sg.Cells[i,1] := '';
  end;

  if DBTYPE = 'MSSQL' then stSql := Mssql.SelectTB_ALARMGRADEJoinBase(aBuildingCode,aFloorCode,aAreaCode,aCardNo)
  else if DBTYPE = 'PG' then stsql := PostGreSql.SelectTB_ALARMGRADEJoinBase(aBuildingCode,aFloorCode,aAreaCode,aCardNo)
  else if DBTYPE = 'MDB' then stSql := MDBsql.SelectTB_ALARMGRADEJoinBase(aBuildingCode,aFloorCode,aAreaCode,aCardNo)
  else if DBTYPE = 'FB' then stSql := FireBird.SelectTB_ALARMGRADEJoinBase(aBuildingCode,aFloorCode,aAreaCode,aCardNo)
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
    with sg do
    begin
      RowCount := RecordCount + 1;
      nRow := 1;
      while Not Eof do
      begin
        cells[0,nRow] := FindField('AL_ZONENAME').AsString;
        cells[1,nRow] := FindField('DE_RCVACK').AsString;
        cells[2,nRow] := FillZeroNumber(FindField('AC_NODENO').AsInteger,3) + FindField('AC_ECUID').AsString;
        cells[3,nRow] := FindField('AC_NODENO').AsString;
        cells[4,nRow] := FindField('AC_MCUID').AsString;
        cells[5,nRow] := FindField('AC_ECUID').AsString;
        AddCheckBox(0,nRow,False,False);
        
        nRow := nRow + 1;
        Next;
      end;
    end;
  end;

end;

procedure TfmCardAdmin.AlarmSearch;
var
  stBuildingCode,stFloorCode,stAreaCode:string;
begin
  stBuildingCode := BuildingCodeList.Strings[ cmb_BuildingCode1.itemindex ];
  LoadFloorCode(stBuildingCode,cmb_FloorCode1);
  stFloorCode := '000';
  if cmb_FloorCode1.ItemIndex > 0 then stFloorCode := FloorCodeList.Strings[cmb_FloorCode1.itemIndex];
  LoadAreaCode(stBuildingCode,stFloorCode,cmb_AreaCode1);
  stAreaCode := '';
  if cmb_AreaCode1.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode1.itemIndex];
  AlarmCodeSearch(stBuildingCode,stFloorCode,stAreaCode,sg_Alarm);

  AlarmGradeSearch(stBuildingCode,stFloorCode,stAreaCode,ed_sCardNo.text,sg_GradeAlarm);

end;

procedure TfmCardAdmin.CenterPanel;
var
  nTotW,nTotH,nPanW,nPanH:integer;
  nTop,nLeft : integer;
  nStartH,nStartW : integer;
begin
{  nStartH := 65;
  nStartW := 0;
  nTotW := Width;
  nTotH := Height;
  nPanW := Pan_Gauge.Width;
  nPanH := Pan_Gauge.Height;
  nTop := nStartH + (nTotH div 2) - (nPanH div 2);
  nLeft := nStartW + (nTotW div 2) - (nPanW div 2);
  Pan_Gauge.Top := nTop;
  Pan_Gauge.Left := nLeft;
}
end;

function TfmCardAdmin.CheckTB_DEVICECARDNO(aCardNo, aNodeNo,
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

procedure TfmCardAdmin.ClearSearcheDoorGrade;
begin

end;

function TfmCardAdmin.DecodeCommportName(PortName: String): WORD;
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

procedure TfmCardAdmin.DeleteAlarmGrade;
var
  UserLoop,AlarmLoop : integer;
  bchkState : Boolean;
  stNodeNo,stECUID,stDoorNO : string;
  stAlarmNo : string;
  stCardNo : string;
  bResult : Boolean;
begin
    for AlarmLoop := 1 to sg_GradeAlarm.RowCount - 1 do
    begin
      sg_GradeAlarm.GetCheckBoxState(0,AlarmLoop, bchkState);
      if bChkState then //방범구역가 체크 되어 있으면 해당 권한 삭제
      begin
        stAlarmNo := sg_GradeAlarm.Cells[2,AlarmLoop];
        stNodeNo:= sg_GradeAlarm.Cells[3,AlarmLoop];
        stECUID:= sg_GradeAlarm.Cells[5,AlarmLoop];
        UpdateTB_DEVICECARDNO(ed_sCardNo.Text,stNodeNo,stECUID,'0','0','L','N','ALARM');
        DataModule1.TB_SYSTEMLOGInsert(stNodeNo,stECUID,ALARMTYPE,'0',ed_sCardNo.Text,' 경계권한삭제');
      end;
    end;

end;

procedure TfmCardAdmin.DeleteDoorGrade;
var
  UserLoop,DoorLoop : integer;
  bchkState : Boolean;
  stNodeNo,stECUID,stDoorNO : string;
  stCardNo : string;
  bResult : Boolean;
begin
    for DoorLoop := 1 to sg_GradeDoor.RowCount - 1 do
    begin
      sg_GradeDoor.GetCheckBoxState(0,DoorLoop, bchkState);
      if bChkState then //출입문코드가 체크 되어 있으면 해당 권한 삭제
      begin
        stNodeNo  := sg_GradeDoor.Cells[2,DoorLoop];
        stECUID  := sg_GradeDoor.Cells[4,DoorLoop];
        stDoorNo   := sg_GradeDoor.Cells[5,DoorLoop];
        UpdateTB_DEVICECARDNO(ed_sCardNo.Text,stNodeNo,stECUID,stDoorNO,'0','L','N','DOOR');
        DataModule1.TB_SYSTEMLOGInsert(stNodeNo,stECUID,DOORTYPE,stDoorNO,ed_sCardNo.Text,' 출입권한삭제');
      end;
    end;
end;

procedure TfmCardAdmin.DeleteFoodGrade;
var
  UserLoop,FoodLoop : integer;
  bchkState : Boolean;
  stNodeNo,stECUID,stDoorNO : string;
  stCardNo : string;
  bResult : Boolean;
begin
  with sg_GradeFood do
  begin
    for FoodLoop := 1 to RowCount - 1 do
    begin
      GetCheckBoxState(0,FoodLoop, bchkState);
      if bChkState then //출입문코드가 체크 되어 있으면 해당 권한 삭제
      begin
        stNodeNo  := Cells[2,FoodLoop];
        stECUID  := Cells[4,FoodLoop];
        stDoorNO  := Cells[5,FoodLoop];
        UpdateTB_DEVICECARDNO(ed_sCardNo.Text,stNodeNo,stECUID,stDoorNO,'0','L','N','DOOR');
        DataModule1.TB_SYSTEMLOGInsert(stNodeNo,stECUID,DOORTYPE,stDoorNO,ed_sCardNo.Text , ' 식수권한삭제');
      end;
    end;
  end;
end;

procedure TfmCardAdmin.DoorCodeSearch(aBuildingCode, aFloorCode,
  aAreaCode: string; sg: TAdvStringGrid);
var
  stSql : string;
  nRow : integer;
  i : integer;
begin
  sg.RowCount := 2;
  sg.RemoveCheckBox(0,1);
  sg.SetCheckBoxState(0,0,False);
  for i:= 0 to sg.ColCount - 1 do
  begin
    sg.Cells[i,1] := '';
  end;
  if DBTYPE = 'MDB' then stSql := MDBSql.selectTB_DOORJoinAdmin(aBuildingCode,aFloorCode,aAreaCode)
  else if DBTYPE = 'PG' then stSql := PostGreSql.selectTB_DOORJoinAdmin(aBuildingCode,aFloorCode,aAreaCode)
  else if DBTYPE = 'MSSQL' then stSql := MssQl.selectTB_DOORJoinAdmin(aBuildingCode,aFloorCode,aAreaCode)
  else if DBTYPE = 'FB' then stSql := FireBird.selectTB_DOORJoinAdmin(aBuildingCode,aFloorCode,aAreaCode)
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

    with sg do
    begin
      RowCount := RecordCount + 1;
      nRow := 1;
      while Not Eof do
      begin
        cells[0,nRow] := FindField('DO_DOORNONAME').AsString;
        cells[1,nRow] := FindField('DO_DOORNO').AsString;
        cells[2,nRow] := FindField('AC_NODENO').AsString;
        cells[3,nRow] := FindField('AC_MCUID').AsString;
        cells[4,nRow] := FindField('AC_ECUID').AsString;
        AddCheckBox(0,nRow,False,False);

        nRow := nRow + 1;
        Next;
      end;
    end;
  end;
end;

procedure TfmCardAdmin.DoorGradeSearch(aBuildingCode, aFloorCode,
  aAreaCode, aCardNo: string; sg: TAdvStringGrid);
var
  stSql : string;
  nRow : integer;
  i : integer;
begin
  if IsCardGradCopy then ClearSearcheDoorGrade;
  sg.RowCount := 2;
  sg.RemoveCheckBox(0,1);
  sg.SetCheckBoxState(0,0,False);
  for i:= 0 to sg.ColCount - 1 do
  begin
    sg.Cells[i,1] := '';
  end;
  if DBTYPE = 'MDB' then stSql := MDBSql.selectTB_DOORJoinGrade(aBuildingCode,aFloorCode,aAreaCode,aCardNo)
  else if DBTYPE = 'PG' then stSql := PostGreSql.selectTB_DOORJoinGrade(aBuildingCode,aFloorCode,aAreaCode,aCardNo)
  else if DBTYPE = 'MSSQL' then stSql := MSSql.selectTB_DOORJoinGrade(aBuildingCode,aFloorCode,aAreaCode,aCardNo)
  else if DBTYPE = 'FB' then stSql := FireBird.selectTB_DOORJoinGrade(aBuildingCode,aFloorCode,aAreaCode,aCardNo)
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
    with sg do
    begin
      RowCount := RecordCount + 1;
      nRow := 1;
      while Not Eof do
      begin
        cells[0,nRow] := FindField('DO_DOORNONAME').AsString;
        cells[1,nRow] := FindField('DE_RCVACK').AsString;
        cells[2,nRow] := inttostr(FindField('AC_NODENO').AsInteger);
        cells[3,nRow] := FindField('AC_MCUID').AsString;
        cells[4,nRow] := FindField('AC_ECUID').AsString;
        cells[5,nRow] := FindField('DO_DOORNO').AsString;
        AddCheckBox(0,nRow,False,False);

        if IsCardGradCopy then SettingSearcheDoorGrade(FindField('AC_NODENO').AsInteger,FindField('AC_ECUID').AsString,FindField('DO_DOORNO').AsString);
        
        nRow := nRow + 1;
        Next;
      end;
    end;
  end;

end;

procedure TfmCardAdmin.DoorSearch;
var
  stBuildingCode,stFloorCode,stAreaCode:string;
begin
  stBuildingCode := BuildingCodeList.Strings[ cmb_BuildingCode.itemindex ];
  LoadFloorCode(stBuildingCode,cmb_FloorCode);
  stFloorCode := '';
  if cmb_FloorCode.ItemIndex > 0 then stFloorCode := FloorCodeList.Strings[cmb_FloorCode.itemIndex];
  LoadAreaCode(stBuildingCode,stFloorCode,cmb_AreaCode);
  stAreaCode := '';
  if cmb_AreaCode.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode.itemIndex];
  DoorCodeSearch(stBuildingCode,stFloorCode,stAreaCode,sg_Door);

  DoorGradeSearch(stBuildingCode,stFloorCode,stAreaCode,ed_sCardNo.text,sg_GradeDoor);

end;

function TfmCardAdmin.EncodeCommportName(PortNum: WORD): String;
begin
 if PortNum < 10
    then Result := 'COM' + IntToStr(PortNum) + ':'
    else Result := '\\.\COM'+IntToStr(PortNum);

end;

procedure TfmCardAdmin.FoodCodeSearch(aBuildingCode, aFloorCode,
  aAreaCode: string; sg: TAdvStringGrid);
var
  stSql : string;
  nRow : integer;
  i : integer;
begin
  sg.RowCount := 2;
  sg.RemoveCheckBox(0,1);
  sg.SetCheckBoxState(0,0,False);
  for i:= 0 to sg.ColCount - 1 do
  begin
    sg.Cells[i,1] := '';
  end;
  stSql := 'select a.FO_NAME,a.AC_NODENO,a.AC_MCUID,a.AC_ECUID,a.FO_DOORNO ';
  stSql := stSql + ' from TB_FOOD a ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join TB_ADMINFOOD b ';
      stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
      stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
      stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID  ';
      stSql := stSql + ' AND a.FO_DOORNO = b.FO_DOORNO ) ';
    end;
  end;
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';

  if Not IsMaster then
  begin
    if BuildingGrade = 1 then
    begin
      if (aBuildingCode <> '') and (aBuildingCode <> '000') then
        stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' '
      else
        stSql := stSql + ' AND a.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
      if (aFloorCode <> '') and (aFloorCode <> '000') then
        stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
      if (aAreaCode <> '') and (aAreaCode <> '000') then
        stSql := stSql + ' AND a.LO_AREACODE = ''' + aAreaCode + ''' ';
    end else if BuildingGrade = 2 then
    begin
      if (aBuildingCode <> '') and (aBuildingCode <> '000') then
        stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' '
      else
        stSql := stSql + ' AND a.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
      if (aFloorCode <> '') and (aFloorCode <> '000') then
        stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' '
      else
        stSql := stSql + ' AND a.LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
      if (aAreaCode <> '') and (aAreaCode <> '000') then
        stSql := stSql + ' AND a.LO_AREACODE = ''' + aAreaCode + ''' ';
    end else if BuildingGrade = 3 then
    begin
      if (aBuildingCode <> '') and (aBuildingCode <> '000') then
        stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' '
      else
        stSql := stSql + ' AND a.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
      if (aFloorCode <> '') and (aFloorCode <> '000') then
        stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' '
      else
        stSql := stSql + ' AND a.LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
      if (aAreaCode <> '') and (aAreaCode <> '000') then
        stSql := stSql + ' AND a.LO_AREACODE = ''' + aAreaCode + ''' '
      else
        stSql := stSql + ' AND a.LO_AREACODE = ''' + MasterAreaCode + ''' ';
    end else
    begin
      if (aBuildingCode <> '') and (aBuildingCode <> '000') then
        stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' ';
      if (aFloorCode <> '') and (aFloorCode <> '000') then
        stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
      if (aAreaCode <> '') and (aAreaCode <> '000') then
        stSql := stSql + ' AND a.LO_AREACODE = ''' + aAreaCode + ''' ';
      if BuildingGrade = 4 then stSql := stSql + ' AND b.AD_USERID = ''' + Master_ID + ''' ';
    end;
  end else
  begin
    if (aBuildingCode <> '') and (aBuildingCode <> '000') then
      stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' ';
    if (aFloorCode <> '') and (aFloorCode <> '000') then
      stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
    if (aAreaCode <> '') and (aAreaCode <> '000') then
      stSql := stSql + ' AND a.LO_AREACODE = ''' + aAreaCode + ''' ';
  end;

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
    with sg do
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
        AddCheckBox(0,nRow,False,False);
        
        nRow := nRow + 1;
        Next;
      end;
    end;
  end;
end;

procedure TfmCardAdmin.FoodGradeSearch(aBuildingCode, aFloorCode,
  aAreaCode, aCardNo: string; sg: TAdvStringGrid);
var
  stSql : string;
  nRow : integer;
  i : integer;
begin
  sg.RowCount := 2;
  sg.RemoveCheckBox(0,1);
  sg.SetCheckBoxState(0,0,False);
  for i:= 0 to sg.ColCount - 1 do
  begin
    sg.Cells[i,1] := '';
  end;

  if Length(aCardNo) <> 10 then Exit; 

  stSql :=  ' select a.FO_NAME,a.AC_NODENO,a.AC_MCUID,a.AC_ECUID,a.FO_DOORNO,b.DE_RCVACK  ';
  stSql := stSql + ' From TB_FOOD a  ';
  stSql := stSql + ' INNER JOIN TB_DEVICECARDNO b  ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ';
  stSql := stSql + ' AND ( (a.FO_DOORNO = ''1'' AND b.DE_DOOR1 = ''Y'') OR  ';
  stSql := stSql + '       (a.FO_DOORNO = ''2'' AND b.DE_DOOR2 = ''Y'') ) ';
  stSql := stSql + ' AND b.DE_USEACCESS = ''Y''';
  stSql := stSql + ' AND b.DE_PERMIT = ''L'' ';
  stSql := stSql + ' ) ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join TB_ADMINFOOD c ';
      stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
      stSql := stSql + ' AND a.AC_NODENO = c.AC_NODENO ';
      stSql := stSql + ' AND a.AC_ECUID = c.AC_ECUID  ';
      stSql := stSql + ' AND a.FO_DOORNO = c.FO_DOORNO ) ';
    end;
  end;
  stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND b.CA_CARDNO = ''' + aCardNo + ''' ';
  if Not IsMaster then
  begin
    if BuildingGrade = 1 then
    begin
      if (aBuildingCode <> '') and (aBuildingCode <> '000') then
        stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' '
      else
        stSql := stSql + ' AND a.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
      if (aFloorCode <> '') and (aFloorCode <> '000') then
        stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
      if (aAreaCode <> '') and (aAreaCode <> '000') then
        stSql := stSql + ' AND a.LO_AREACODE = ''' + aAreaCode + ''' ';
    end else if BuildingGrade = 2 then
    begin
      if (aBuildingCode <> '') and (aBuildingCode <> '000') then
        stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' '
      else
        stSql := stSql + ' AND a.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
      if (aFloorCode <> '') and (aFloorCode <> '000') then
        stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' '
      else
        stSql := stSql + ' AND a.LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
      if (aAreaCode <> '') and (aAreaCode <> '000') then
        stSql := stSql + ' AND a.LO_AREACODE = ''' + aAreaCode + ''' ';
    end else if BuildingGrade = 3 then
    begin
      if (aBuildingCode <> '') and (aBuildingCode <> '000') then
        stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' '
      else
        stSql := stSql + ' AND a.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
      if (aFloorCode <> '') and (aFloorCode <> '000') then
        stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' '
      else
        stSql := stSql + ' AND a.LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
      if (aAreaCode <> '') and (aAreaCode <> '000') then
        stSql := stSql + ' AND a.LO_AREACODE = ''' + aAreaCode + ''' '
      else
        stSql := stSql + ' AND a.LO_AREACODE = ''' + MasterAreaCode + ''' ';
    end else
    begin
      if BuildingGrade = 4 then stSql := stSql + ' AND c.AD_USERID = ''' + Master_ID + ''' ';
      if (aBuildingCode <> '') and (aBuildingCode <> '000') then
        stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' ';
      if (aFloorCode <> '') and (aFloorCode <> '000') then
        stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
      if (aAreaCode <> '') and (aAreaCode <> '000') then
        stSql := stSql + ' AND a.LO_AREACODE = ''' + aAreaCode + ''' ';
    end;
  end else
  begin
    if (aBuildingCode <> '') and (aBuildingCode <> '000') then
      stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' ';
    if (aFloorCode <> '') and (aFloorCode <> '000') then
      stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
    if (aAreaCode <> '') and (aAreaCode <> '000') then
      stSql := stSql + ' AND a.LO_AREACODE = ''' + aAreaCode + ''' ';
  end;

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
    with sg do
    begin
      RowCount := RecordCount + 1;
      nRow := 1;
      while Not Eof do
      begin
        cells[0,nRow] := FindField('FO_NAME').AsString;
        cells[1,nRow] := FindField('DE_RCVACK').AsString;
        cells[2,nRow] := FindField('AC_NODENO').AsString;
        cells[3,nRow] := FindField('AC_MCUID').AsString;
        cells[4,nRow] := FindField('AC_ECUID').AsString;
        cells[5,nRow] := FindField('FO_DOORNO').AsString;
        AddCheckBox(0,nRow,False,False);
        
        nRow := nRow + 1;
        Next;
      end;
    end;
  end;

end;

procedure TfmCardAdmin.FoodSearch;
var
  stBuildingCode,stFloorCode,stAreaCode:string;
begin
  stBuildingCode := BuildingCodeList.Strings[ cmb_BuildingCode2.itemindex ];
  LoadFloorCode(stBuildingCode,cmb_FloorCode2);
  stFloorCode := '000';
  if cmb_FloorCode2.ItemIndex > 0 then stFloorCode := FloorCodeList.Strings[cmb_FloorCode2.itemIndex];
  LoadAreaCode(stBuildingCode,stFloorCode,cmb_AreaCode2);
  stAreaCode := '';
  if cmb_AreaCode2.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode2.itemIndex];
  FoodCodeSearch(stBuildingCode,stFloorCode,stAreaCode,sg_Food);
  FoodGradeSearch(stBuildingCode,stFloorCode,stAreaCode,ed_sCardNo.Text ,sg_GradeFood);

end;

procedure TfmCardAdmin.FormNameSet;
begin
{  lb_CompanyName.Caption := FM002;
  lb_JijumName.Caption := FM012;
  lb_DepartName.Caption := FM022;
  lb_PosiName.Caption := FM032;
  lb_sabun.Caption := FM101;
  lb_Name.Caption := FM102;
  lb_Building1.Caption := FM901;
  lb_Building2.Caption := FM901;
  lb_FloorCode1.Caption := FM911;
  lb_FloorCode2.Caption := FM911;
  lb_AreaCode1.Caption := FM921;
  lb_AreaCode2.Caption := FM921;

  with sg_Card do
  begin
    Cells[0,0] := FM002;
    Cells[1,0] := FM101;
    Cells[2,0] := FM102;
    Cells[4,0] := FM012;
    Cells[5,0] := FM022;
    Cells[6,0] := FM032;

  end;  }
end;

procedure TfmCardAdmin.GetDepartCodeList;
var
  stSql : String;
  TempAdoQuery : TADOQuery;
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
      DepartCodeList.Add(FindField('CO_COMPANYCODE').AsString + FindField('CO_DEPARTCODE').AsString);
      Next;
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

function TfmCardAdmin.GetSerialPortList(List: TStringList;
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

procedure TfmCardAdmin.GridInit(sg: TAdvStringGrid; aCol: integer);
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

procedure TfmCardAdmin.InsertAlarmGrade;
var
  UserLoop,AlarmLoop : integer;
  bchkState : Boolean;
  stNodeNo,stECUID,stDoorNO : string;
  stAlarmNo : string;
  stCardNo : string;
  bResult : Boolean;
  i : integer;
begin

  i := 1;
  Gauge1.MaxValue := CheckCount;
  Gauge1.Progress := 0;
  for UserLoop := 1 to sg_Card.RowCount - 1 do   //체크되어 있는 사용자 모두를 인서트 시킴
  begin
    sg_Card.GetCheckBoxState(0,UserLoop, bchkState);
    if bchkState then  //체크 되어 있으면 권한 등록
    begin
      stCardNo := sg_Card.Cells[3,UserLoop];
      for AlarmLoop := 1 to sg_Alarm.RowCount - 1 do
      begin
        sg_Alarm.GetCheckBoxState(0,AlarmLoop, bchkState);
        if bChkState then //경비구역이 체크 되어 있으면 해당 경비구역 Insert;
        begin
          stAlarmNo := sg_Alarm.Cells[1,AlarmLoop];
          stNodeNo:= sg_Alarm.Cells[2,AlarmLoop];
          stECUID:= sg_Alarm.Cells[4,AlarmLoop];
          bResult := CheckTB_DEVICECARDNO(stCardNo,stNodeNo,stECUID);
          if Not bResult then
             InsertTB_DEVICECARDNO(stCardNo,stNodeNo,stECUID,'0','0','L','Y','ALARM')
          else UpdateTB_DEVICECARDNO(stCardNo,stNodeNo,stECUID,'0','0','L','Y','ALARM');
          DataModule1.TB_SYSTEMLOGInsert(stNodeNo,stECUID,ALARMTYPE,'0',stCardNo , '경계권한등록');
        end;
      end;
      UpdateTB_CARDDOORGRADE(stCardNo,'Y');
      StatusBar1.Panels[0].Text := inttostr(i) + '/' + inttostr(CheckCount);
      Gauge1.Progress := i;
      inc(i);
      Application.ProcessMessages;
    end;
  end;
end;

procedure TfmCardAdmin.InsertDoorGrade;
var
  UserLoop,DoorLoop : integer;
  bchkState : Boolean;
  stNodeNo,stECUID,stDoorNO : string;
  stCardNo : string;
  bResult : Boolean;
  i : integer;
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
      for DoorLoop := 1 to sg_Door.RowCount - 1 do
      begin
        sg_Door.GetCheckBoxState(0,DoorLoop, bchkState);
        if bChkState then //
        begin
          stNodeNo:= sg_Door.Cells[2,DoorLoop];
          stECUID:= sg_Door.Cells[4,DoorLoop];
          stDoorNO := sg_Door.Cells[1,DoorLoop];
          bResult := CheckTB_DEVICECARDNO(stCardNo,stNodeNo,stECUID);
          if Not bResult then
             InsertTB_DEVICECARDNO(stCardNo,stNodeNo,stECUID,stDoorNO,'0','L','Y','DOOR')
          else UpdateTB_DEVICECARDNO(stCardNo,stNodeNo,stECUID,stDoorNO,'0','L','Y','DOOR');
          DataModule1.TB_SYSTEMLOGInsert(stNodeNo,stECUID,DOORTYPE,stDoorNO,stCardNo , ' 출입권한등록');

        end;
      end;
      UpdateTB_CARDDOORGRADE(stCardNo,'Y');
      StatusBar1.Panels[0].Text := inttostr(i) + '/' + inttostr(CheckCount);
      Gauge1.Progress := i;
      inc(i);
      Application.ProcessMessages;
    end;
  end;
end;

procedure TfmCardAdmin.InsertFoodGrade;
var
  UserLoop,FoodLoop : integer;
  bchkState : Boolean;
  stNodeNo,stECUID,stDoorNo : string;
  stCardNo : string;
  bResult : Boolean;
  i : integer;
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
      for FoodLoop := 1 to sg_Food.RowCount - 1 do
      begin
        sg_Food.GetCheckBoxState(0,FoodLoop, bchkState);
        if bChkState then //경비구역이 체크 되어 있으면 해당 경비구역 Insert;
        begin
          stNodeNo:= sg_Food.Cells[1,FoodLoop];
          stECUID:= sg_Food.Cells[3,FoodLoop];
          stDoorNo:= sg_Food.Cells[4,FoodLoop];
          bResult := CheckTB_DEVICECARDNO(stCardNo,stNodeNo,stECUID);
          if Not bResult then
             InsertTB_DEVICECARDNO(stCardNo,stNodeNo,stECUID,stDoorNo,'0','L','Y','DOOR')
          else UpdateTB_DEVICECARDNO(stCardNo,stNodeNo,stECUID,stDoorNo,'0','L','Y','DOOR');
          DataModule1.TB_SYSTEMLOGInsert(stNodeNo,stECUID,DOORTYPE,stDoorNO,stCardNo , ' 식수권한등록');
        end;
      end;
      StatusBar1.Panels[0].Text := inttostr(i) + '/' + inttostr(sg_Card.RowCount - 1);
      Gauge1.Progress := i;
      inc(i);
      Application.ProcessMessages;
    end;
  end;
end;

function TfmCardAdmin.InsertTB_DEVICECARDNO(aCardNo, aNodeNo, aECUID,
  aDoorNO, aTimCode, aPermit, aValue, aGubun: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' Insert Into TB_DEVICECARDNO( ';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'CA_CARDNO,';
  stSql := stSql + 'AC_NODENO,';
  stSql := stSql + 'AC_ECUID,';
  if aGubun = 'DOOR' then
  begin
    if aDoorNO = '1' then  stSql := stSql + 'DE_DOOR1,'
    else if aDoorNO = '2'then  stSql := stSql + 'DE_DOOR2,';
    stSql := stSql + 'DE_USEACCESS,';
{  end else if aGubun = 'FOOD' then
  begin
    stSql := stSql + 'DE_DOOR1,';
    stSql := stSql + 'DE_DOOR2,';
    stSql := stSql + 'DE_USEACCESS,';  }
  end else if aGubun = 'ALARM' then
  begin
    stSql := stSql + 'DE_USEALARM,';
  end;
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
  if aGubun = 'DOOR' then
  begin
    stSql := stSql + '''' + aValue + ''',';
    stSql := stSql + '''Y'',';
{  end else if aGubun = 'FOOD' then
  begin
    stSql := stSql + '''Y'',';
    stSql := stSql + '''Y'',';
    stSql := stSql + '''Y'',';  }
  end else if aGubun = 'ALARM' then
  begin
    stSql := stSql + '''' + aValue + ''',';
  end;
  stSql := stSql + '''' + aTimCode + ''',';
  stSql := stSql + '''' + aPermit + ''',';
  stSql := stSql + '''N'',';
  stSql := stSql + '''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',';
  stSql := stSql + '''' + Master_ID + ''') ';

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

procedure TfmCardAdmin.LoadAreaCode(aBuildingCode, aFloorCode: string;
  cmb_Box: TComboBox);
var
  stSql : string;
begin
  cmb_Box.Clear;
  AreaCodeList.Clear;

  stSql := 'select * from TB_LOCATION ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND LO_GUBUN = ''2'' ';

  if (aBuildingCode <> '') And (aBuildingCode <> '000')  then
  begin
    stSql := stSql + ' AND LO_DONGCODE = ''' + aBuildingCode + '''';
  end else Exit;

  if (aFloorCode <> '') And (aFloorCode <> '000')  then
  begin
    stSql := stSql + ' AND LO_FLOORCODE = ''' + aFloorCode + '''';
  end else Exit;

  if Not IsMaster then
  begin
    if BuildingGrade > 2 then
    begin
      stSql := stSql + ' AND LO_AREACODE = ''' + MasterAreaCode + ''' ';
    end
  end;

  cmb_Box.Items.Add('전체');
  AreaCodeList.Add('');
  cmb_Box.ItemIndex := 0;

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
      cmb_Box.Items.Add(FindField('LO_NAME').AsString );
      AreaCodeList.Add(FindField('LO_AREACODE').AsString);
      Next;
    end;
    if Not IsMaster then
    begin
      if BuildingGrade > 2 then
      begin
        if AreaCodeList.IndexOf(MasterAreaCode) > 0 then
        begin
          cmb_Box.ItemIndex := AreaCodeList.IndexOf(MasterAreaCode);
          cmb_Box.Enabled := False;
        end;
      end
    end;
  end;
end;

procedure TfmCardAdmin.LoadBuildingCode(cmb_Box: TComboBox);
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  cmb_Box.Clear;
  BuildingCodeList.Clear;

  stSql := 'select * from TB_LOCATION ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND LO_GUBUN = ''0'' ';
  if Not IsMaster then
  begin
    if BuildingGrade <> 0 then
    begin
      stSql := stSql + ' AND LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
    end
  end;

  cmb_Box.Items.Add('전체');
  BuildingCodeList.Add('');
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
      cmb_Box.Items.Add(FindField('LO_NAME').AsString );
      BuildingCodeList.Add(FindField('LO_DONGCODE').AsString);
      Next;
    end;
    if Not IsMaster then
    begin
      if BuildingGrade <> 0 then
      begin
        if BuildingCodeList.IndexOf(MasterBuildingCode) > 0 then
        begin
          cmb_Box.ItemIndex := BuildingCodeList.IndexOf(MasterBuildingCode);
          cmb_Box.Enabled := False;
        end;
      end
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

procedure TfmCardAdmin.LoadFloorCode(aBuildingCode: string;
  cmb_Box: TComboBox);
var
  stSql : string;
begin
  cmb_Box.Clear;
  FloorCodeList.Clear;

  stSql := 'select * from TB_LOCATION ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND LO_GUBUN = ''1'' ';

  if (aBuildingCode <> '') And (aBuildingCode <> '000')  then
  begin
    stSql := stSql + ' AND LO_DONGCODE = ''' + aBuildingCode + '''';
  end else Exit;

  if Not IsMaster then
  begin
    if BuildingGrade > 1 then
    begin
      stSql := stSql + ' AND LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
    end
  end;

  cmb_Box.Items.Add('전체');
  FloorCodeList.Add('');
  cmb_Box.ItemIndex := 0;

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
      cmb_Box.Items.Add(FindField('LO_NAME').AsString );
      FloorCodeList.Add(FindField('LO_FLOORCODE').AsString);
      Next;
    end;
    if Not IsMaster then
    begin
      if BuildingGrade > 1 then
      begin
        if FloorCodeList.IndexOf(MasterFloorCode) > 0 then
        begin
          cmb_Box.ItemIndex := FloorCodeList.IndexOf(MasterFloorCode);
          cmb_Box.Enabled := False;
        end;
      end
    end;
  end;
end;

procedure TfmCardAdmin.LoadsAreaCode(aBuildingCode, aFloorCode: string;
  cmb_Box: TComboBox);
var
  stSql : string;
begin
  cmb_Box.Clear;
  sAreaCodeList.Clear;

  stSql := 'select * from TB_LOCATION ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND LO_GUBUN = ''2'' ';

  if (aBuildingCode <> '') And (aBuildingCode <> '000')  then
  begin
    stSql := stSql + ' AND LO_DONGCODE = ''' + aBuildingCode + '''';
  end;

  if (aFloorCode <> '') And (aFloorCode <> '000')  then
  begin
    stSql := stSql + ' AND LO_FLOORCODE = ''' + aFloorCode + '''';
  end;

  if Not IsMaster then
  begin
    if BuildingGrade > 2 then
    begin
      stSql := stSql + ' AND LO_AREACODE = ''' + MasterAreaCode + ''' ';
    end
  end;

  cmb_Box.Items.Add('전체');
  sAreaCodeList.Add('');
  cmb_Box.ItemIndex := 0;

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
      cmb_Box.Items.Add(FindField('LO_NAME').AsString );
      sAreaCodeList.Add(FindField('LO_AREACODE').AsString);
      Next;
    end;
    if Not IsMaster then
    begin
      if BuildingGrade > 2 then
      begin
        if AreaCodeList.IndexOf(MasterAreaCode) > 0 then
        begin
          cmb_Box.ItemIndex := AreaCodeList.IndexOf(MasterAreaCode);
          cmb_Box.Enabled := False;
        end;
      end
    end;
  end;
end;

procedure TfmCardAdmin.LoadsBuildingCode(cmb_Box: TComboBox);
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  cmb_Box.Clear;
  sBuildingCodeList.Clear;

  stSql := 'select * from TB_LOCATION ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND LO_GUBUN = ''0'' ';
  if Not IsMaster then
  begin
    if BuildingGrade <> 0 then
    begin
      stSql := stSql + ' AND LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
    end
  end;

  cmb_Box.Items.Add('전체');
  sBuildingCodeList.Add('000');
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
      cmb_Box.Items.Add(FindField('LO_NAME').AsString );
      sBuildingCodeList.Add(FindField('LO_DONGCODE').AsString);
      Next;
    end;
    if Not IsMaster then
    begin
      if BuildingGrade <> 0 then
      begin
        if BuildingCodeList.IndexOf(MasterBuildingCode) > 0 then
        begin
          cmb_Box.ItemIndex := BuildingCodeList.IndexOf(MasterBuildingCode);
          cmb_Box.Enabled := False;
        end;
      end
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

procedure TfmCardAdmin.LoadsFloorCode(aBuildingCode: string;
  cmb_Box: TComboBox);
var
  stSql : string;
begin
  cmb_Box.Clear;
  sFloorCodeList.Clear;

  stSql := 'select * from TB_LOCATION ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND LO_GUBUN = ''1'' ';

  if (aBuildingCode <> '') And (aBuildingCode <> '000')  then
  begin
    stSql := stSql + ' AND LO_DONGCODE = ''' + aBuildingCode + '''';
  end else Exit;

  if Not IsMaster then
  begin
    if BuildingGrade > 1 then
    begin
      stSql := stSql + ' AND LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
    end
  end;

  cmb_Box.Items.Add('전체');
  sFloorCodeList.Add('000');
  cmb_Box.ItemIndex := 0;

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
      cmb_Box.Items.Add(FindField('LO_NAME').AsString );
      sFloorCodeList.Add(FindField('LO_FLOORCODE').AsString);
      Next;
    end;
    if Not IsMaster then
    begin
      if BuildingGrade > 1 then
      begin
        if FloorCodeList.IndexOf(MasterFloorCode) > 0 then
        begin
          cmb_Box.ItemIndex := FloorCodeList.IndexOf(MasterFloorCode);
          cmb_Box.Enabled := False;
        end;
      end
    end;
  end;
end;

procedure TfmCardAdmin.RcvCardDataByReader(aData: String);
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
      bCardNo:= Hex2Dec64(aData);
      aCardNo := inttostr(bCardNo);
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
{
  bCardNo:= Hex2Dec64(aData);
  aCardNo:= FillZeroNumber2(bCardNo,10);
 }
  ed_CardNo.Text := aCardNo;

  btn_SearchClick(Self);

end;

procedure TfmCardAdmin.SettingSearcheDoorGrade(aNodeNo: integer; aEcuID,
  aDoorNo: string);
begin

end;

function TfmCardAdmin.UpdateTB_CARDDOORGRADE(aCardNo,
  aDoorGrade: string): Boolean;
begin

end;

function TfmCardAdmin.UpdateTB_DEVICECARDNO(aCardNo, aNodeNo, aECUID,
  aDoorNO, aTimCode, aPermit, aValue, aGubun: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' Update TB_DEVICECARDNO Set ';
  if aGubun = 'DOOR' then
  begin
    if aDoorNO = '1' then  stSql := stSql + 'DE_DOOR1 = ''' + aValue + ''','
    else if aDoorNO = '2'then  stSql := stSql + 'DE_DOOR2 = ''' + aValue + ''',';
    stSql := stSql + 'DE_USEACCESS = ''Y'',';
{  end else if aGubun = 'FOOD' then
  begin
    stSql := stSql + 'DE_DOOR1 = ''' + aValue + ''',';
    stSql := stSql + 'DE_DOOR2 = ''' + aValue + ''',';
    stSql := stSql + 'DE_USEACCESS = ''Y'',';  }
  end else if aGubun = 'ALARM' then
  begin
    stSql := stSql + 'DE_USEALARM = ''' + aValue + ''',';
  end;
  stSql := stSql + 'DE_TIMECODE = ''' + aTimCode + ''',';
  stSql := stSql + 'DE_PERMIT = ''' + aPermit + ''',';
  stSql := stSql + 'DE_RCVACK = ''N'',';
  stSql := stSql + 'DE_UPDATETIME = ''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',';
  stSql := stSql + 'DE_UPDATEOPERATOR = ''' + Master_ID + ''' ';
  stSql := stSql + ' Where GROUP_CODE =''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO =''' + aCardNo + ''' ';
  stSql := stSql + ' AND AC_NODENO =' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + '''';

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

procedure TfmCardAdmin.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmCardAdmin.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CompanyCodeList.Free;
  JijumCodeList.Free;
  DepartCodeList.Free;
  PosiCodeList.Free;
  BuildingCodeList.Free;
  sBuildingCodeList.Free;
  FloorCodeList.Free;
  AreaCodeList.Free;
  sFloorCodeList.Free;
  sAreaCodeList.Free;
  if ReaderPort.Open then
  begin
    ApdDataPacket1.Enabled := False;
    ReaderPort.Open:= False;
  end;
  ApdDataPacket1.Free;
  ReaderPort.Free;
  ComPortList.Free;
  Action := caFree;

end;

procedure TfmCardAdmin.FormCreate(Sender: TObject);
begin
  CompanyCodeList := TStringList.Create;
  JijumCodeList := TStringList.Create;
  DepartCodeList := TStringList.Create;
  PosiCodeList := TStringList.Create;
  ComPortList := TStringList.Create;
  BuildingCodeList := TStringList.Create;
  sBuildingCodeList := TStringList.Create;
  FloorCodeList := TStringList.Create;
  AreaCodeList := TStringList.Create;
  sFloorCodeList := TStringList.Create;
  sAreaCodeList := TStringList.Create;

end;

procedure TfmCardAdmin.FormActivate(Sender: TObject);
var
  nIndex : integer;
begin
  LoadCompanyCode(CompanyCodeList,cmb_Company);
  LoadJijumCode(CompanyCodeList.Strings[cmb_Company.itemIndex],JijumCodeList,cmb_Jijum);
  LoadPosiCode(CompanyCodeList.Strings[cmb_Company.itemIndex],PosiCodeList,cmb_Posi);

  LoadBuildingCode(cmb_BuildingCode);
  LoadBuildingCode(cmb_BuildingCode1);
  LoadBuildingCode(cmb_BuildingCode2);

  GridInit(sg_Card,7);
  GridInit(sg_Door,1);
  GridInit(sg_GradeDoor,2);
  GridInit(sg_Alarm,1);
  GridInit(sg_GradeAlarm,2);
  GridInit(sg_Food,1);
  GridInit(sg_GradeFood,2);
  
  PageControl1.ActivePageIndex := 0;
  if PageControl1.ActivePage.Name  = 'DoorTab' then    DoorSearch
  else if PageControl1.ActivePage.Name  = 'AlarmTab' then  AlarmSearch
  else if PageControl1.ActivePage.Name  = 'FoodTab' then FoodSearch;
  CheckCount := 0;

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
  //Panel2.Caption := fmMDICardAdmin.Caption;
  if G_nSearchIndex = 0 then btn_SearchClick(Self);
end;

procedure TfmCardAdmin.btn_SearchClick(Sender: TObject);
var
  stSql : string;
  nRow : integer;
  i : integer;
  TempAdoQuery : TADOQuery;
begin
  GridInit(sg_Card,7);
  CheckCount := 0;

  if DBTYPE = 'MSSQL' then stSql := MSSQL.SelectTB_CARDAdminJoinBase
  else if DBType = 'PG' then stSql := PostGreSql.SelectTB_CARDAdminJoinBase
  else if DBType = 'MDB' then stSql := MDBSql.SelectTB_CARDAdminJoinBase
  else if DBType = 'FB' then stSql := FireBird.SelectTB_CARDAdminJoinBase
  else Exit;


  if Length(ed_CardNo.Text) > 0 then
  begin
    stSql := stSql + ' AND a.CA_CARDNO LIKE ''%' + Trim(ed_CardNo.Text)  + '%'' ' ;
  end else
  begin
    if Trim(ed_EmpNo.Text) <> '' then
    begin
      stSql := stSql + ' AND b.EM_CODE LIKE ''%' + Trim(ed_EmpNo.Text)  + '%'' ';
    end else
    begin
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
      if Trim(ed_EmpNM.Text) <> '' then
        stSql := stSql + ' AND b.EM_NAME LIKE ''%' + Trim(ed_EmpNM.Text)  + '%'' ';

      if chk_NonGrade.Checked then
      begin
        stSql := stSql + ' AND a.CA_DOORGRADE <> ''Y'' ';
        //stSql := stSql + ' AND NOT EXISTS (SELECT CA_CARDNO FROM TB_DEVICECARDNO G WHERE G.CA_CARDNO = a.CA_CARDNO AND G.GROUP_CODE = a.GROUP_CODE ) ';
      end;
    end; //사번 셋팅시 전체에서 조회
  end;   //카드번호 셋팅시 전체에서 조회

  stSql := stSql + ' order by a.CA_CARDNO ';

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
        cells[8,nRow] := FindField('CO_DEPARTCODE').AsString;
        cells[9,nRow] := FindField('PO_POSICODE').AsString;
        AddCheckBox(0,nRow,False,False);

      end;
      nRow := nRow + 1;
      Next;
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

procedure TfmCardAdmin.cmb_CompanyChange(Sender: TObject);
begin
  LoadJijumCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],JijumCodeList,cmb_Jijum);
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
  LoadPosiCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],PosiCodeList,cmb_Posi);
  if G_nSearchIndex = 0 then btn_SearchClick(Self);

end;

procedure TfmCardAdmin.chk_CardRegClick(Sender: TObject);
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
    cmb_ComPort.Enabled := False;

  end;

end;

procedure TfmCardAdmin.ApdDataPacket1StringPacket(Sender: TObject;
  Data: String);
begin
  RcvCardDataByReader(Data);
  ApdDataPacket1.Enabled := True;

end;

procedure TfmCardAdmin.cmb_DepartChange(Sender: TObject);
begin
  if G_nSearchIndex = 0 then btn_SearchClick(Self);

end;

procedure TfmCardAdmin.cmb_PosiChange(Sender: TObject);
begin
  if G_nSearchIndex = 0 then btn_SearchClick(Self);

end;

procedure TfmCardAdmin.ed_EmpNoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    if G_nSearchIndex = 0 then btn_SearchClick(Self);
  end;

end;

procedure TfmCardAdmin.ed_EmpNMKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    if G_nSearchIndex = 0 then btn_SearchClick(Self);
  end;

end;

procedure TfmCardAdmin.ed_CardNoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    if G_nSearchIndex = 0 then btn_SearchClick(Self);
  end;

end;

procedure TfmCardAdmin.sg_CardClick(Sender: TObject);
var
  bchkState : Boolean;
  stBuildingCode,stFloorCode,stAreaCode:string;
begin
  with (Sender as TAdvStringGrid) do
  begin
    GetCheckBoxState(0,Row, bchkState);
    if bchkState then ed_sCardNo.Text := Cells[3,Row]
    else ed_sCardNo.Text := '';
  end;

  if PageControl1.ActivePage.Name  = 'DoorTab' then
  begin
    stBuildingCode := BuildingCodeList.Strings[cmb_BuildingCode.itemIndex];
    stFloorCode := '';
    if cmb_FloorCode.ItemIndex > 0 then stFloorCode := FloorCodeList.Strings[cmb_FloorCode.itemIndex];
    stAreaCode := '';
    if cmb_AreaCode.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode.itemIndex];
    DoorGradeSearch(stBuildingCode,stFloorCode,stAreaCode,ed_sCardNo.text,sg_GradeDoor);
  end
  else if PageControl1.ActivePage.Name  = 'AlarmTab' then
  begin
    stBuildingCode := BuildingCodeList.Strings[cmb_BuildingCode1.itemIndex];
    stFloorCode := '';
    if cmb_FloorCode1.ItemIndex > 0 then stFloorCode := FloorCodeList.Strings[cmb_FloorCode1.itemIndex];
    stAreaCode := '';
    if cmb_AreaCode1.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode1.itemIndex];
    AlarmGradeSearch(stBuildingCode,stFloorCode,stAreaCode,ed_sCardNo.text,sg_GradeAlarm);
  end
  else if PageControl1.ActivePage.Name  = 'FoodTab' then
  begin
    stBuildingCode := BuildingCodeList.Strings[cmb_BuildingCode2.itemIndex];
    stFloorCode := '';
    if cmb_FloorCode2.ItemIndex > 0 then stFloorCode := FloorCodeList.Strings[cmb_FloorCode2.itemIndex];
    stAreaCode := '';
    if cmb_AreaCode2.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode2.itemIndex];
    FoodGradeSearch(stBuildingCode,stFloorCode,stAreaCode,ed_sCardNo.Text ,sg_GradeFood);
  end;

end;

procedure TfmCardAdmin.cmb_BuildingCodeChange(Sender: TObject);
var
  stBuildingCode,stFloorCode,stAreaCode:string;
begin
  stBuildingCode := BuildingCodeList.Strings[ cmb_BuildingCode.itemindex ];
  LoadFloorCode(stBuildingCode,cmb_FloorCode);
  stFloorCode := '';
  if cmb_FloorCode.ItemIndex > 0 then stFloorCode := FloorCodeList.Strings[cmb_FloorCode.itemIndex];
  LoadAreaCode(stBuildingCode,stFloorCode,cmb_AreaCode);
  stAreaCode := '';
  if cmb_AreaCode.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode.itemIndex];
  DoorCodeSearch(stBuildingCode,stFloorCode,stAreaCode,sg_Door);
  DoorGradeSearch(stBuildingCode,stFloorCode,stAreaCode,ed_sCardNo.text,sg_GradeDoor);

end;

procedure TfmCardAdmin.PageControl1Change(Sender: TObject);
begin
  if PageControl1.ActivePage.Name  = 'DoorTab' then    DoorSearch
  else if PageControl1.ActivePage.Name  = 'AlarmTab' then  AlarmSearch
  else if PageControl1.ActivePage.Name  = 'FoodTab' then FoodSearch;

end;

procedure TfmCardAdmin.cmb_BuildingCode1Change(Sender: TObject);
var
  stBuildingCode,stFloorCode,stAreaCode:string;
begin
  stBuildingCode := BuildingCodeList.Strings[ cmb_BuildingCode1.itemindex ];
  LoadFloorCode(stBuildingCode,cmb_FloorCode1);
  stFloorCode := '000';
  if cmb_FloorCode1.ItemIndex > 0 then stFloorCode := FloorCodeList.Strings[cmb_FloorCode1.itemIndex];
  LoadAreaCode(stBuildingCode,stFloorCode,cmb_AreaCode1);
  stAreaCode := '';
  if cmb_AreaCode1.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode1.itemIndex];
  AlarmCodeSearch(stBuildingCode,stFloorCode,stAreaCode,sg_Alarm);
  AlarmGradeSearch(stBuildingCode,stFloorCode,stAreaCode,ed_sCardNo.text,sg_GradeAlarm);

end;

procedure TfmCardAdmin.cmb_BuildingCode2Change(Sender: TObject);
var
  stBuildingCode,stFloorCode,stAreaCode:string;
begin
  stBuildingCode := BuildingCodeList.Strings[ cmb_BuildingCode2.itemindex ];
  LoadFloorCode(stBuildingCode,cmb_FloorCode2);
  stFloorCode := '000';
  if cmb_FloorCode2.ItemIndex > 0 then stFloorCode := FloorCodeList.Strings[cmb_FloorCode2.itemIndex];
  LoadAreaCode(stBuildingCode,stFloorCode,cmb_AreaCode2);
  stAreaCode := '';
  if cmb_AreaCode2.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode2.itemIndex];
  FoodCodeSearch(stBuildingCode,stFloorCode,stAreaCode,sg_Food);
  FoodGradeSearch(stBuildingCode,stFloorCode,stAreaCode,ed_sCardNo.Text ,sg_GradeFood);

end;

procedure TfmCardAdmin.cmb_FloorCodeChange(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
begin
  stBuildingCode := '000';
  stFloorCode := '000';
  stAreaCode := '000';
  if cmb_BuildingCode.itemindex > -1 then stBuildingCode := BuildingCodeList.Strings[ cmb_BuildingCode.itemindex ];
  if cmb_FloorCode.itemindex > -1 then stFloorCode := FloorCodeList.Strings[ cmb_FloorCode.itemindex ];
  LoadAreaCode(stBuildingCode,stFloorCode,cmb_AreaCode);

  if cmb_AreaCode.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode.itemIndex];
  DoorCodeSearch(stBuildingCode,stFloorCode,stAreaCode,sg_Door);
  DoorGradeSearch(stBuildingCode,stFloorCode,stAreaCode,ed_sCardNo.text,sg_GradeDoor);

end;

procedure TfmCardAdmin.cmb_FloorCode1Change(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
begin
  stBuildingCode := '000';
  stFloorCode := '000';
  stAreaCode := '000';

  if cmb_BuildingCode1.itemindex > -1 then stBuildingCode := BuildingCodeList.Strings[ cmb_BuildingCode1.itemindex ];
  if cmb_FloorCode1.itemindex > -1 then stFloorCode := FloorCodeList.Strings[ cmb_FloorCode1.itemindex ];
  LoadAreaCode(stBuildingCode,stFloorCode,cmb_AreaCode1);
  if cmb_AreaCode1.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode1.itemIndex];
  AlarmCodeSearch(stBuildingCode,stFloorCode,stAreaCode,sg_Alarm);
  AlarmGradeSearch(stBuildingCode,stFloorCode,stAreaCode,ed_sCardNo.text,sg_GradeAlarm);

end;

procedure TfmCardAdmin.cmb_FloorCode2Change(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
begin
  stBuildingCode := '000';
  stFloorCode := '000';
  stAreaCode := '000';

  if cmb_BuildingCode2.itemindex > -1 then stBuildingCode := BuildingCodeList.Strings[ cmb_BuildingCode2.itemindex ];
  if cmb_FloorCode2.itemindex > -1 then stFloorCode := FloorCodeList.Strings[ cmb_FloorCode2.itemindex ];
  LoadAreaCode(stBuildingCode,stFloorCode,cmb_AreaCode2);
  if cmb_AreaCode2.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode2.itemIndex];
  FoodCodeSearch(stBuildingCode,stFloorCode,stAreaCode,sg_Food);
  FoodGradeSearch(stBuildingCode,stFloorCode,stAreaCode,ed_sCardNo.Text ,sg_GradeFood);

end;

procedure TfmCardAdmin.cmb_AreaCodeChange(Sender: TObject);
var
  stBuildingCode,stFloorCode,stAreaCode:string;
begin
  stBuildingCode := BuildingCodeList.Strings[cmb_BuildingCode.itemIndex];
  stFloorCode := '';
  if cmb_FloorCode.ItemIndex > 0 then stFloorCode := FloorCodeList.Strings[cmb_FloorCode.itemIndex];
  stAreaCode := '';
  if cmb_AreaCode.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode.itemIndex];
  DoorCodeSearch(stBuildingCode,stFloorCode,stAreaCode,sg_Door);
  DoorGradeSearch(stBuildingCode,stFloorCode,stAreaCode,ed_sCardNo.text,sg_GradeDoor);

end;

procedure TfmCardAdmin.cmb_AreaCode1Change(Sender: TObject);
var
  stBuildingCode,stFloorCode,stAreaCode:string;
begin
  stBuildingCode := BuildingCodeList.Strings[cmb_BuildingCode1.itemIndex];
  stFloorCode := '';
  if cmb_FloorCode1.ItemIndex > 0 then stFloorCode := FloorCodeList.Strings[cmb_FloorCode1.itemIndex];
  stAreaCode := '';
  if cmb_AreaCode1.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode1.itemIndex];
  AlarmCodeSearch(stBuildingCode,stFloorCode,stAreaCode,sg_Alarm);
  AlarmGradeSearch(stBuildingCode,stFloorCode,stAreaCode,ed_sCardNo.text,sg_GradeAlarm);

end;

procedure TfmCardAdmin.cmb_AreaCode2Change(Sender: TObject);
var
  stBuildingCode,stFloorCode,stAreaCode:string;
begin
  stBuildingCode := BuildingCodeList.Strings[cmb_BuildingCode2.itemIndex];
  stFloorCode := '';
  if cmb_FloorCode2.ItemIndex > 0 then stFloorCode := FloorCodeList.Strings[cmb_FloorCode2.itemIndex];
  stAreaCode := '';
  if cmb_AreaCode2.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode2.itemIndex];
  FoodCodeSearch(stBuildingCode,stFloorCode,stAreaCode,sg_Food);
  FoodGradeSearch(stBuildingCode,stFloorCode,stAreaCode,ed_sCardNo.Text ,sg_GradeFood);

end;

procedure TfmCardAdmin.sg_CardCheckBoxClick(Sender: TObject; ACol,
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

procedure TfmCardAdmin.btn_GradeInsertClick(Sender: TObject);
var
  stBuildingCode,stFloorCode,stAreaCode : string;
  stCompanyCode : string;
begin
  if CheckCount < 1 then
  begin
    showmessage('사용자를 선택하여 주세요.');
    Exit;
  end;

  btn_GradeInsert.Enabled := False;
  Pan_Gauge.Visible := True;
  if PageControl1.ActivePage.Name  = 'DoorTab' then
  begin
    PageControl1.Enabled := False;
    InsertDoorGrade;
    PageControl1.Enabled := True;
    stBuildingCode := BuildingCodeList.Strings[cmb_BuildingCode.itemIndex];
    stFloorCode := '';
    if cmb_FloorCode.ItemIndex > 0 then stFloorCode := FloorCodeList.Strings[cmb_FloorCode.itemIndex];
    stAreaCode := '';
    if cmb_AreaCode.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode.itemIndex];
    DoorGradeSearch(stBuildingCode,stFloorCode,stAreaCode,ed_sCardNo.text,sg_GradeDoor);
  end else if PageControl1.ActivePage.Name  = 'AlarmTab' then
  begin
    PageControl1.Enabled := False;
    InsertAlarmGrade;
    PageControl1.Enabled := True;
    stBuildingCode := BuildingCodeList.Strings[cmb_BuildingCode1.itemIndex];
    stFloorCode := '';
    if cmb_FloorCode1.ItemIndex > 0 then stFloorCode := FloorCodeList.Strings[cmb_FloorCode1.itemIndex];
    stAreaCode := '';
    if cmb_AreaCode1.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode1.itemIndex];
    AlarmGradeSearch(stBuildingCode,stFloorCode,stAreaCode,ed_sCardNo.text,sg_GradeAlarm);
  end else if PageControl1.ActivePage.Name  = 'FoodTab' then
  begin
    PageControl1.Enabled := False;
    InsertFoodGrade;
    PageControl1.Enabled := True;
    stBuildingCode := BuildingCodeList.Strings[cmb_BuildingCode2.itemIndex];
    stFloorCode := '';
    if cmb_FloorCode2.ItemIndex > 0 then stFloorCode := FloorCodeList.Strings[cmb_FloorCode2.itemIndex];
    stAreaCode := '';
    if cmb_AreaCode2.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode2.itemIndex];
    FoodGradeSearch(stBuildingCode,stFloorCode,stAreaCode,ed_sCardNo.Text ,sg_GradeFood);
  end;
  Pan_Gauge.Visible := False;
  btn_GradeInsert.Enabled := TRUE;
end;

procedure TfmCardAdmin.btn_GradeDeleteClick(Sender: TObject);
var
  i : integer;
  bChkState : Boolean;
  stCompanyCode,stBuildingCode,stFloorCode,stAreaCode : string;
begin
  if CheckCount < 1 then
  begin
    showmessage('사용자를 선택하여 주세요.');
    Exit;
  end;
  if CheckCount > 1 then
  begin
    showmessage('권한 삭제는 한명씩만 가능합니다. 사용자를 한명만 선택하여 주세요.');
    Exit;
  end;
  {
  for i := 1 to sg_Card.RowCount - 1 do
  begin
    sg_Card.GetCheckBoxState(0,i, bchkState);
    if bChkState then
    begin
      ed_CardNo.Text := sg_Card.Cells[0,i];
      break;
    end;
  end;  }

  if PageControl1.ActivePage.Name  = 'DoorTab' then
  begin
    PageControl1.Enabled := False;
    DeleteDoorGrade;
    PageControl1.Enabled := True;
    stBuildingCode := BuildingCodeList.Strings[cmb_BuildingCode.itemIndex];
    stFloorCode := '';
    if cmb_FloorCode.ItemIndex > 0 then stFloorCode := FloorCodeList.Strings[cmb_FloorCode.itemIndex];
    stAreaCode := '';
    if cmb_AreaCode.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode.itemIndex];
    DoorGradeSearch(stBuildingCode,stFloorCode,stAreaCode,ed_sCardNo.text,sg_GradeDoor);
  end else if PageControl1.ActivePage.Name  = 'AlarmTab' then
  begin
    PageControl1.Enabled := False;
    DeleteAlarmGrade;
    PageControl1.Enabled := True;
    stBuildingCode := BuildingCodeList.Strings[cmb_BuildingCode1.itemIndex];
    stFloorCode := '';
    if cmb_FloorCode1.ItemIndex > 0 then stFloorCode := FloorCodeList.Strings[cmb_FloorCode1.itemIndex];
    stAreaCode := '';
    if cmb_AreaCode1.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode1.itemIndex];
    AlarmGradeSearch(stBuildingCode,stFloorCode,stAreaCode,ed_sCardNo.text,sg_GradeAlarm);
  end else if PageControl1.ActivePage.Name  = 'FoodTab' then
  begin
    PageControl1.Enabled := False;
    DeleteFoodGrade;
    PageControl1.Enabled := True;
    stBuildingCode := BuildingCodeList.Strings[cmb_BuildingCode2.itemIndex];
    stFloorCode := '';
    if cmb_FloorCode2.ItemIndex > 0 then stFloorCode := FloorCodeList.Strings[cmb_FloorCode2.itemIndex];
    stAreaCode := '';
    if cmb_AreaCode2.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode2.itemIndex];
    FoodGradeSearch(stBuildingCode,stFloorCode,stAreaCode,ed_sCardNo.Text ,sg_GradeFood);
  end;
end;

procedure TfmCardAdmin.chk_NonGradeClick(Sender: TObject);
begin
  if G_nSearchIndex = 0 then btn_SearchClick(Self);

end;

procedure TfmCardAdmin.cmb_ComPortChange(Sender: TObject);
begin
  if cmb_ComPort.text = '' then Exit;
  ReaderPort.Open := False;
  ReaderPort.ComNumber := Integer(ComPortList.Objects[cmb_ComPort.ItemIndex]);
  //ReaderPort.ComNumber := strtoint(copy(cmb_ComPort.text,4,Pos(':',cmb_ComPort.text) -4));
  ReaderPort.Open := true;

end;

procedure TfmCardAdmin.FormShow(Sender: TObject);
begin
  if Not IsMaster then
  begin
    if IsInsertGrade then btn_GradeInsert.Enabled := True
    else btn_GradeInsert.Enabled := False;
    if IsDeleteGrade then btn_GradeDelete.Enabled := True
    else btn_GradeDelete.Enabled := False;
  end;
{
  if FOODGRADE = 1 then FoodTab.TabVisible := False;
  if PatrolUse then
  begin
    AlarmTab.TabVisible := True;
  end else
  begin
    AlarmTab.TabVisible := False;
  end;   }
end;

procedure TfmCardAdmin.cmb_JijumChange(Sender: TObject);
begin
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
  if G_nSearchIndex = 0 then btn_SearchClick(Self);

end;

initialization
  RegisterClass(TfmCardAdmin);
Finalization
  UnRegisterClass(TfmCardAdmin);
end.
