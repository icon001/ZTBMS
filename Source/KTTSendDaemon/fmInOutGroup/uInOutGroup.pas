unit uInOutGroup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, Grids, BaseGrid, AdvGrid, DB, ADODB;

type
  TfmInOutGroup = class(TForm)
    Panel12: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    cmb_InOutGroup: TComboBox;
    btn_Close: TSpeedButton;
    Panel1: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel2: TPanel;
    btn_GradeInsert: TSpeedButton;
    btn_GradeDelete: TSpeedButton;
    Panel14: TPanel;
    Panel5: TPanel;
    sg_NonGroupDoor: TAdvStringGrid;
    sg_GroupDoor: TAdvStringGrid;
    btn_RefreshGroup: TSpeedButton;
    ADOTempQuery: TADOQuery;
    ed_inOutGroupName: TEdit;
    Timer2: TTimer;
    procedure btn_RefreshGroupClick(Sender: TObject);
    procedure cmb_InOutGroupChange(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btn_GradeInsertClick(Sender: TObject);
    procedure btn_GradeDeleteClick(Sender: TObject);
    procedure cmb_InOutGroupKeyPress(Sender: TObject; var Key: Char);
    procedure sg_NonGroupDoorCheckBoxClick(Sender: TObject; ACol,
      ARow: Integer; State: Boolean);
    procedure sg_GroupDoorCheckBoxClick(Sender: TObject; ACol,
      ARow: Integer; State: Boolean);
  private
    { Private declarations }
    Procedure LoadInOutGroup;
    procedure InOutGroupSearch(aInOutGroupName:string);
    procedure NonGroupDoorSearch(aInOutGroupName:string);
    procedure GroupDoorSearch(aInOutGroupName:string);
    procedure InsertInOutGroupDoor(aInOutGroupName:string);
    procedure DeleteInOutGroupDoor(aInOutGroupName:string);
    function InsertTB_InOutGroup(aInOutGroupName,aNodeNo,aECUID,aDoorNO:string):Boolean;
    function DeleteTB_InOutGroup(aInOutGroupName,aNodeNo,aECUID,aDoorNO:string):Boolean;
  public
    { Public declarations }
    procedure GridInit(sg:TAdvStringGrid;aCol:integer);
    procedure AdvStrinGridSetAllCheck(Sender: TObject;bchkState:Boolean);
  end;

var
  fmInOutGroup: TfmInOutGroup;

implementation

uses
  uDataModule1, uInOutGroupName;
{$R *.dfm}

procedure TfmInOutGroup.btn_RefreshGroupClick(Sender: TObject);
begin
  LoadInOutGroup;
end;

procedure TfmInOutGroup.LoadInOutGroup;
var
  stSql :string;
begin
  cmb_InOutGroup.Clear;

  cmb_InOutGroup.Items.Add('');
  cmb_InOutGroup.ItemIndex := 0;
  cmb_InOutGroup.Items.Add('입실그룹추가');

  stSql := 'select io_groupname from tb_inoutgroup ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' Group by io_groupname ';
  with ADOTempQuery do
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
      cmb_InOutGroup.Items.Add(FindField('io_groupname').AsString);
      Next;
    end;
  end;

end;

procedure TfmInOutGroup.cmb_InOutGroupChange(Sender: TObject);
begin
  if cmb_InOutGroup.ItemIndex = 1 then
  begin
    ed_inOutGroupName.Text := '';
    fmInOutGroupName:= TfmInOutGroupName.Create(Self);
    fmInOutGroupName.Showmodal;
    fmInOutGroupName.Free;

    cmb_InOutGroup.Text := ed_inOutGroupName.Text;
    Timer2.Enabled := True;
    Exit;
  end;
  InOutGroupSearch(cmb_InOutGroup.Text);

end;

procedure TfmInOutGroup.Timer2Timer(Sender: TObject);
begin
  Timer2.Enabled := False;
  if ed_inOutGroupName.Text = '' then
  begin
    cmb_InOutGroup.ItemIndex := 0;
    Exit;
  end;
  cmb_InOutGroup.Text := ed_inOutGroupName.Text;
  ed_inOutGroupName.Text := '';
  InOutGroupSearch(cmb_InOutGroup.Text);
end;

procedure TfmInOutGroup.InOutGroupSearch(aInOutGroupName: string);
begin
  NonGroupDoorSearch(aInOutGroupName);
  GroupDoorSearch(aInOutGroupName);
end;

procedure TfmInOutGroup.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmInOutGroup.FormActivate(Sender: TObject);
begin
  LoadInOutGroup;
end;

procedure TfmInOutGroup.GroupDoorSearch(aInOutGroupName: string);
var
  stSql : string;
  nRow : integer;
begin
  GridInit(sg_GroupDoor,1);
  stSql := 'Select a.* from TB_DOOR a ';
  stSql := stSql + ' INNER JOIN TB_INOUTGROUP b ';
  stSql := stSql + ' ON ( B.GROUP_CODE = a.GROUP_CODE ';
  stSql := stSql + ' AND B.AC_NODENO = a.AC_NODENO ';
  stSql := stSql + ' AND B.AC_ECUID = a.AC_ECUID ';
  stSql := stSql + ' AND B.DO_DOORNO = a.DO_DOORNO ';
  stSql := stSql + ' AND B.IO_GROUPNAME = ''' + aInOutGroupName + ''' ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' Order By a.DO_VIEWSEQ ';

  with ADOTempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    with sg_GroupDoor do
    begin
      RowCount := RecordCount + 1;
      nRow := 1;
      While Not Eof do
      begin
        cells[0,nRow] := FindField('DO_DOORNONAME').AsString;
        cells[1,nRow] := inttostr(FindField('AC_NODENO').AsInteger);
        cells[2,nRow] := FindField('AC_ECUID').AsString;
        cells[3,nRow] := FindField('DO_DOORNO').AsString;
        AddCheckBox(0,nRow,False,False);
        inc(nRow);
        Next;
      end;
    end;
  end;

end;

procedure TfmInOutGroup.NonGroupDoorSearch(aInOutGroupName: string);
var
  stSql : string;
  nRow : integer;
begin
  GridInit(sg_NonGroupDoor,1);
  stSql := 'Select a.* from TB_DOOR a ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND NOT EXISTS (SELECT AC_NODENO,AC_ECUID,DO_DOORNO FROM TB_INOUTGROUP B ';
  stSql := stSql + ' WHERE B.GROUP_CODE = a.GROUP_CODE ';
  stSql := stSql + ' AND B.AC_NODENO = a.AC_NODENO ';
  stSql := stSql + ' AND B.AC_ECUID = a.AC_ECUID ';
  stSql := stSql + ' AND B.DO_DOORNO = a.DO_DOORNO ';
  stSql := stSql + ' AND B.IO_GROUPNAME = ''' + aInOutGroupName + ''' ) ';
  stSql := stSql + ' Order By a.DO_VIEWSEQ ';

  with ADOTempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    with sg_NonGroupDoor do
    begin
      RowCount := RecordCount + 1;
      nRow := 1;
      While Not Eof do
      begin
        cells[0,nRow] := FindField('DO_DOORNONAME').AsString;
        cells[1,nRow] := inttostr(FindField('AC_NODENO').AsInteger);
        cells[2,nRow] := FindField('AC_ECUID').AsString;
        cells[3,nRow] := FindField('DO_DOORNO').AsString;
        AddCheckBox(0,nRow,False,False);
        inc(nRow);
        Next;
      end;
    end;
  end;

end;

procedure TfmInOutGroup.GridInit(sg: TAdvStringGrid; aCol: integer);
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

procedure TfmInOutGroup.btn_GradeInsertClick(Sender: TObject);
begin
  btn_GradeInsert.Enabled := False;

  InsertInOutGroupDoor(cmb_InOutGroup.Text);

  btn_GradeInsert.Enabled := True;
  //InOutGroupSearch(cmb_InOutGroup.Text);
end;

procedure TfmInOutGroup.btn_GradeDeleteClick(Sender: TObject);
begin
  btn_GradeDelete.Enabled := False;

  DeleteInOutGroupDoor(cmb_InOutGroup.Text);

  btn_GradeDelete.Enabled := True;
  //InOutGroupSearch(cmb_InOutGroup.Text);
end;

procedure TfmInOutGroup.DeleteInOutGroupDoor(aInOutGroupName:string);
var
  bchkState : Boolean;
  stNodeNo,stECUID,stDoorNO : string;
  DoorLoop : integer;
  nChkCount : integer;
begin
  nChkCount := 0;
  for DoorLoop := 1 to sg_GroupDoor.RowCount - 1 do   //체크되어 있는 사용자 모두를 인서트 시킴
  begin
    sg_GroupDoor.GetCheckBoxState(0,DoorLoop, bchkState);
    if bChkState then
    begin
      inc(nChkCount);
      stNodeNo:= sg_GroupDoor.Cells[1,DoorLoop];
      stECUID:= sg_GroupDoor.Cells[2,DoorLoop];
      stDoorNO := sg_GroupDoor.Cells[3,DoorLoop];
      DeleteTB_InOutGroup(aInOutGroupName,stNodeNo,stECUID,stDoorNO);
    end;
  end;
  if nChkCount = 0 then
  begin
    showmessage('등록할 출입문을 선택해 주세요.');
    Exit;
  end;
  LoadInOutGroup;
  ed_inOutGroupName.Text := aInOutGroupName;
  Timer2.Enabled := True;

end;

procedure TfmInOutGroup.InsertInOutGroupDoor(aInOutGroupName:string);
var
  bchkState : Boolean;
  stNodeNo,stECUID,stDoorNO : string;
  DoorLoop : integer;
  nChkCount : integer;
begin
  nChkCount := 0;
  for DoorLoop := 1 to sg_NonGroupDoor.RowCount - 1 do   //체크되어 있는 사용자 모두를 인서트 시킴
  begin
    sg_NonGroupDoor.GetCheckBoxState(0,DoorLoop, bchkState);
    if bChkState then
    begin
      inc(nChkCount);
      stNodeNo:= sg_NonGroupDoor.Cells[1,DoorLoop];
      stECUID:= sg_NonGroupDoor.Cells[2,DoorLoop];
      stDoorNO := sg_NonGroupDoor.Cells[3,DoorLoop];
      InsertTB_InOutGroup(aInOutGroupName,stNodeNo,stECUID,stDoorNO);
    end;
  end;
  if nChkCount = 0 then
  begin
    showmessage('등록할 출입문을 선택해 주세요.');
    Exit;
  end;
  LoadInOutGroup;
  ed_inOutGroupName.Text := aInOutGroupName;
  Timer2.Enabled := True;
  //InOutGroupSearch(aInOutGroupName);

end;

function TfmInOutGroup.DeleteTB_InOutGroup(aInOutGroupName, aNodeNo,
  aECUID, aDoorNO: string): Boolean;
var
  stSql :string;
begin
  stSql := 'Delete From TB_INOUTGROUP ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND IO_GROUPNAME = ''' + aInOutGroupName + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ''' + aDoorNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmInOutGroup.InsertTB_InOutGroup(aInOutGroupName, aNodeNo,
  aECUID, aDoorNO: string): Boolean;
var
  stSql :string;
begin
  stSql := 'Insert Into TB_INOUTGROUP (';
  stSql := stSql + ' GROUP_CODE, ';
  stSql := stSql + ' IO_GROUPNAME, ';
  stSql := stSql + ' AC_NODENO, ';
  stSql := stSql + ' AC_ECUID, ';
  stSql := stSql + ' DO_DOORNO ) ';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aInOutGroupName + ''',';
  stSql := stSql + ' ' + aNodeNo + ',';
  stSql := stSql + '''' + aECUID + ''',';
  stSql := stSql + '''' + aDoorNO + ''') ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmInOutGroup.cmb_InOutGroupKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key := #0;
end;

procedure TfmInOutGroup.sg_NonGroupDoorCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
  if ARow = 0 then //전체선택 또는 해제
  begin
    AdvStrinGridSetAllCheck(Sender,State);
  end;

end;

procedure TfmInOutGroup.sg_GroupDoorCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
  if ARow = 0 then //전체선택 또는 해제
  begin
    AdvStrinGridSetAllCheck(Sender,State);
  end;

end;

procedure TfmInOutGroup.AdvStrinGridSetAllCheck(Sender: TObject;
  bchkState: Boolean);
var
  i : integer;
begin
    for i:= 1 to (Sender as TAdvStringGrid).RowCount - 1  do
    begin
      (Sender as TAdvStringGrid).SetCheckBoxState(0,i,bchkState);
    end;

end;

end.
