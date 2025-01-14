unit uSequenceChange;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Grids, BaseGrid, AdvGrid, Buttons,
  DB, ADODB,ActiveX, uSubForm, CommandArray;

type
  TfmSequenceChange = class(TfmASubForm)
    GroupBox1: TGroupBox;
    Label13: TLabel;
    cmb_BuildingCode: TComboBox;
    Label15: TLabel;
    cmb_FloorCode: TComboBox;
    cmb_AreaCode: TComboBox;
    Label23: TLabel;
    Panel1: TPanel;
    pc_device: TPageControl;
    tb_Door: TTabSheet;
    tb_Alarm: TTabSheet;
    sg_Alarm: TAdvStringGrid;
    sg_Door: TAdvStringGrid;
    Label1: TLabel;
    ed_sequence: TEdit;
    btn_Search: TBitBtn;
    btn_Close: TSpeedButton;
    btn_sequenceChange: TBitBtn;
    ADOQuery: TADOQuery;
    Label2: TLabel;
    cmb_MCU: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure cmb_BuildingCodeChange(Sender: TObject);
    procedure cmb_FloorCodeChange(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure sg_DoorCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure sg_AlarmCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure btn_sequenceChangeClick(Sender: TObject);
    procedure cmb_AreaCodeChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmb_MCUChange(Sender: TObject);
  private
    BuildingCodeList : TStringList;
    FloorCodeList : TStringList;
    AreaCodeList : TStringList;
    MCUCodeList : TStringList;
    { Private declarations }
    procedure LoadBuildingCode(cmb_Box:TComboBox);
    procedure LoadFloorCode(aBuildingCode:string;cmb_Box:TComboBox);
    procedure LoadAreaCode(aBuildingCode,aFloorCode:string;cmb_Box:TComboBox);
    procedure LoadMCUCode(aBuildingCode,aFloorCode,aAreaCode:string;cmb_Box:TComboBox);

    procedure LoadDoor(aBuildingCode,aFloorCode,aAreaCode,aNodeNo:string;sg: TAdvStringGrid);
    procedure LoadAlarm(aBuildingCode,aFloorCode,aAreaCode,aNodeNo:string; sg: TAdvStringGrid);

    procedure AdvStrinGridSetAllCheck(Sender: TObject;bchkState:Boolean);
    procedure DoorSequenceChange;
    procedure AlarmSequenceChange;

    function TB_ALARMDEVICE_ViewSeqChange(aNodeNo,aEcuID,aSeq:string):Boolean;
    function TB_DOOR_ViewSeqChange(aNodeNo,aEcuID,aDoorNo,aSeq:string):Boolean;
  public
    { Public declarations }
  end;

var
  fmSequenceChange: TfmSequenceChange;

implementation
uses
  uDataModule1,
  uMssql,
  uPostGreSql,
  uMDBSql,
  uFireBird,
  uLomosUtil;

{$R *.dfm}

{ TfmSequenceChange }

procedure TfmSequenceChange.LoadAreaCode(aBuildingCode, aFloorCode: string;
  cmb_Box: TComboBox);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  AreaCodeList.Clear;

  cmb_Box.Items.Add('전체');
  AreaCodeList.Add('000');
  cmb_Box.ItemIndex := 0;

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
  stSql := stsql + ' order by LO_DONGCODE,LO_FLOORCODE,LO_AREACODE ';

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

      First;
      While Not Eof do
      begin
        cmb_Box.Items.Add(FindField('LO_NAME').AsString );
        AreaCodeList.Add(FindField('LO_AREACODE').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmSequenceChange.LoadBuildingCode(cmb_Box: TComboBox);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  BuildingCodeList.Clear;

  cmb_Box.Items.Add('전체');
  BuildingCodeList.Add('000');
  cmb_Box.ItemIndex := 0;

  stSql := 'select * from TB_LOCATION ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND LO_GUBUN = ''0'' ';
  stSql := stSql + ' order by LO_DONGCODE ';
  
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

      First;
      While Not Eof do
      begin
        cmb_Box.Items.Add(FindField('LO_NAME').AsString );
        BuildingCodeList.Add(FindField('LO_DONGCODE').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmSequenceChange.LoadFloorCode(aBuildingCode: string;
  cmb_Box: TComboBox);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  FloorCodeList.Clear;

  cmb_Box.Items.Add('전체');
  FloorCodeList.Add('000');
  cmb_Box.ItemIndex := 0;

  stSql := 'select * from TB_LOCATION ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND LO_GUBUN = ''1'' ';

  if (aBuildingCode <> '') And (aBuildingCode <> '000')  then
  begin
    stSql := stSql + ' AND LO_DONGCODE = ''' + aBuildingCode + '''';
  end else Exit;
  stSql := stSql + ' order by LO_DONGCODE,LO_FLOORCODE ';

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

      First;
      While Not Eof do
      begin
        cmb_Box.Items.Add(FindField('LO_NAME').AsString );
        FloorCodeList.Add(FindField('LO_FLOORCODE').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmSequenceChange.FormCreate(Sender: TObject);
begin
  BuildingCodeList := TStringList.Create;
  FloorCodeList := TStringList.Create;
  AreaCodeList := TStringList.Create;
  MCUCodeList := TStringList.Create;


  LoadBuildingCode(cmb_BuildingCode);
  LoadFloorCode('000',cmb_FloorCode);
  LoadAreaCode('000','000',cmb_AreaCode);
  LoadMCUCode('000','000','000',cmb_MCU);
end;

procedure TfmSequenceChange.cmb_BuildingCodeChange(Sender: TObject);
var
  stBuildingCode : string;
begin
  if cmb_BuildingCode.itemindex < 0 then
  begin
    cmb_BuildingCode.Text := '전체';
    Exit;
  end;
  stBuildingCode := BuildingCodeList.Strings[ cmb_BuildingCode.itemindex ];
  LoadFloorCode(stBuildingCode,cmb_FloorCode);
  LoadAreaCode('000','000',cmb_AreaCode);
  LoadMCUCode(stBuildingCode,'000','000',cmb_MCU);
  btn_SearchClick(self);
end;

procedure TfmSequenceChange.cmb_FloorCodeChange(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
begin
  if cmb_BuildingCode.itemindex < 0 then Exit;
  stBuildingCode := BuildingCodeList.Strings[ cmb_BuildingCode.itemindex ];
  if cmb_FloorCode.itemindex < 0 then exit;
  stFloorCode := FloorCodeList.Strings[ cmb_FloorCode.itemindex ];
  LoadAreaCode(stBuildingCode,stFloorCode,cmb_AreaCode);
  LoadMCUCode(stBuildingCode,stFloorCode,'000',cmb_MCU);
  btn_SearchClick(self);
end;

procedure TfmSequenceChange.btn_SearchClick(Sender: TObject);
var
  stBuildingCode,stFloorCode,stAreaCode : string;
  stNodeNo : string;
begin
  stBuildingCode := '000';
  stFloorCode := '000';
  stAreaCode := '000';
  stNodeNo := '000';
  if cmb_BuildingCode.itemIndex > 0 then
    stBuildingCode := BuildingCodeList.Strings[cmb_BuildingCode.itemIndex];
  if cmb_FloorCode.itemIndex > 0 then
    stFloorCode := FloorCodeList.Strings[cmb_FloorCode.itemIndex];
  if cmb_AreaCode.itemIndex > 0 then
    stAreaCode := AreaCodeList.Strings[cmb_AreaCode.itemIndex];
  if cmb_MCU.ItemIndex > 0 then
    stNodeNo := MCUCodeList.Strings[cmb_MCU.ItemIndex];
  LoadDoor(stBuildingCode,stFloorCode,stAreaCode,stNodeNo,sg_Door);
  LoadAlarm(stBuildingCode,stFloorCode,stAreaCode,stNodeNo,sg_Alarm);
end;

procedure TfmSequenceChange.LoadAlarm(aBuildingCode, aFloorCode,
  aAreaCode,aNodeNo: string; sg: TAdvStringGrid);
var
  stSql : string;
  nRow : integer;
  i : integer;
begin
  GridInit(sg,1,2,True);
  {sg.RowCount := 2;
  sg.RemoveCheckBox(0,1);
  sg.SetCheckBoxState(0,0,False);
  for i:= 0 to sg.ColCount - 1 do
  begin
    sg.Cells[i,1] := '';
  end; }

  if DBTYPE = 'MDB' then stSql := MDBSql.selectTB_ALARMDEVICEJoinAdmin(aBuildingCode,aFloorCode,aAreaCode,aNodeNo)
  else if DBTYPE = 'PG' then stSql := PostGreSql.selectTB_ALARMDEVICEJoinAdmin(aBuildingCode,aFloorCode,aAreaCode,aNodeNo)
  else if DBTYPE = 'MSSQL' then stSql:= MSSql.selectTB_ALARMDEVICEJoinAdmin(aBuildingCode,aFloorCode,aAreaCode,aNodeNo)
  else if DBTYPE = 'FB' then stSql:= FireBird.selectTB_ALARMDEVICEJoinAdmin(aBuildingCode,aFloorCode,aAreaCode,aNodeNo)
  else Exit;
  stSql := stSql + ' Order by a.AC_NODENO,a.AC_ECUID ';

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
        AddCheckBox(0,nRow,True,False);
        
        nRow := nRow + 1;
        Next;
      end;
    end;
  end;
end;

procedure TfmSequenceChange.LoadDoor(aBuildingCode, aFloorCode,
  aAreaCode,aNodeNo: string;sg: TAdvStringGrid);
var
  stSql : string;
  nRow : integer;
  i : integer;
begin
  GridInit(sg,1,2,True);
  {sg.RowCount := 2;
  sg.RemoveCheckBox(0,1);
  sg.SetCheckBoxState(0,0,False);
  for i:= 0 to sg.ColCount - 1 do
  begin
    sg.Cells[i,1] := '';
  end;  }
  
  if DBTYPE = 'MDB' then stSql := MDBSql.selectTB_DOORJoinAdmin(aBuildingCode,aFloorCode,aAreaCode,False,aNodeNo)
  else if DBTYPE = 'PG' then stSql := PostGreSql.selectTB_DOORJoinAdmin(aBuildingCode,aFloorCode,aAreaCode,False,aNodeNo)
  else if DBTYPE = 'MSSQL' then stSql := MssQl.selectTB_DOORJoinAdmin(aBuildingCode,aFloorCode,aAreaCode,False,aNodeNo)
  else if DBTYPE = 'FB' then stSql := FireBird.selectTB_DOORJoinAdmin(aBuildingCode,aFloorCode,aAreaCode,False,aNodeNo)
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
        AddCheckBox(0,nRow,True,False);

        nRow := nRow + 1;
        Next;
      end;
    end;
  end;
end;

procedure TfmSequenceChange.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmSequenceChange.sg_DoorCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
  if ARow = 0 then //전체선택 또는 해제
  begin
    AdvStrinGridSetAllCheck(Sender,State);
  end;

end;

procedure TfmSequenceChange.sg_AlarmCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
  if ARow = 0 then //전체선택 또는 해제
  begin
    AdvStrinGridSetAllCheck(Sender,State);
  end;

end;

procedure TfmSequenceChange.AdvStrinGridSetAllCheck(Sender: TObject;
  bchkState: Boolean);
var
  i : integer;
begin
    for i:= 1 to (Sender as TAdvStringGrid).RowCount - 1  do
    begin
      (Sender as TAdvStringGrid).SetCheckBoxState(0,i,bchkState);
    end;

end;

procedure TfmSequenceChange.btn_sequenceChangeClick(Sender: TObject);
begin
  if pc_device.ActivePage = tb_Door then
  begin
    DoorSequenceChange;
  end else if pc_device.ActivePage = tb_Alarm then
  begin
    AlarmSequenceChange;
  end;

end;

procedure TfmSequenceChange.AlarmSequenceChange;
var
  nStartSeq : integer;
  nRow : integer;
  bChange : Boolean;
  bchkState : Boolean;
  stNodeNo : string;
  stEcuID : string;
begin
  if Not isDigit(ed_sequence.Text) then
  begin
    showmessage('조회순서는 숫자로 입력하셔야 합니다.');
    Exit;
  end;
  nStartSeq := strtoint(ed_sequence.Text);
  bChange := False;
  for nRow := 1 to sg_Alarm.RowCount - 1 do
  begin
    sg_Alarm.GetCheckBoxState(0,nRow, bchkState);
    if bchkState then
    begin
      bChange := True;
      stNodeNo := sg_Alarm.cells[2,nRow];
      stEcuID := sg_Alarm.cells[4,nRow];

      TB_ALARMDEVICE_ViewSeqChange(stNodeNo,stEcuID,inttostr(nStartSeq));
      inc(nStartSeq);
    end;
  end;
  if Not bChange then
  begin
    showmessage('방범구역을 선택하지 않으셨습니다.');
  end else
  begin
    showmessage('조회순서 변경 완료.');
  end;
end;

procedure TfmSequenceChange.DoorSequenceChange;
var
  nStartSeq : integer;
  nRow : integer;
  bChange : Boolean;
  bchkState : Boolean;
  stNodeNo : string;
  stEcuID : string;
  stDoorNo : string;
begin
  if Not isDigit(ed_sequence.Text) then
  begin
    showmessage('조회순서는 숫자로 입력하셔야 합니다.');
    Exit;
  end;
  nStartSeq := strtoint(ed_sequence.Text);
  bChange := False;
  for nRow := 1 to sg_Door.RowCount - 1 do
  begin
    sg_Door.GetCheckBoxState(0,nRow, bchkState);
    if bchkState then
    begin
      bChange := True;
      stDoorNo := sg_Door.cells[1,nRow];
      stNodeNo := sg_Door.cells[2,nRow];
      stEcuID := sg_Door.cells[4,nRow];

      TB_DOOR_ViewSeqChange(stNodeNo,stEcuID,stDoorNo,inttostr(nStartSeq));
      inc(nStartSeq);
    end;
  end;
  if Not bChange then
  begin
    showmessage('출입문을 선택하지 않으셨습니다.');
  end else
  begin
    showmessage('조회순서 변경 완료.');
  end;


end;

function TfmSequenceChange.TB_ALARMDEVICE_ViewSeqChange(aNodeNo, aEcuID,
  aSeq: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_ALARMDEVICE set AL_VIEWSEQ = ' + aSeq ;
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmSequenceChange.TB_DOOR_ViewSeqChange(aNodeNo, aEcuID,
  aDoorNo, aSeq: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_DOOR set DO_VIEWSEQ = ' + aSeq ;
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ''' + aDoorNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmSequenceChange.cmb_AreaCodeChange(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
begin
  if cmb_BuildingCode.itemindex < 0 then Exit;
  stBuildingCode := BuildingCodeList.Strings[ cmb_BuildingCode.itemindex ];
  if cmb_FloorCode.itemindex < 0 then exit;
  stFloorCode := FloorCodeList.Strings[ cmb_FloorCode.itemindex ];
  if cmb_AreaCode.itemindex < 0 then exit;
  stAreaCode := AreaCodeList.Strings[ cmb_AreaCode.itemindex ];
  LoadMCUCode(stBuildingCode,stFloorCode,stAreaCode,cmb_MCU);
  btn_SearchClick(self);
end;

procedure TfmSequenceChange.FormShow(Sender: TObject);
begin
  inherited;
  btn_SearchClick(self);
end;

procedure TfmSequenceChange.LoadMCUCode(aBuildingCode, aFloorCode,
  aAreaCode: string; cmb_Box: TComboBox);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  MCUCodeList.Clear;

  cmb_Box.Items.Add('전체');
  MCUCodeList.Add('000');
  cmb_Box.ItemIndex := 0;

  stSql := 'select * from TB_ACCESSDEVICE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_ECUID = ''00'' ';
  if (aBuildingCode <> '') And (aBuildingCode <> '000')  then
  begin
    stSql := stSql + ' AND LO_DONGCODE = ''' + aBuildingCode + '''';
    if (aFloorCode <> '') And (aFloorCode <> '000')  then
    begin
      stSql := stSql + ' AND LO_FLOORCODE = ''' + aFloorCode + '''';
      if (aAreaCode <> '') And (aAreaCode <> '000')  then
      begin
        stSql := stSql + ' AND LO_AREACODE = ''' + aAreaCode + '''';
      end;
    end;
  end;
  stSql := stSql + ' order by AC_VIEWSEQ,AC_NODENO ';

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

      First;
      While Not Eof do
      begin
        cmb_Box.Items.Add(FindField('AC_DEVICENAME').AsString );
        MCUCodeList.Add(FillZeroNumber(FindField('AC_NODENO').AsInteger,3));
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmSequenceChange.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  BuildingCodeList.Free;
  FloorCodeList.Free;
  AreaCodeList.Free;
  MCUCodeList.Free;
end;

procedure TfmSequenceChange.cmb_MCUChange(Sender: TObject);
begin
  inherited;
  btn_SearchClick(self);

end;

end.
