unit uDoorAntiPass;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, AdvEdit, AdvGlowButton, Grids, AdvObj, BaseGrid,
  AdvGrid, AdvSmoothLabel, ExtCtrls, uSubForm, CommandArray,ActiveX,ADODB;

type
  TfmDoorAntiPass = class(TfmASubForm)
    BodyPanel: TPanel;
    lb_List: TLabel;
    sg_List: TAdvStringGrid;
    btn_AntiGroup: TAdvGlowButton;
    pan_AntiGroup: TPanel;
    AdvSmoothLabel1: TAdvSmoothLabel;
    cmb_AntiGroup: TComboBox;
    btn_AntiGroupSelect: TAdvGlowButton;
    btn_AntiGroupCancel: TAdvGlowButton;
    procedure btn_AntiGroupClick(Sender: TObject);
    procedure btn_AntiGroupCancelClick(Sender: TObject);
    procedure btn_AntiGroupSelectClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sg_ListCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
  private
    AntiGroupCodeList : TStringList;
    L_bDoorChange : Boolean;
    L_nCheckCount : integer;
    L_nPageListMaxCount : integer;
    { Private declarations }
    Function SearchList(aCurrentCode:string;aTopRow:integer = 0):Boolean;
    Function GetAntiNo(aAntiGroupCode:string):string;
    procedure AdvStrinGridSetAllCheck(Sender: TObject;bchkState:Boolean);
  public
    { Public declarations }
  end;

var
  fmDoorAntiPass: TfmDoorAntiPass;

implementation
uses
   uCompanyCodeLoad,
   uCommonSql,
   uDataModule1,
   uLomosUtil;

{$R *.dfm}

procedure TfmDoorAntiPass.AdvStrinGridSetAllCheck(Sender: TObject;
  bchkState: Boolean);
var
  i : integer;
begin
    for i:= 1 to (Sender as TAdvStringGrid).RowCount - 1  do
    begin
      (Sender as TAdvStringGrid).SetCheckBoxState(0,i,bchkState);
    end;
end;

procedure TfmDoorAntiPass.btn_AntiGroupClick(Sender: TObject);
var
  i : integer;
  bChkState : Boolean;
  stMessage : string;
begin
  inherited;
  stMessage := stringReplace('$WORK 작업 선택 에러!','$WORK',btn_AntiGroup.Caption,[rfReplaceAll]);
  if L_nCheckCount = 0 then
  begin
    Application.MessageBox(PChar(stMessage),'Information',MB_OK);
    Exit;
  end;
  sg_List.Enabled := False;
  pan_AntiGroup.Visible := True;
  LoadAntiGroupCode(AntiGroupCodeList,TComboBox(cmb_AntiGroup),True,'사용안함');
  if cmb_AntiGroup.Items.Count > 1 then cmb_AntiGroup.ItemIndex := 1;
end;

procedure TfmDoorAntiPass.btn_AntiGroupCancelClick(Sender: TObject);
begin
  sg_List.Enabled := True;
  pan_AntiGroup.Visible := False;
end;

procedure TfmDoorAntiPass.btn_AntiGroupSelectClick(Sender: TObject);
var
  i : integer;
  bChkState : Boolean;
  stAntiGroupCode : string;
  stDoorNo : string;
  nIndex : integer;
  nWinSocket : integer;
  stAntiNo : string;
  stSql : string;
begin
  inherited;
  stAntiGroupCode := '';
  if cmb_AntiGroup.ItemIndex > -1 then
    stAntiGroupCode := AntiGroupCodeList.Strings[cmb_AntiGroup.ItemIndex];

  if stAntiGroupCode = '' then stAntiGroupCode := '0';

  stAntiNo := GetAntiNo(stAntiGroupCode);

  With sg_List do
  begin
    for i := 1 to RowCount - 1 do
    begin
      GetCheckBoxState(0,i, bChkState);
      if bChkState then
      begin
        if isDigit(cells[5,i]) then stDoorNo := inttostr(strtoint(cells[5,i]))
        else stDoorNo := '0';
        stSql := CommonSql.UpdateTB_DOOR_Field_IntValue(cells[3,i],cells[4,i],stDoorNo,'AG_CODE',stAntiGroupCode);
        DataModule1.ProcessExecSQL(stSql);

        L_bDoorChange := True;
      end;
    end;
  end;
  sg_List.Enabled := True;
  pan_AntiGroup.Visible := False;
  SearchList('');
end;

procedure TfmDoorAntiPass.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  AntiGroupCodeList.Free;
end;

procedure TfmDoorAntiPass.FormCreate(Sender: TObject);
begin
  AntiGroupCodeList := TStringList.Create;
  L_nPageListMaxCount := 9;
end;

procedure TfmDoorAntiPass.FormResize(Sender: TObject);
begin
  sg_List.Left := 10;
  sg_List.Width := BodyPanel.Width - (sg_List.Left * 2);
  sg_List.Height := BodyPanel.Height - (sg_List.Top + 10);
  sg_List.ColWidths[2] := sg_List.Width - (sg_List.ColWidths[0] + sg_List.ColWidths[1]);
  btn_AntiGroup.Left := sg_List.Left + sg_List.Width - btn_AntiGroup.Width;


  pan_AntiGroup.Left := (BodyPanel.Width div 2) - (pan_AntiGroup.Width div 2);
  pan_AntiGroup.Top := (BodyPanel.Height div 2) - (pan_AntiGroup.Height div 2);
end;

procedure TfmDoorAntiPass.FormShow(Sender: TObject);
begin
  SearchList('');
end;

function TfmDoorAntiPass.GetAntiNo(aAntiGroupCode: string): string;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := '0';
  stSql := ' Select * from TB_ANTIGROUPCODE ';
  stSql := stSql + ' Where AG_CODE = ' + aAntiGroupCode + ' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if recordcount < 1 then Exit;
      if Not FindField('AG_ANTINO').isNull then
         result := FindField('AG_ANTINO').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmDoorAntiPass.SearchList(aCurrentCode: string;
  aTopRow: integer): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
begin
  GridInit(sg_List,3,2,true);
  stSql := ' Select a.*,b.AG_NAME from ';
  stSql := stSql + ' TB_DOOR a ';
  stSql := stSql + ' Left Join TB_ANTIGROUPCODE b ';
  stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE  ';
  stSql := stSql + ' AND a.AG_CODE = b.AG_CODE) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' Order by a.DO_VIEWSEQ,a.AC_NODENO,a.AC_ECUID,a.DO_DOORNO ';

  L_nCheckCount := 0;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if recordcount < 1 then Exit;
      with sg_List do
      begin
        nRow := 1;
        RowCount := RecordCount + 1;
        while Not Eof do
        begin
          AddCheckBox(0,nRow,False,False);
          cells[1,nRow] := FindField('DO_DOORNONAME').AsString;
          cells[2,nRow] := FindField('AG_NAME').AsString;
          cells[3,nRow] := FindField('AC_NODENO').AsString;
          cells[4,nRow] := FindField('AC_ECUID').AsString;
          cells[5,nRow] := FindField('DO_DOORNO').AsString;
          cells[6,nRow] := FindField('AG_CODE').AsString;
          if (cells[3,nRow] + cells[4,nRow] + cells[5,nRow]) = aCurrentCode then
          begin
            SelectRows(nRow,1);
          end;

          nRow := nRow + 1;
          Next;
        end;
        if aTopRow = 0 then
        begin
          if Row > (L_nPageListMaxCount - 1) then TopRow := Row - L_nPageListMaxCount;
        end else
        begin
          TopRow := aTopRow;
        end;
      end;

    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmDoorAntiPass.sg_ListCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
  if ARow = 0 then //전체선택 또는 해제
  begin
    if State then L_nCheckCount := (Sender as TAdvStringGrid).RowCount - 1
    else L_nCheckCount := 0;
    AdvStrinGridSetAllCheck(Sender,State);
  end else
  begin
    if State then L_nCheckCount := L_nCheckCount + 1
    else L_nCheckCount := L_nCheckCount - 1 ;
  end;

end;

end.
