unit uBarCode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, BaseGrid, AdvGrid, ComCtrls, Buttons,
  ActiveX,ADODB, uSubForm, CommandArray;

type
  TfmBarCode = class(TfmASubForm)
    Panel12: TPanel;
    GroupBox8: TGroupBox;
    btn_Insert: TSpeedButton;
    btn_Update: TSpeedButton;
    btn_Save: TSpeedButton;
    btn_Delete: TSpeedButton;
    btn_Close: TSpeedButton;
    btn_Cancel: TSpeedButton;
    StatusBar1: TStatusBar;
    GroupBox2: TGroupBox;
    Splitter1: TSplitter;
    Panel2: TPanel;
    sg_Code: TAdvStringGrid;
    Panel3: TPanel;
    GroupBox7: TGroupBox;
    Label20: TLabel;
    lb_McuID: TLabel;
    ed_Ip: TEdit;
    ed_Port: TEdit;
    Label1: TLabel;
    cmb_Door: TComboBox;
    Label2: TLabel;
    cmb_Reader: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_CloseClick(Sender: TObject);
    procedure sg_CodeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_InsertClick(Sender: TObject);
    procedure btn_UpdateClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure btn_DeleteClick(Sender: TObject);
  private
    DoorCodeList :TStringList;
    L_nTopRow : integer;
    { Private declarations }
    procedure DoorLoad;
    procedure FormClear;
    procedure FormEnable(aState:string);
    procedure ButtonEnable(aState:string);

    procedure SearchBarCode(aIP,aPort:string;aTop :integer = 0);
  private
    function InsertIntoTB_BARCODE(aip,aport,aNodeNo,aEcuID,aDoorNO,aReaderNo:string):Boolean;
    function UpdateTB_BARCODE(aip,aport,aNodeNo,aEcuID,aDoorNO,aReaderNo:string):Boolean;
    function DeleteTB_BARCODE(aip,aport:string):Boolean;
  public
    { Public declarations }
  end;

var
  fmBarCode: TfmBarCode;
  State : string;

implementation

uses
  uLomosUtil,
  uDataModule1;

{$R *.dfm}

{ TfmBarCode }

procedure TfmBarCode.DoorLoad;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  DoorCodeList.Clear;
  cmb_Door.Clear;

  stSql := 'select * from TB_DOOR ';
  stSql := stSql + ' Order by DO_VIEWSEQ,DO_DOORNONAME ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery  do
    begin
      Close;
      SQL.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      While Not Eof do
      begin
        DoorCodeList.Add(FillZeroNumber(FindField('AC_NODENO').asInteger,3) + FindField('AC_ECUID').asstring + FindField('DO_DOORNO').asstring);
        cmb_Door.items.Add(FindField('DO_DOORNONAME').asstring);
        Next;
      end;
    End;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;


end;

procedure TfmBarCode.FormCreate(Sender: TObject);
begin
  DoorCodeList := TStringList.Create;
  DoorLoad;
end;

procedure TfmBarCode.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DoorCodeList.Free;
end;

procedure TfmBarCode.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmBarCode.ButtonEnable(aState: string);
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

procedure TfmBarCode.FormClear;
begin
  ed_Ip.Text := '';
  ed_Port.Text := '';
  cmb_Door.ItemIndex := -1;
  cmb_Reader.ItemIndex := -1;
end;

procedure TfmBarCode.FormEnable(aState: string);
begin
  if upperCase(aState) = 'INSERT'  then
  begin
    ed_Ip.Enabled := True;
    ed_Port.Enabled := True;
    cmb_Door.Enabled := True;
    cmb_Reader.Enabled := True;
    sg_Code.Enabled := False;
  end else if upperCase(aState) = 'SEARCH' then
  begin
    ed_Ip.Enabled := False;
    ed_Port.Enabled := False;
    cmb_Door.Enabled := False;
    cmb_Reader.Enabled := False;
    sg_Code.Enabled := True;
  end else if upperCase(aState) = 'CLICK' then
  begin
    ed_Ip.Enabled := False;
    ed_Port.Enabled := False;
    cmb_Door.Enabled := False;
    cmb_Reader.Enabled := False;
    sg_Code.Enabled := True;
  end else if upperCase(aState) = 'UPDATE' then
  begin
    ed_Ip.Enabled := False;
    ed_Port.Enabled := False;
    cmb_Door.Enabled := True;
    cmb_Reader.Enabled := True;
    sg_Code.Enabled := False;
  end;

end;

procedure TfmBarCode.SearchBarCode(aIP,aPort:string;aTop :integer = 0);
var
  stSql : string;
  nRow : integer;
  TempAdoQuery : TADOQuery;
begin
  GridInit(sg_Code,2);
  State := 'SEARCH';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  stSql := 'select * from TB_BARCODE ';
  stSql := stSql + ' Order by BC_IP,BC_PORT ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery  do
    begin
      Close;
      SQL.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if RecordCount < 1 then exit;
      nRow := 1;
      sg_Code.RowCount := RecordCount + 1;

      While Not Eof do
      begin
        with sg_code do
        begin
          Cells[0,nRow] := FindField('BC_IP').AsString;
          Cells[1,nRow] := FindField('BC_PORT').AsString;
          Cells[2,nRow] := inttostr(FindField('AC_NODENO').AsInteger);
          Cells[3,nRow] := FindField('AC_ECUID').AsString;
          Cells[4,nRow] := FindField('DO_DOORNO').AsString;
          Cells[5,nRow] := FindField('DO_READER').AsString;
          if (aIP = FindField('BC_IP').AsString) and (aPort = FindField('BC_PORT').AsString ) then
          begin
            SelectRows(nRow,1);
          end;
          inc(nRow);
        end;
        Next;
      end;
    End;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  sg_CodeClick(sg_Code);
  if aTop <> 0 then
    sg_Code.topRow := aTop
  else
  begin
    if sg_Code.row > 17 then sg_Code.TopRow := sg_Code.row - 16;
  end;

  
end;

procedure TfmBarCode.sg_CodeClick(Sender: TObject);
var
  stECUID : string;
  stNODENO : string;
  stDoorNo : string;
  nIndex : integer;
begin
  with sg_Code do
  begin
    if Cells[0,Row] = '' then Exit;
    FormClear;
    FormEnable('CLICK');
    ButtonEnable('CLICK');
    ed_Ip.Text := Cells[0,Row];
    ed_Port.Text := Cells[1,Row];
    stNodeNo := FillZeronumber(strtoint(Cells[2,Row]),3);
    stEcuID := Cells[3,Row];
    stDoorNo := Cells[4,Row];
    nIndex := DoorCodeList.IndexOf(stNodeNo + stEcuID + stDoorNo);
    cmb_Door.ItemIndex := nIndex;
    if isdigit(Cells[5,Row]) then cmb_Reader.ItemIndex := strtoint(Cells[5,Row]) - 1;
  end;

end;

procedure TfmBarCode.FormShow(Sender: TObject);
begin
  inherited;
  SearchBarCode('','');
end;

procedure TfmBarCode.btn_InsertClick(Sender: TObject);
begin
  inherited;
  L_nTopRow := sg_Code.TopRow;
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
  ed_Ip.SetFocus;

end;

procedure TfmBarCode.btn_UpdateClick(Sender: TObject);
begin
  inherited;
  L_nTopRow := sg_Code.TopRow;
  State := 'UPDATE';
  FormEnable(State);
  ButtonEnable(State);
  cmb_Door.SetFocus;
end;

procedure TfmBarCode.btn_CancelClick(Sender: TObject);
begin
  SearchBarCode( ed_Ip.Text,ed_Port.Text,L_nTopRow);
end;

procedure TfmBarCode.btn_SaveClick(Sender: TObject);
var
  stNodeNo : string;
  stEcuID : string;
  stDoorNo : string;
  stTemp : string;
  bResult : Boolean;
begin
  inherited;
  if cmb_Door.ItemIndex < 0 then
  begin
    showmessage('제어할 출입문을 선택 하셔야 합니다.');
  end;
  stTemp := DoorCodeList.Strings[cmb_Door.ItemIndex];
  stNodeNo := copy(stTemp,1,3);
  stEcuID := copy(stTemp,4,2);
  stDoorNo := copy(stTemp,6,1);

  if Uppercase(State) = 'INSERT' then
  begin
    bResult := InsertIntoTB_BARCODE(ed_ip.Text,ed_port.Text,stNodeNo,stEcuID,stDoorNO,cmb_Reader.text);
  end else if Uppercase(State) = 'UPDATE' then
  begin
    bResult := UpdateTB_BARCODE(ed_ip.Text,ed_port.Text,stNodeNo,stEcuID,stDoorNO,cmb_Reader.text);
  end;

  if Not bResult then
  begin
    showmessage('데이터 저장에 실패 했습니다.');
    btn_Save.Enabled := True;
    Exit;
  end;

  if Uppercase(State) = 'UPDATE' then
    SearchBarCode( ed_Ip.Text,ed_Port.Text,sg_Code.topRow)
  else
    SearchBarCode( ed_Ip.Text,ed_Port.Text);

end;

function TfmBarCode.DeleteTB_BARCODE(aip, aport: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Delete From TB_BARCODE ';
  stSql := stSql + ' Where BC_IP = ''' + aIP + ''' ';
  stSql := stSql + ' AND BC_PORT = ''' + aPort + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmBarCode.InsertIntoTB_BARCODE(aip, aport, aNodeNo, aEcuID,
  aDoorNO,aReaderNo: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_BARCODE( ';
  stSql := stSql + ' BC_IP,';
  stSql := stSql + ' BC_PORT,';
  stSql := stSql + ' AC_NODENO,';
  stSql := stSql + ' AC_ECUID,';
  stSql := stSql + ' DO_DOORNO, ';
  stSql := stSql + ' DO_READER ) ';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + aip + ''',';
  stSql := stSql + '''' + aport + ''',';
  stSql := stSql + '' + aNodeNo + ',';
  stSql := stSql + '''' + aEcuID + ''',';
  stSql := stSql + '''' + aDoorNO + ''',';
  stSql := stSql + '''' + aReaderNo + ''')';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmBarCode.UpdateTB_BARCODE(aip, aport, aNodeNo, aEcuID,
  aDoorNO,aReaderNo: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_BARCODE set ';
  stSql := stSql + ' AC_NODENO = ' + aNodeNo + ',';
  stSql := stSql + ' AC_ECUID = ''' + aEcuID + ''',';
  stSql := stSql + ' DO_DOORNO = ''' + aDoorNO + ''',  ';
  stSql := stSql + ' DO_READER = ''' + aReaderNo + '''  ';
  stSql := stSql + ' Where BC_IP = ''' + aip + '''';
  stSql := stSql + ' AND BC_PORT = ''' + aport + '''';

  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmBarCode.btn_DeleteClick(Sender: TObject);
var
  bResult : Boolean;
begin
  inherited;
  if (Application.MessageBox(PChar('데이터를 삭제하시겠습니까?'),'삭제',MB_OKCANCEL) = ID_CANCEL)  then Exit;

  bResult := DeleteTB_BARCODE(ed_Ip.Text,ed_Port.Text);

  SearchBarCode( ed_Ip.Text,ed_Port.Text);
end;

end.
