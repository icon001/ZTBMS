unit ArmGubunCode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uSubForm, CommandArray, StdCtrls, Buttons, Grids, BaseGrid,
  AdvGrid, ExtCtrls, ComCtrls,ADODB,ActiveX, AdvObj;

type
  TfmArmGubunCode = class(TfmASubForm)
    StatusBar1: TStatusBar;
    Panel12: TPanel;
    Panel2: TPanel;
    sg_Code: TAdvStringGrid;
    Panel1: TPanel;
    Label8: TLabel;
    Label1: TLabel;
    btn_Delete: TSpeedButton;
    btn_Save: TSpeedButton;
    btn_Update: TSpeedButton;
    btn_Insert: TSpeedButton;
    btn_Close: TSpeedButton;
    btn_Cancel: TSpeedButton;
    ed_code: TEdit;
    ed_Name: TEdit;
    chk_AutoCode: TCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure sg_CodeClick(Sender: TObject);
    procedure btn_InsertClick(Sender: TObject);
    procedure btn_UpdateClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure btn_DeleteClick(Sender: TObject);
    procedure ed_codeKeyPress(Sender: TObject; var Key: Char);
    procedure btn_CloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure chk_AutoCodeClick(Sender: TObject);
  private
    State : string;
    { Private declarations }
    procedure ShowArmGubunCode(aCode : string);
    procedure ButtonEnable(aState:string);
    procedure FormClear;
    procedure FormEnable(aState:string);
  private
    Function InsertTB_ALARMGUBUNCODE(acode,aName:String):Boolean;
    Function UpdateTB_ALARMGUBUNCODE(acode,aName:String):Boolean;
    Function DeleteTB_ALARMGUBUNCODE(aCode:String):Boolean;
    Function GetAutoCode:string;

  public
    { Public declarations }
  end;

var
  fmArmGubunCode: TfmArmGubunCode;

implementation

uses
  uDataModule1,
  uLomosUtil;
{$R *.dfm}

procedure TfmArmGubunCode.FormActivate(Sender: TObject);
begin
  ShowArmGubunCode('');
end;

procedure TfmArmGubunCode.ShowArmGubunCode(aCode: string);
var
  stSql : string;
  nRow : integer;
  i : integer;
  TempAdoQuery : TADOQuery;
begin
  GridInitialize(sg_Code); //스트링그리드 초기화

  State := 'SEARCH';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  stSql := 'select * from TB_ALARMGUBUNCODE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';

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

      with sg_Code do
      begin
        RowCount := RecordCount + 1;
        nRow := 1;
        while Not Eof do
        begin
          cells[0,nRow] := FindField('AG_ARMCODE').AsString;
          cells[1,nRow] := FindField('AG_ARMNAME').AsString;
          if FindField('AG_ARMCODE').AsString  = aCode then
          begin
            SelectRows(nRow,1);
          end;

          nRow := nRow + 1;
          Next;
        end;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  sg_CodeClick(sg_Code);
end;

procedure TfmArmGubunCode.sg_CodeClick(Sender: TObject);
begin
  State := 'CLICK';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);
  with (Sender as TStringGrid) do
  begin
    if cells[0,Row] = '' then exit;
    ed_code.Text := cells[0,Row];
    ed_Name.Text := cells[1,Row];
  end;

end;

procedure TfmArmGubunCode.btn_InsertClick(Sender: TObject);
begin
  State := 'INSERT';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);
  with sg_Code do
  begin
    if Cells[0,1] <> '' then
    begin
      AddRow;
      SelectRows(RowCount - 1,1);
      Enabled := True;
      if RowCount > 5 then TopRow := RowCount - 5;
      Enabled := False;
    end;
  end;
  if chk_AutoCode.Checked then chk_AutoCodeClick(self);
  ed_Code.SetFocus;
end;

procedure TfmArmGubunCode.btn_UpdateClick(Sender: TObject);
begin
  State := 'UPDATE';

  FormEnable(State);
  ButtonEnable(State);
  ed_Name.SetFocus;

end;

procedure TfmArmGubunCode.btn_SaveClick(Sender: TObject);
var
  bResult : boolean;
begin
  if UpperCase(State) = 'INSERT' then
    bResult := InsertTB_ALARMGUBUNCODE(ed_Code.Text,ed_Name.Text)
  else if UpperCase(State) = 'UPDATE' then
    bResult := UpdateTB_ALARMGUBUNCODE(ed_Code.Text,ed_Name.Text);

  if bResult then ShowArmGubunCode(ed_Code.Text)
  else showmessage('저장실패');
end;

function TfmArmGubunCode.DeleteTB_ALARMGUBUNCODE(aCode: String): Boolean;
var
  stSql : string;
begin
  stSql := 'Delete From TB_ALARMGUBUNCODE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + '''';
  stSql := stSql + ' And AG_ARMCODE = ''' + aCode + '''';
  
  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmArmGubunCode.InsertTB_ALARMGUBUNCODE(acode,
  aName: String): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_ALARMGUBUNCODE( ';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'AG_ARMCODE,';
  stSql := stSql + 'AG_ARMNAME) ';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + acode + ''',';
  stSql := stSql + '''' + aName + ''')';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmArmGubunCode.UpdateTB_ALARMGUBUNCODE(acode,
  aName: String): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_ALARMGUBUNCODE set ';
  stSql := stSql + ' AG_ARMNAME = ''' + aName + ''' ';
  stSql := stSql + ' where GROUP_CODE =''' + GROUPCODE + '''';
  stSql := stSql + ' AND AG_ARMCODE = ''' + acode + '''';

  result := DataModule1.ProcessExecSQL(stSql);

end;

procedure TfmArmGubunCode.btn_DeleteClick(Sender: TObject);
var
  bResult : boolean;
begin
  if (Application.MessageBox(PChar('데이터를 삭제하시겠습니까?'),'삭제',MB_OKCANCEL) = ID_CANCEL)  then Exit;

  bResult := DeleteTB_ALARMGUBUNCODE(ed_code.Text);

  if bResult then ShowArmGubunCode(ed_Code.Text)
  else showmessage('삭제실패.');
end;

procedure TfmArmGubunCode.ed_codeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    ed_Name.SetFocus;
  end;

end;

procedure TfmArmGubunCode.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmArmGubunCode.ButtonEnable(aState: string);
begin
  if upperCase(aState) = 'INSERT'  then
  begin
    btn_Insert.Enabled := False;
    btn_update.Enabled := false;
    btn_Save.Enabled := True;
    btn_delete.Enabled := False;
    btn_Cancel.Enabled := True;
  end else if upperCase(aState) = 'SEARCH' then
  begin
    if IsInsertGrade then  btn_Insert.Enabled := True;
    btn_Update.Enabled := False;
    btn_Save.Enabled := False;
    btn_Delete.Enabled := False;
    btn_Cancel.Enabled := False;
  end else if upperCase(aState) = 'UPDATE' then
  begin
    btn_Insert.Enabled := False;
    btn_Update.Enabled := False;
    btn_Save.Enabled := True;
    btn_Delete.Enabled := False;
    btn_Cancel.Enabled := True;
  end else if upperCase(aState) = 'CLICK' then
  begin
    if IsInsertGrade then  btn_Insert.Enabled := True;
    if IsUpdateGrade then btn_Update.Enabled := True;
    btn_Save.Enabled := False;
    if IsDeleteGrade then btn_Delete.Enabled := True;
    btn_Cancel.Enabled := False;
  end;
end;

procedure TfmArmGubunCode.FormClear;
begin
  ed_code.Text := '';
  ed_Name.Text := '';
end;

procedure TfmArmGubunCode.FormEnable(aState: string);
begin
  if upperCase(aState) = 'INSERT'  then
  begin
    sg_Code.Enabled := False;
    ed_Code.Enabled := true;
    ed_Name.Enabled  := true;
  end else if upperCase(aState) = 'CLICK' then
  begin
    sg_Code.Enabled := True;
    ed_Code.Enabled := False;
    ed_Name.Enabled  := False;
  end else if upperCase(aState) = 'SEARCH' then
  begin
    sg_Code.Enabled := True;
    ed_Code.Enabled := False;
    ed_Name.Enabled  := False;
  end else if upperCase(aState) = 'UPDATE' then
  begin
    sg_Code.Enabled := False;
    ed_Code.Enabled := False;
    ed_Name.Enabled  := true;
  end;
end;

procedure TfmArmGubunCode.FormShow(Sender: TObject);
begin
  if Not IsMaster then
  begin
    if IsInsertGrade then btn_Insert.Enabled := True
    else btn_Insert.Enabled := False;
    if IsUpdateGrade then btn_Update.Enabled := True
    else btn_Update.Enabled := False;
    if IsDeleteGrade then btn_Delete.Enabled := True
    else btn_Delete.Enabled := False;
  end;

end;

procedure TfmArmGubunCode.btn_CancelClick(Sender: TObject);
begin
  ShowARMGubunCode(ed_Code.Text);
end;

procedure TfmArmGubunCode.FormResize(Sender: TObject);
var
  nWidth : integer;
  nBlock : integer;
  nLeft : integer;
  nCenter : integer;
begin
  nWidth := Width;
  nBlock := (nWidth - 20) div 6; //양쪽으로 50 씩 띄우자

  nCenter := nBlock div 2;
  nLeft := nCenter - (btn_Insert.Width div 2);

  btn_Insert.Left := 10 + nLeft;
  btn_Update.Left := 10 + nBlock + nLeft;
  btn_Save.Left := 10 + (nBlock * 2) + nLeft;
  btn_Delete.Left := 10 + (nBlock * 3) + nLeft;
  btn_Cancel.Left := 10 + (nBlock * 4) + nLeft;
  btn_Close.Left := 10 + (nBlock * 5) + nLeft;

end;

procedure TfmArmGubunCode.chk_AutoCodeClick(Sender: TObject);
begin
  if chk_AutoCode.Checked then ed_code.Text := GetAutoCode;

end;

function TfmArmGubunCode.GetAutoCode: string;
var
  stSql : string;
  nSeq : integer;
  TempAdoQuery : TADOQuery;
begin
  nSeq := 1;
  stSql := 'select Max(AG_ARMCODE) as AG_ARMCODE from TB_ALARMGUBUNCODE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
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
        result := FillZeroNumber(nSeq,3);
        Exit;
      End;
      if RecordCount < 1 then
      begin
        result := FillZeroNumber(nSeq,3);
        Exit;
      end;

      if recordCount > 0 then
      begin
        if IsDigit(FindField('AG_ARMCODE').AsString) then
        begin
          nSeq := strtoint(FindField('AG_ARMCODE').AsString) + 1;
        end;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  result := FillZeroNumber(nSeq,3);
end;

end.
