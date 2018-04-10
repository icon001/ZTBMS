unit uCustomer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Grids, BaseGrid, AdvGrid, uSubForm,
  CommandArray,ADODB;

type
  TfmCustomer = class(TfmASubForm)
    Panel11: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    ed_sTelNo: TEdit;
    ed_sname: TEdit;
    Label2: TLabel;
    btn_Search: TSpeedButton;
    btn_Close: TSpeedButton;
    sg_report: TAdvStringGrid;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    btn_Insert: TSpeedButton;
    btn_Update: TSpeedButton;
    btn_Save: TSpeedButton;
    btn_Delete: TSpeedButton;
    btn_Cancel: TSpeedButton;
    Label3: TLabel;
    ed_eTelNo: TEdit;
    Label4: TLabel;
    ed_eName: TEdit;
    mem_Etc: TMemo;
    Label5: TLabel;
    Label6: TLabel;
    ed_mail: TEdit;
    Label7: TLabel;
    ed_Etc: TEdit;
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_InsertClick(Sender: TObject);
    procedure btn_UpdateClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure sg_reportClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure btn_DeleteClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ed_sTelNoChange(Sender: TObject);
    procedure ed_snameChange(Sender: TObject);
    procedure sg_reportSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
  private
    State : string;
    L_nTopRow :integer;
    { Private declarations }
    procedure FormClear;
    procedure FormEnable(aState:string);
    procedure ButtonEnable(aState:string);
    procedure ShowCustomer(aTelNo:string);

    Function InsertTB_CUSTOMER(aTelNo,aName,aEmail,aEtc:string):Boolean;
    Function UpdateTB_CUSTOMER(aTelNo,aName,aEmail,aEtc:string):Boolean;
    Function DeleteTB_CUSTOMER(aTelNo:string):Boolean;
  public
    { Public declarations }
  end;

var
  fmCustomer: TfmCustomer;

implementation
uses
  uDataModule1;
{$R *.dfm}

procedure TfmCustomer.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmCustomer.ButtonEnable(aState: string);
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
    btn_Insert.Enabled := True;
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
    btn_Insert.Enabled := True;
    btn_Update.Enabled := True;
    btn_Save.Enabled := False;
    btn_Delete.Enabled := True;
    btn_Cancel.Enabled := False;
  end;

end;

procedure TfmCustomer.FormClear;
begin
  ed_eTelNo.Text := '';
  ed_eName.Text := '';
  mem_Etc.Text := '';
  ed_mail.Text := '';
end;

procedure TfmCustomer.FormEnable(aState: string);
begin
  if upperCase(aState) = 'INSERT'  then
  begin
    sg_Report.Enabled := False;
    ed_eTelNo.Enabled := True;
    ed_eName.Enabled := True;
    mem_Etc.Enabled := True;
    ed_mail.Enabled := True;
  end else if upperCase(aState) = 'SEARCH' then
  begin
    sg_Report.Enabled := True;
    ed_eTelNo.Enabled := False;
    ed_eName.Enabled := False;
    mem_Etc.Enabled := False;
    ed_mail.Enabled := False;
  end else if upperCase(aState) = 'CLICK' then
  begin
    sg_Report.Enabled := True;
    ed_eTelNo.Enabled := False;
    ed_eName.Enabled := False;
    mem_Etc.Enabled := False;
    ed_mail.Enabled := False;
  end else if upperCase(aState) = 'UPDATE' then
  begin
    sg_Report.Enabled := False;
    ed_eTelNo.Enabled := False;
    ed_eName.Enabled := True;
    mem_Etc.Enabled := True;
    ed_mail.Enabled := True;
  end;
end;

procedure TfmCustomer.btn_InsertClick(Sender: TObject);
begin
  State := 'INSERT';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);
  with sg_Report do
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

end;

procedure TfmCustomer.btn_UpdateClick(Sender: TObject);
begin
  State := 'UPDATE';
  FormEnable(State);
  ButtonEnable(State);

end;

procedure TfmCustomer.btn_CancelClick(Sender: TObject);
begin
  ShowCustomer(ed_eTelNo.Text);
end;

procedure TfmCustomer.btn_SearchClick(Sender: TObject);
begin
  L_nTopRow := 0;
  ShowCustomer('');
end;

procedure TfmCustomer.ShowCustomer(aTelNo: string);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
  stWhere : string;
begin
  GridInitialize(sg_Report); //스트링그리드 초기화
  State := 'SEARCH';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);



  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;
  stSql := 'Select * from TB_CUSTOMER ';
  stWhere := '';
  if ed_sTelNo.Text <> '' then
  begin
    if stWhere <> '' then stWhere := stWhere + ' AND '
    else stWhere := ' WHERE ';
    stWhere := stWhere + ' CU_TELNO Like ''%' + ed_sTelNo.Text + '%'' ';
  end;
  if ed_sname.Text <> '' then
  begin
    if stWhere <> '' then stWhere := stWhere + ' AND '
    else stWhere := ' WHERE ';
    stWhere := stWhere + ' CU_NAME Like ''%' + ed_sname.Text + '%'' ';
  end;
  if ed_Etc.Text <> '' then
  begin
    if stWhere <> '' then stWhere := stWhere + ' AND '
    else stWhere := ' WHERE ';
    stWhere := stWhere + ' CU_ETC Like ''%' + ed_Etc.Text + '%'' ';
  end;

  if stWhere <> '' then stSql := stSql + stWhere;

  stSql := stSql + ' order by CU_NAME ';
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

    First;
    nRow := 1;
    sg_report.RowCount := RecordCount + 1;
    While Not Eof do
    begin
      with sg_report do
      begin
        cells[0,nRow] := FindField('CU_TELNO').AsString;
        cells[1,nRow] := FindField('CU_NAME').AsString;
        cells[2,nRow] := FindField('CU_ETC').AsString;
        cells[3,nRow] := FindField('CU_EMAIL').AsString;
        if (FindField('CU_TELNO').AsString )  = aTelNo then
        begin
          SelectRows(nRow,1);
          sg_report.TopRow := L_nTopRow;
        end;
      end;
      inc(nRow);
      Next;
    end;

  end;
  sg_reportClick(sg_report);
  TempAdoQuery.Free;

end;

procedure TfmCustomer.sg_reportClick(Sender: TObject);
begin
  State := 'CLICK';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);
  with (Sender as TStringGrid) do
  begin
    if cells[0,Row] = '' then exit;
    ed_eTelNo.Text := cells[0,Row];
    ed_eName.Text := cells[1,Row];
    mem_Etc.Text := cells[2,row];
    ed_mail.Text := cells[3,Row];
  end;

end;

procedure TfmCustomer.btn_SaveClick(Sender: TObject);
var
  bResult : Boolean;
begin
  if Trim(ed_eTelNo.Text) = '' then
  begin
    showmessage('전화번호가 없습니다.');
    Exit;
  end;
  if UpperCase(State) = 'INSERT' then
    bResult := InsertTB_CUSTOMER(ed_eTelNo.Text,ed_ename.Text,ed_mail.Text,mem_etc.Text)
  else if UpperCase(State) = 'UPDATE' then
    bResult := UpdateTB_CUSTOMER(ed_eTelNo.Text,ed_ename.Text,ed_mail.Text,mem_etc.Text);

  if bResult then ShowCustomer(ed_eTelNo.Text)
  else showmessage('저장실패');
end;

function TfmCustomer.InsertTB_CUSTOMER(aTelNo, aName,aEmail,
  aEtc: string): Boolean;
var
  stSql : string;
begin
  result := False;

  stSql := 'Insert Into TB_CUSTOMER(CU_TELNO,CU_NAME,CU_EMAIL,CU_ETC) ';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + aTelNo + ''',';
  stSql := stSql + '''' + aName + ''',';
  stSql := stSql + '''' + aEmail + ''',';
  stSql := stSql + '''' + aEtc + ''') ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmCustomer.UpdateTB_CUSTOMER(aTelNo, aName,aEmail,
  aEtc: string): Boolean;
var
  stSql : string;
begin
  result := False;

  stSql := 'Update TB_CUSTOMER Set ';
  stSql := stSql + 'CU_NAME = ''' + aName + ''',';
  stSql := stSql + 'CU_EMAIL = ''' + aEmail + ''',';
  stSql := stSql + 'CU_ETC = ''' + aEtc + ''' ';
  stSql := stSql + ' where CU_TELNO = ''' + aTelNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

procedure TfmCustomer.btn_DeleteClick(Sender: TObject);
var
  bResult : Boolean;
begin
  if (Application.MessageBox(PChar('데이터를 삭제하시겠습니까?'),'삭제',MB_OKCANCEL) = ID_CANCEL)  then Exit;
  bResult := DeleteTB_CUSTOMER(ed_eTelNo.Text);

  if bResult then ShowCustomer(ed_eTelNo.Text)
  else showmessage('삭제실패.');

end;

function TfmCustomer.DeleteTB_CUSTOMER(aTelNo: string): Boolean;
var
  stSql : string;
begin
  result := False;

  stSql := 'Delete From TB_CUSTOMER ';
  stSql := stSql + ' where CU_TELNO = ''' + aTelNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmCustomer.FormActivate(Sender: TObject);
begin
  L_nTopRow := 0;
  ShowCustomer('');
end;

procedure TfmCustomer.ed_sTelNoChange(Sender: TObject);
begin
  ShowCustomer('');
end;

procedure TfmCustomer.ed_snameChange(Sender: TObject);
begin
  ShowCustomer('');
end;

procedure TfmCustomer.sg_reportSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  L_nTopRow := sg_report.TopRow;
end;

end.
