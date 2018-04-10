unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Buttons, ExtCtrls, Grids, AdvObj, BaseGrid, AdvGrid,
  StdCtrls, DB, ADODB, Gauges;

type
  TfmGroupGrade = class(TForm)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    cmb_GroupCode: TComboBox;
    sg_Door: TAdvStringGrid;
    Panel1: TPanel;
    btn_Save: TSpeedButton;
    btn_Close: TSpeedButton;
    StatusBar1: TStatusBar;
    ADOQuery1: TADOQuery;
    Pan_Gauge: TPanel;
    Gauge1: TGauge;
    StaticText1: TStaticText;
    ADOQuery2: TADOQuery;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmb_GroupCodeChange(Sender: TObject);
    procedure sg_DoorCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure btn_SaveClick(Sender: TObject);
  private
    GroupCodeList : TStringList;
    { Private declarations }
    function LoadGroupCode:Boolean;
    function LoadDoor : Boolean;
    Function CheckTB_DEVICECARDNO_Group(aGroup,aNodeNo,aECUID : String):Boolean;
    function DoorGradeSetting(aGroupCode:string):Boolean;
    function DoorCheck(aNodeNo,aEcuID,aDoorNo:string):Boolean;
    Function InsertTB_DEVICECARDNO_Group(aGroup,aNodeNo,aECUID,aDoorNO,aTimCode,aPermit,aValue,aGubun:string):Boolean;
    Function UpdateTB_DEVICECARDNO_Group(aGroup,aNodeNo,aECUID,aDoorNO,aTimCode,aPermit,aValue,aGubun: string):Boolean;
    procedure AdvStrinGridSetAllCheck(Sender: TObject;bchkState:Boolean);
    procedure GridInit(sg:TAdvStringGrid;aCol:integer;aRow:integer = 2;bCheckBox:Boolean=False);
  public
    { Public declarations }
  end;

var
  fmGroupGrade: TfmGroupGrade;

implementation
uses
  unit1;

{$R *.dfm}

procedure TfmGroupGrade.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmGroupGrade.FormActivate(Sender: TObject);
begin
  LoadGroupCode;
  if cmb_GroupCode.Items.Count > 0 then
  begin
    cmb_GroupCode.ItemIndex := 0;
    cmb_GroupCodeChange(cmb_GroupCode);
  end;
end;

function TfmGroupGrade.LoadGroupCode: Boolean;
var
  stSql : string;
begin
  GroupCodeList.Clear;
  cmb_GroupCode.Items.Clear;

  stSql := 'select * from TB_DEVICECARDGROUPCODE ';

  Try

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
      if RecordCount < 1 then
      begin
        Exit;
      end;

      while Not Eof do
      begin
        GroupCodeList.Add( FindField('DG_CODE').AsString);
        cmb_GroupCode.Items.Add(FindField('DG_NAME').AsString);
        Next;
      end;
    end;
  Finally
  End;
end;

procedure TfmGroupGrade.FormCreate(Sender: TObject);
begin
  GroupCodeList := TStringList.Create;
end;

procedure TfmGroupGrade.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  GroupCodeList.Free;
end;

procedure TfmGroupGrade.cmb_GroupCodeChange(Sender: TObject);
var
  stGroupCode : string;
begin
  LoadDoor;
  if cmb_GroupCode.ItemIndex < 0 then Exit;
  stGroupCode := GroupCodeList.Strings[cmb_GroupCode.ItemIndex];
  DoorGradeSetting(stGroupCode);
end;

function TfmGroupGrade.LoadDoor: Boolean;
var
  stSql : string;
  nRow : integer;
  i : integer;
begin
  GridInit(sg_Door,2,2,True);
  stSql := ' select a.DO_DOORNONAME,a.DO_DOORNO,a.AC_NODENO,a.AC_MCUID,a.AC_ECUID,a.DO_VIEWSEQ ' ;
  stSql := stSql + ' from TB_DOOR a ';
  stSql := stsql + ' Inner Join TB_ACCESSDEVICE c ';
  stSql := stSql + ' ON ( a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = c.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = c.AC_ECUID ';
  stSql := stSql + ' AND c.AC_FDTYPE <> ''1'' )';  //식수타입은 조회 하지 말자
  stSql := stSql + ' order by a.DO_VIEWSEQ ';

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

    if RecordCount < 1 then Exit;
    First;

    with sg_Door do
    begin
      RowCount := RecordCount + 1;
      nRow := 1;
      while Not Eof do
      begin
        cells[1,nRow] := FindField('DO_DOORNONAME').AsString;
        cells[2,nRow] := FindField('AC_NODENO').AsString;
        cells[3,nRow] := FindField('AC_ECUID').AsString;
        cells[4,nRow] := FindField('DO_DOORNO').AsString;
        cells[5,nRow] := FindField('AC_NODENO').AsString + FindField('AC_ECUID').AsString + FindField('DO_DOORNO').AsString;
        AddCheckBox(0,nRow,False,False);

        nRow := nRow + 1;
        Next;
      end;
    end;
  end;
end;

procedure TfmGroupGrade.GridInit(sg: TAdvStringGrid; aCol, aRow: integer;
  bCheckBox: Boolean);
var
  i,j:integer;
begin
  with sg do
  begin
    if bCheckBox then
    begin
      RemoveCheckBox(0,0);
      RemoveCheckBox(0,1);

      AddCheckBox(0,0,False,False);
    end;
    for i:= 0 to ColCount - 1 do
    begin
      for j:= aRow - 1 to RowCount -1 do
      begin
        Cells[i,j] := '';
      end;
    end;
    RowCount := aRow;

    for i := aCol to ColCount - 1 do
    begin
      ColWidths[i] := 0;
    end;
  end;
end;

procedure TfmGroupGrade.sg_DoorCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
  if ARow = 0 then //전체선택 또는 해제
  begin
    AdvStrinGridSetAllCheck(Sender,State);
  end;
end;

procedure TfmGroupGrade.AdvStrinGridSetAllCheck(Sender: TObject;
  bchkState: Boolean);
var
  i : integer;
begin
  for i:= 1 to (Sender as TAdvStringGrid).RowCount - 1  do
  begin
    (Sender as TAdvStringGrid).SetCheckBoxState(0,i,bchkState);
  end;
end;

function TfmGroupGrade.DoorGradeSetting(aGroupCode: string): Boolean;
var
  stSql : string;
begin
  stSql := ' select * ' ;
  stSql := stSql + ' from TB_DEVICECARDNOGROUP ';
  stSql := stsql + ' Where CA_GROUP = ''' + aGroupCode + ''' ';
  stSql := stSql + ' AND DE_PERMIT = ''L'' ';

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

    if RecordCount < 1 then Exit;
    First;

    While Not Eof do
    begin
      if FindField('DE_DOOR1').AsString = 'Y' then DoorCheck(FindField('AC_NODENO').AsString,FindField('AC_ECUID').AsString,'1');
      if FindField('DE_DOOR2').AsString = 'Y' then DoorCheck(FindField('AC_NODENO').AsString,FindField('AC_ECUID').AsString,'2');
      if FindField('DE_DOOR3').AsString = 'Y' then DoorCheck(FindField('AC_NODENO').AsString,FindField('AC_ECUID').AsString,'3');
      if FindField('DE_DOOR4').AsString = 'Y' then DoorCheck(FindField('AC_NODENO').AsString,FindField('AC_ECUID').AsString,'4');
      if FindField('DE_DOOR5').AsString = 'Y' then DoorCheck(FindField('AC_NODENO').AsString,FindField('AC_ECUID').AsString,'5');
      if FindField('DE_DOOR6').AsString = 'Y' then DoorCheck(FindField('AC_NODENO').AsString,FindField('AC_ECUID').AsString,'6');
      if FindField('DE_DOOR7').AsString = 'Y' then DoorCheck(FindField('AC_NODENO').AsString,FindField('AC_ECUID').AsString,'7');
      if FindField('DE_DOOR8').AsString = 'Y' then DoorCheck(FindField('AC_NODENO').AsString,FindField('AC_ECUID').AsString,'8');
      Next;
      Application.ProcessMessages;
    end;
  end;

end;

function TfmGroupGrade.DoorCheck(aNodeNo, aEcuID,
  aDoorNo: string): Boolean;
var
  i : integer;
  stDoorID : string;
begin
  result := False;
  stDoorID := aNodeNo + aEcuID + aDoorNo;
  with sg_Door do
  begin
    for i := 1 to RowCount - 1 do
    begin
      if cells[5,i] = stDoorID then
      begin
        result := True;
        AddCheckBox(0,i,True,False);
        break;
      end;
    end;
  end;
end;

procedure TfmGroupGrade.btn_SaveClick(Sender: TObject);
var
  i : integer;
  bchkState : Boolean;
  stGroupCode : string;
  stPermit : string;
  stNodeNo : string;
  stECUID : string;
  stDoorNO : string;
  bResult : Boolean;
begin
  if cmb_GroupCode.ItemIndex < 0 then Exit;
  stGroupCode := GroupCodeList.Strings[cmb_GroupCode.ItemIndex];
  Pan_Gauge.Visible := True;

  with sg_Door do
  begin
    Gauge1.MaxValue := RowCount - 1;
    for i := 1 to RowCount - 1 do
    begin
      GetCheckBoxState(0,i, bchkState);
      if bchkState then stPermit := 'Y'
      else stPermit := 'N';
      stNodeNo:= Cells[2,i];
      stECUID:= Cells[3,i];
      stDoorNO := Cells[4,i];
      if stNodeNo = '' then break;
      bResult := CheckTB_DEVICECARDNO_Group(stGroupCode,stNodeNo,stECUID);
      if Not bResult then
         InsertTB_DEVICECARDNO_Group(stGroupCode,stNodeNo,stECUID,stDoorNO,'0','L',stPermit,'DOOR')
      else UpdateTB_DEVICECARDNO_Group(stGroupCode,stNodeNo,stECUID,stDoorNO,'0','L',stPermit,'DOOR');
      Gauge1.Progress := i;
      Application.ProcessMessages;
    end;
  end;

  Pan_Gauge.Visible := False;
end;

function TfmGroupGrade.CheckTB_DEVICECARDNO_Group(aGroup, aNodeNo,
  aECUID: String): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'select * from TB_DEVICECARDNOGROUP ';
  stSql := stSql + ' where CA_GROUP = ''' + aGroup + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ';

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
    if RecordCount < 1 then Exit;
  end;
  result := True;
end;

function TfmGroupGrade.InsertTB_DEVICECARDNO_Group(aGroup, aNodeNo, aECUID,
  aDoorNO, aTimCode, aPermit, aValue, aGubun: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' Insert Into TB_DEVICECARDNOGROUP( ';
  stSql := stSql + 'CA_GROUP,';
  stSql := stSql + 'AC_NODENO,';
  stSql := stSql + 'AC_ECUID,';
  if aGubun = 'DOOR' then
  begin
    stSql := stSql + 'DE_DOOR' + aDoorNO + ',';
    stSql := stSql + 'DE_USEACCESS,';
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
  stSql := stSql + '''' + aGroup + ''',';
  stSql := stSql + aNodeNo + ',';
  stSql := stSql + '''' + aECUID + ''',';
  if UpperCase(aGubun) = 'DOOR' then
  begin
    stSql := stSql + '''' + aValue + ''',';
    stSql := stSql + '''Y'',';
  end else if UpperCase(aGubun) = 'ALARM' then
  begin
    stSql := stSql + '''' + aValue + ''',';
  end;
  stSql := stSql + '''' + aTimCode + ''',';
  stSql := stSql + '''' + aPermit + ''',';
  stSql := stSql + '''N'',';
  stSql := stSql + '''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',';
  stSql := stSql + '''RELAY'') ';

  with ADOQuery2 do
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

function TfmGroupGrade.UpdateTB_DEVICECARDNO_Group(aGroup, aNodeNo, aECUID,
  aDoorNO, aTimCode, aPermit, aValue, aGubun: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' Update TB_DEVICECARDNOGROUP Set ';
  if UpperCase(aGubun) = 'DOOR' then
  begin
    stSql := stSql + 'DE_DOOR' + aDoorNO + ' = ''' + aValue + ''',';
    stSql := stSql + 'DE_USEACCESS = ''Y'',';
  end else if UpperCase(aGubun) = 'ALARM' then
  begin
    stSql := stSql + 'DE_USEALARM = ''' + aValue + ''',';
  end;
  stSql := stSql + 'DE_TIMECODE = ''' + aTimCode + ''',';
  stSql := stSql + 'DE_PERMIT = ''' + aPermit + ''',';
  stSql := stSql + 'DE_RCVACK = ''N'' ';
  stSql := stSql + ' Where CA_GROUP =''' + aGroup + ''' ';
  stSql := stSql + ' AND AC_NODENO =' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + '''';

  with ADOQuery2 do
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

end.
