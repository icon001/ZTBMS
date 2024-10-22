unit uGradeProgram;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, Grids, BaseGrid, AdvGrid, StdCtrls, Buttons,ADODB,
  uSubForm, CommandArray;

type
  TfmGradeProgram = class(TfmASubForm)
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    cmb_ProgramGroup: TComboBox;
    cmb_MenuGroup: TComboBox;
    sg_ProgramID: TAdvStringGrid;
    StatusBar1: TStatusBar;
    Panel3: TPanel;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    cmb_Grade: TComboBox;
    sg_GradeProgram: TAdvStringGrid;
    Panel2: TPanel;
    btn_GradeInsert: TSpeedButton;
    btn_GradeDelete: TSpeedButton;
    btn_Close: TSpeedButton;
    cmb_GradeProgramGroup: TComboBox;
    Label4: TLabel;
    cmb_GradeMenuGroup: TComboBox;
    Label5: TLabel;
    Panel12: TPanel;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmb_ProgramGroupChange(Sender: TObject);
    procedure cmb_MenuGroupChange(Sender: TObject);
    procedure cmb_GradeChange(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure sg_ProgramIDCheckBoxClick(Sender: TObject; ACol,
      ARow: Integer; State: Boolean);
    procedure sg_GradeProgramCheckBoxClick(Sender: TObject; ACol,
      ARow: Integer; State: Boolean);
    procedure btn_GradeInsertClick(Sender: TObject);
    procedure cmb_GradeProgramGroupChange(Sender: TObject);
    procedure cmb_GradeMenuGroupChange(Sender: TObject);
    procedure btn_GradeDeleteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    ProgramGroupCodeList : TStringList;
    MenuGroupCodeList : TStringList;
    MenuGradeGroupCodeList : TStringList;
    GradeCodeList : TStringList;

    procedure LoadProgramGroup;
    procedure LoadMenuGroup;
    procedure LoadGradeMenuGroup;
    procedure LoadGradeCode;
    procedure ProgramSearch;
    procedure GradeProgramSearch;
    procedure AdvStrinGridSetAllCheck(Sender: TObject;aCol:integer;bchkState:Boolean);
    Function InsertTB_GRADEPROGRAM(aGradeCode,aGroupCode,aProgramid,aGubun:string):Boolean;
    Function DeleteTB_GRADEPROGRAM(aGradeCode,aGroupCode,aProgramid,aGubun:string):Boolean;
    Function SearchTB_GRADEPROGRAM(aGradeCode,aGroupCode,aProgramid,aGubun:string):Boolean;
    Function UpdateGradeAll(aCol:integer;bchkState:Boolean):Boolean;
    Function UpdateGradeProgramInsert(aGradeCode,aGroupCode,aProgramid,aGrade:string):Boolean;
    Function UpdateGradeProgramUpdate(aGradeCode,aGroupCode,aProgramid,aGrade:string):Boolean;
    Function UpdateGradeProgramDelete(aGradeCode,aGroupCode,aProgramid,aGrade:string):Boolean;
  public
    { Public declarations }
  end;

var
  fmGradeProgram: TfmGradeProgram;

implementation
uses
  uDataModule1;
{$R *.dfm}

procedure TfmGradeProgram.FormActivate(Sender: TObject);
begin
  LoadProgramGroup;
  LoadMenuGroup;
  LoadGradeMenuGroup;
  LoadGradeCode;
  ProgramSearch;
  GradeProgramSearch;
  sg_ProgramID.ColWidths[2] := 0;
  sg_GradeProgram.ColWidths[5] := 0;

end;

procedure TfmGradeProgram.LoadMenuGroup;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  MenuGroupCodeList.Clear;
  cmb_MenuGroup.Clear;

  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;

  if cmb_ProgramGroup.ItemIndex = 0 then
  begin
    MenuGroupCodeList.Add('');
    cmb_MenuGroup.Items.Add('��ü');
  end
  else begin
    MenuGroupCodeList.Add('');
    cmb_MenuGroup.Items.Add('��ü');

    stSql := 'select * from TB_PROGRAMGROUP ';
    stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND GUBUN = ''' + ProgramGroupCodeList.Strings[cmb_ProgramGroup.ItemIndex] + ''' ';

    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;
      Try
        Open;
      Except
        TempAdoQuery.Free;
        Exit;
      End;

      if Recordcount < 1 then
      begin
        TempAdoQuery.Free;
        Exit;
      end;

      First;

      While Not Eof do
      begin
        MenuGroupCodeList.Add(FindField('PR_GROUPCODE').AsString );
        cmb_MenuGroup.Items.Add(FindField('PR_GROUPCODENAME').AsString );

        Next;
      end;
    end;
  end;
  TempAdoQuery.Free;
  cmb_MenuGroup.ItemIndex := 0;
end;

procedure TfmGradeProgram.LoadProgramGroup;
begin
  cmb_ProgramGroup.Clear;
  ProgramGroupCodeList.Clear;
  cmb_ProgramGroup.Items.Add('��ü');
  ProgramGroupCodeList.Add('');
  cmb_ProgramGroup.Items.Add('�������α׷�');
  ProgramGroupCodeList.Add('KTMOS');
  cmb_ProgramGroup.Items.Add('�������α׷�');
  ProgramGroupCodeList.Add('KTREPORT');


  cmb_GradeProgramGroup.Clear;
  cmb_GradeProgramGroup.Items.Add('��ü');
  cmb_GradeProgramGroup.Items.Add('�������α׷�');
  cmb_GradeProgramGroup.Items.Add('�������α׷�');

  cmb_ProgramGroup.ItemIndex := 0;
  cmb_GradeProgramGroup.ItemIndex := 0;
end;

procedure TfmGradeProgram.FormCreate(Sender: TObject);
begin
  ProgramGroupCodeList := TStringList.Create;
  MenuGroupCodeList := TStringList.Create;
  MenuGradeGroupCodeList := TStringList.Create;
  GradeCodeList := TStringList.Create;

  sg_programid.AddCheckBox(0,0,False,False);
  sg_GradeProgram.AddCheckBox(0,0,False,False);
  sg_GradeProgram.AddCheckBox(2,0,False,False);
  sg_GradeProgram.AddCheckBox(3,0,False,False);
  sg_GradeProgram.AddCheckBox(4,0,False,False);

end;

procedure TfmGradeProgram.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ProgramGroupCodeList.Free;
  MenuGroupCodeList.Free;
  MenuGradeGroupCodeList.Free;
  GradeCodeList.Free;
end;

procedure TfmGradeProgram.cmb_ProgramGroupChange(Sender: TObject);
begin
  LoadMenuGroup;
  ProgramSearch;
  GradeProgramSearch;
end;

procedure TfmGradeProgram.LoadGradeCode;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  GradeCodeList.Clear;
  cmb_Grade.Clear;
  stSql := ' select * from TB_GRADE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + '''';

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
      Exit;
    End;

    if Recordcount < 1 then
    begin
      TempAdoQuery.Free;
      Exit;
    end;

    First;
    While Not Eof do
    begin
      GradeCodeList.Add(FindField('GR_GRADECODE').AsString);
      cmb_Grade.Items.Add(FindField('GR_GARDENAME').AsString);
      Next;
    end;
  end;
  cmb_Grade.ItemIndex := 0;
  TempAdoQuery.Free;
end;

procedure TfmGradeProgram.GradeProgramSearch;
var
  i : integer;
  stSql : string;
  nRow : integer;
  TempAdoQuery : TADOQuery;
begin
  if GradeCodeList.Count < 1 then
  begin
    showmessage('�����ڵ尡 ��ϵǾ� ���� �ʽ��ϴ�. �����ڵ� ��� �� �۾� �����մϴ�.');

    btn_GradeInsert.Enabled := False;
    btn_GradeDelete.Enabled := False;
    Exit;
  end;
  
  with sg_GradeProgram do   //��Ʈ���׸��� �ʱ�ȭ
  begin
    SetCheckBoxState(0,0,False);
    SetCheckBoxState(2,0,False);
    SetCheckBoxState(3,0,False);
    SetCheckBoxState(4,0,False);
    RemoveCheckBox(0,1);
    RemoveCheckBox(2,1);
    RemoveCheckBox(3,1);
    RemoveCheckBox(4,1);
    RowCount := 2;
    for i:= 0 to ColCount - 1 do
    begin
      Cells[i,1] := '';
    end;
  end;

  stSql := 'select a.*,b.PR_PROGRAMNAME from TB_GRADEPROGRAM a ';
  stSql := stSql + ' Inner Join TB_PROGRAMID b ';
  stSql := stSql + ' ON (a.PR_PROGRAMID = b.PR_PROGRAMID AND a.GROUP_CODE = b.GROUP_CODE) ';
  stSql := stSql + ' Inner Join TB_PROGRAMGROUP c';
  stSql := stSql + ' ON (a.PR_GROUPCODE = c.PR_GROUPCODE AND a.GROUP_CODE = c.GROUP_CODE) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + '''';
  stSql := stSql + ' AND a.GR_GRADECODE = ''' + GradeCodeList.Strings[cmb_Grade.ItemIndex] + '''';
  stSql := stSql + ' AND a.GR_GUBUN = ''1'' ';

  if cmb_GradeProgramGroup.ItemIndex > 0 then
  begin
    stSql := stSql + ' AND c.GUBUN = ''' + ProgramGroupCodeList.Strings[cmb_GradeProgramGroup.ItemIndex] + '''';
    if cmb_GradeMenuGroup.ItemIndex <> 0 then
    begin
      stSql := stSql + ' AND a.PR_GROUPCODE = ''' + MenuGradeGroupCodeList.Strings[cmb_GradeMenuGroup.ItemIndex]  + ''' ';
    end;
  end;
  stSql := stSql + ' Order By PR_VIEWSEQ ';

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
      Exit;
    End;
    if RecordCount < 1 then
    begin
      TempAdoQuery.Free;
      Exit;
    end;

    with sg_GradeProgram do
    begin
      RowCount := RecordCount + 1;
      nRow := 1;
      while Not Eof do
      begin
        AddCheckBox(0,nRow,False,False);
        AddCheckBox(2,nRow,False,False);
        AddCheckBox(3,nRow,False,False);
        AddCheckBox(4,nRow,False,False);
        cells[0,nRow] := FindField('PR_PROGRAMID').AsString;
        cells[1,nRow] := FindField('PR_PROGRAMNAME').AsString;
        cells[5,nRow] := FindField('PR_GROUPCODE').AsString;
        if FindField('GR_INSERT').AsString = 'N' then  SetCheckBoxState(2,nRow,False)
        else SetCheckBoxState(2,nRow,True);
        if FindField('GR_UPDATE').AsString = 'N' then  SetCheckBoxState(3,nRow,False)
        else SetCheckBoxState(3,nRow,True);
        if FindField('GR_DELETE').AsString = 'N' then  SetCheckBoxState(4,nRow,False)
        else SetCheckBoxState(4,nRow,True);
        nRow := nRow + 1;
        Next;
      end;
    end;

  end;
  TempAdoQuery.Free;
end;

procedure TfmGradeProgram.ProgramSearch;
var
  stSql : string;
  nRow : integer;
  i : integer;
  TempAdoQuery : TADOQuery;
begin
  with sg_ProgramID do   //��Ʈ���׸��� �ʱ�ȭ
  begin
    SetCheckBoxState(0,0,False);
    RemoveCheckBox(0,1);
    RowCount := 2;
    for i:= 0 to ColCount - 1 do
    begin
      Cells[i,1] := '';
    end;
  end;

  stSql := 'select a.PR_PROGRAMID,a.PR_PROGRAMNAME,a.PR_GROUPCODE from TB_PROGRAMID a ';
  stSql := stSql + ' Inner Join TB_PROGRAMGROUP b ';
  stSql := stSql + ' ON (a.PR_GROUPCODE = b.PR_GROUPCODE AND a.GROUP_CODE = b.GROUP_CODE) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + '''';
  stSql := stSql + ' AND a.PR_VISIBLE = ''Y'' ' ;
  if cmb_ProgramGroup.ItemIndex <> 0 then
  begin
    stSql := stSql + ' AND b.GUBUN = ''' + ProgramGroupCodeList.Strings[cmb_ProgramGroup.ItemIndex] + '''';
    if cmb_MenuGroup.ItemIndex <> 0 then
    begin
      stSql := stSql + ' AND a.PR_GROUPCODE = ''' + MenuGroupCodeList.Strings[cmb_MenuGroup.ItemIndex]  + ''' ';
    end;
  end;
  stSql := stSql + ' Order by a.PR_VIEWSEQ ';

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
      Exit;
    End;
    if RecordCount < 1 then
    begin
      TempAdoQuery.Free;
      Exit;
    end;

    with sg_ProgramID do
    begin
      RowCount := RecordCount + 1;
      nRow := 1;
      while Not Eof do
      begin
        AddCheckBox(0,nRow,False,False);
        cells[0,nRow] := FindField('PR_PROGRAMID').AsString;
        cells[1,nRow] := FindField('PR_PROGRAMNAME').AsString;
        cells[2,nRow] := FindField('PR_GROUPCODE').AsString;

        nRow := nRow + 1;
        Next;
      end;
    end;

  end;
  TempAdoQuery.Free;
end;

procedure TfmGradeProgram.cmb_MenuGroupChange(Sender: TObject);
begin
  ProgramSearch;
  GradeProgramSearch;
end;

procedure TfmGradeProgram.cmb_GradeChange(Sender: TObject);
begin
  GradeProgramSearch;
end;

procedure TfmGradeProgram.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmGradeProgram.sg_ProgramIDCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
var
  bchkState : Boolean;
begin
  if ARow = 0 then //��ü���� �Ǵ� ����
  begin
    (Sender as TAdvStringGrid).GetCheckBoxState(ACol,0, bchkState);
    AdvStrinGridSetAllCheck(Sender,ACol,bchkState);
  end;
end;

procedure TfmGradeProgram.AdvStrinGridSetAllCheck(Sender: TObject;
  aCol:integer;bchkState: Boolean);
var
  i : integer;
begin
    for i:= 1 to (Sender as TAdvStringGrid).RowCount - 1  do
    begin
      (Sender as TAdvStringGrid).SetCheckBoxState(aCol,i,bchkState);
    end;
    if aCol > 0 then UpdateGradeAll(aCol,bchkState);
end;

procedure TfmGradeProgram.sg_GradeProgramCheckBoxClick(Sender: TObject;
  ACol, ARow: Integer; State: Boolean);
var
  bchkState : Boolean;
  stGradeCode : string;
  stGrade : string;
begin
  (Sender as TAdvStringGrid).GetCheckBoxState(ACol,ARow, bchkState);
  if ARow = 0 then //��ü���� �Ǵ� ����
  begin
    AdvStrinGridSetAllCheck(Sender,ACol,bchkState);
  end else
  begin
    if bChkState then stGrade := 'Y'
    else stGrade := 'N';
    stGradeCode := GradeCodeList.Strings[cmb_Grade.itemIndex];
    with sg_GradeProgram do
    begin
      if ACol = 2 then UpdateGradeProgramInsert(stGradeCode,Cells[5,ARow],Cells[0,ARow],stGrade)
      else if ACol = 3 then UpdateGradeProgramUpdate(stGradeCode,Cells[5,ARow],Cells[0,ARow],stGrade)
      else if ACol = 4 then UpdateGradeProgramDelete(stGradeCode,Cells[5,ARow],Cells[0,ARow],stGrade);
    end;
  end;

end;

procedure TfmGradeProgram.btn_GradeInsertClick(Sender: TObject);
var
  i : integer;
  bchkState : boolean;
  nCount : integer;
  stGradeCode,stGroupCode,stProgramid : string;
begin
  nCount := 0 ;
  stGradeCode := GradeCodeList.Strings[cmb_Grade.itemIndex];

  with sg_ProgramId do
  begin
    for i := 1 to rowcount - 1 do
    begin
      GetCheckBoxState(0,i, bchkState);

      if bchkState then
      begin
        stProgramid := Cells[0,i];
        stGroupCode := Cells[2,i];
        if Not SearchTB_GRADEPROGRAM(stGradeCode,stGroupCode,copy(stProgramid,1,2) + '00','2') then
          InsertTB_GRADEPROGRAM(stGradeCode,stGroupCode,copy(stProgramid,1,2) + '00','2');

        InsertTB_GRADEPROGRAM(stGradeCode,stGroupCode,stProgramid,'1');
        nCount := nCount + 1;
      end;
    end;
  end;
  if nCount = 0 then
  begin
    showmessage('���õ� ���α׷��� �����ϴ�.');
    Exit;
  end;
  cmb_GradeProgramGroup.ItemIndex := cmb_ProgramGroup.ItemIndex;
  LoadGradeMenuGroup;
  cmb_GradeMenuGroup.ItemIndex := cmb_MenuGroup.ItemIndex;

  ProgramSearch;
  GradeProgramSearch;

end;

function TfmGradeProgram.InsertTB_GRADEPROGRAM(aGradeCode, aGroupCode,
  aProgramid, aGubun: string): Boolean;
var
  stSql :string;
begin
  result := False;

  stSql := ' Insert Into TB_GRADEPROGRAM( ';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' GR_GRADECODE,';
  stSql := stSql + ' PR_GROUPCODE,';
  stSql := stSql + ' PR_PROGRAMID,';
  stSql := stSql + ' GR_GUBUN,';
  stSql := stSql + ' AC_UPDATEDATE,' ;
  stSql := stSql + ' AC_UPDATEOPERATOR )' ;
  stSql := stSql + ' values( ';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aGradeCode + ''',';
  stSql := stSql + '''' + aGroupCode + ''',';
  stSql := stSql + '''' + aProgramid + ''',';
  stSql := stSql + '''' + aGubun + ''',';
  stSql := stSql + '''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',';
  stSql := stSql + '''' + Master_ID + '''';
  stSql := stSql + ')';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmGradeProgram.SearchTB_GRADEPROGRAM(aGradeCode, aGroupCode,
  aProgramid, aGubun: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin

  Result := False;
  stSql := ' select * from TB_GRADEPROGRAM ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + '''';
  stSql := stSql + ' AND GR_GRADECODE = ''' + aGradeCode + '''';
  stSql := stSql + ' AND PR_GROUPCODE = ''' + aGroupCode + '''';
  if Trim(aProgramid) <> '' then
    stSql := stSql + ' AND PR_PROGRAMID = ''' + aProgramid + '''';
  stSql := stSql + ' AND GR_GUBUN = ''' +  aGubun + '''';

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
      Exit;
    End;
    if recordcount > 0 then Result := True;

  end;
  TempAdoQuery.Free;

end;

procedure TfmGradeProgram.cmb_GradeProgramGroupChange(Sender: TObject);
begin
  LoadGradeMenuGroup;
  GradeProgramSearch;
end;

procedure TfmGradeProgram.LoadGradeMenuGroup;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;

  MenuGradeGroupCodeList.Clear;
  cmb_GradeMenuGroup.Clear;
  if cmb_GradeProgramGroup.ItemIndex = 0 then
  begin
    MenuGradeGroupCodeList.Add('');
    cmb_GradeMenuGroup.Items.Add('��ü');
  end
  else begin
    MenuGradeGroupCodeList.Add('');
    cmb_GradeMenuGroup.Items.Add('��ü');

    stSql := 'select * from TB_PROGRAMGROUP ';
    stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND GUBUN = ''' + ProgramGroupCodeList.Strings[cmb_GradeProgramGroup.ItemIndex] + ''' ';

    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;
      Try
        Open;
      Except
        TempAdoQuery.Free;
        Exit;
      End;
      cmb_GradeMenuGroup.ItemIndex := 0;
      
      if Recordcount < 1 then
      begin
        TempAdoQuery.Free;
        Exit;
      end;

      First;

      While Not Eof do
      begin
        MenuGradeGroupCodeList.Add(FindField('PR_GROUPCODE').AsString );
        cmb_GradeMenuGroup.Items.Add(FindField('PR_GROUPCODENAME').AsString );

        Next;
      end;
    end;
  end;
  TempAdoQuery.Free;
  cmb_GradeMenuGroup.ItemIndex := 0;
end;

procedure TfmGradeProgram.cmb_GradeMenuGroupChange(Sender: TObject);
begin
  GradeProgramSearch;
end;

procedure TfmGradeProgram.btn_GradeDeleteClick(Sender: TObject);
var
  i : integer;
  bchkState : boolean;
  nCount : integer;
  stGradeCode,stGroupCode,stProgramid : string;
begin
  nCount := 0 ;
  stGradeCode := GradeCodeList.Strings[cmb_Grade.itemIndex];

  with sg_GradeProgram do
  begin
    for i := 1 to rowcount - 1 do
    begin
      GetCheckBoxState(0,i, bchkState);

      if bchkState then
      begin
        stProgramid := Cells[0,i];
        stGroupCode := Cells[5,i];
        DeleteTB_GRADEPROGRAM(stGradeCode,stGroupCode,stProgramid,'1');
        if Not SearchTB_GRADEPROGRAM(stGradeCode,stGroupCode,'','1') then   //���α׷� ���̵� �ϳ��� ������ �޴��׷��� �����Ѵ�.
          DeleteTB_GRADEPROGRAM(stGradeCode,stGroupCode,copy(stProgramid,1,2) + '00','2');

        nCount := nCount + 1;
      end;
    end;
  end;
  if nCount = 0 then
  begin
    showmessage('���õ� ���α׷��� �����ϴ�.');
    Exit;
  end;

  GradeProgramSearch;

end;

function TfmGradeProgram.DeleteTB_GRADEPROGRAM(aGradeCode, aGroupCode,
  aProgramid, aGubun: string): Boolean;
var
  stSql :string;
begin
  result := False;

  stSql := ' Delete From TB_GRADEPROGRAM  ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + '''';
  stSql := stSql + ' AND GR_GRADECODE = ''' + aGradeCode + '''';
  stSql := stSql + ' AND PR_GROUPCODE = ''' + aGroupCode + '''';
  stSql := stSql + ' AND PR_PROGRAMID = ''' + aProgramid + '''';
  stSql := stSql + ' AND GR_GUBUN = ''' +  aGubun + '''';

  with DataModule1.GetObject.ADOExecQuery do
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

  result := True;
end;

function TfmGradeProgram.UpdateGradeAll(aCol: integer;
  bchkState: Boolean): Boolean;
var
  i : integer;
  stGrade : string;
  stGradeCode : string;
begin
  if bChkState then stGrade := 'Y'
  else stGrade := 'N';
  stGradeCode := GradeCodeList.Strings[cmb_Grade.itemIndex];
  with sg_GradeProgram do
  begin
    for i:= 1 to rowCount - 1 do
    begin
      if aCol = 2 then UpdateGradeProgramInsert(stGradeCode,Cells[5,i],Cells[0,i],stGrade)
      else if aCol = 3 then UpdateGradeProgramUpdate(stGradeCode,Cells[5,i],Cells[0,i],stGrade)
      else if aCol = 4 then UpdateGradeProgramDelete(stGradeCode,Cells[5,i],Cells[0,i],stGrade);
    end;
  end;
end;

function TfmGradeProgram.UpdateGradeProgramDelete(aGradeCode, aGroupCode,
  aProgramid, aGrade: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_GRADEPROGRAM set GR_DELETE = ''' + aGrade + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND GR_GRADECODE = ''' + aGradeCode + ''' ';
  stSql := stSql + ' AND PR_PROGRAMID = ''' + aProgramid + ''' ';
  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmGradeProgram.UpdateGradeProgramInsert(aGradeCode, aGroupCode,
  aProgramid, aGrade: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_GRADEPROGRAM set GR_INSERT = ''' + aGrade + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND GR_GRADECODE = ''' + aGradeCode + ''' ';
  stSql := stSql + ' AND PR_PROGRAMID = ''' + aProgramid + ''' ';
  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmGradeProgram.UpdateGradeProgramUpdate(aGradeCode, aGroupCode,
  aProgramid, aGrade: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_GRADEPROGRAM set GR_UPDATE = ''' + aGrade + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND GR_GRADECODE = ''' + aGradeCode + ''' ';
  stSql := stSql + ' AND PR_PROGRAMID = ''' + aProgramid + ''' ';
  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmGradeProgram.FormShow(Sender: TObject);
begin
  if Not IsMaster then
  begin
    if IsInsertGrade then btn_GradeInsert.Enabled := True
    else btn_GradeInsert.Enabled := False;
    if IsUpdateGrade then sg_GradeProgram.Options := sg_GradeProgram.Options + [goEditing]
    else sg_GradeProgram.Options := sg_GradeProgram.Options - [goEditing];
    if IsDeleteGrade then btn_GradeDelete.Enabled := True
    else btn_GradeDelete.Enabled := False;
  end;

end;

end.
