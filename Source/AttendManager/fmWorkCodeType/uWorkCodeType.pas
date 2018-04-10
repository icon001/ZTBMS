unit uWorkCodeType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, BaseGrid, AdvGrid, StdCtrls, Buttons, ComCtrls,
  uSubForm, CommandArray,ActiveX,ADODB,DB, AdvObj;

type
  TfmWorkCodeType = class(TfmASubForm)
    Panel12: TPanel;
    StatusBar1: TStatusBar;
    GroupBox6: TGroupBox;
    btn_Insert: TSpeedButton;
    btn_Update: TSpeedButton;
    btn_Save: TSpeedButton;
    btn_Delete: TSpeedButton;
    btn_Close: TSpeedButton;
    btn_Cancel: TSpeedButton;
    Panel2: TPanel;
    sg_Code: TAdvStringGrid;
    Splitter1: TSplitter;
    Panel3: TPanel;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    ed_Code: TEdit;
    chk_AutoCode: TCheckBox;
    Label2: TLabel;
    ed_name: TEdit;
    ed_YesterDayTime: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    cmb_Saturday: TComboBox;
    Label5: TLabel;
    cmb_AtDevicType: TComboBox;
    Label6: TLabel;
    cmb_FixAtType: TComboBox;
    Label7: TLabel;
    cmb_NotBackupType: TComboBox;
    Label8: TLabel;
    ed_atStart: TEdit;
    Label9: TLabel;
    ed_atOff: TEdit;
    Label10: TLabel;
    cmb_inOutDeviceType: TComboBox;
    Label11: TLabel;
    ed_WorkOut: TEdit;
    ed_WorkIn: TEdit;
    Label12: TLabel;
    procedure StringGrideDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure FormActivate(Sender: TObject);
    procedure sg_CodeClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_InsertClick(Sender: TObject);
    procedure chk_AutoCodeClick(Sender: TObject);
    procedure btn_DeleteClick(Sender: TObject);
    procedure btn_UpdateClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
  private
    State : string;
    { Private declarations }
    procedure FormClear;
    procedure FormEnable(aState:string);
    procedure ButtonEnable(aState:string);
    procedure ShowWorkCode(aCode:string);
    Function GetAutoWorkCode:string;

  private
    Function DeleteTB_ATWorkCode(aCode:string):Boolean;
    Function InsertTB_ATWORKTYPE(aCode,aName,aYesterDayTime,
                       aSaturday,aAtDevicType,aFixAtType,aNotBackupType,
                       aAtStart,aAtOff,aInOutDeviceType,aWorkOut,aWorkIn:string):Boolean;
    Function UpdateTB_ATWORKTYPE(aCode,aName,aYesterDayTime,
                       aSaturday,aAtDevicType,aFixAtType,aNotBackupType,
                       aAtStart,aAtOff,aInOutDeviceType,aWorkOut,aWorkIn:string):Boolean;
  public
    { Public declarations }
  end;

var
  fmWorkCodeType: TfmWorkCodeType;

implementation

uses
  uDataModule1,
  uLomosUtil;

{$R *.dfm}

{ TfmWorkCodeType }

procedure TfmWorkCodeType.StringGrideDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  DataInCell : string;
  nLeft,nTop : integer;
begin
  if (AROW < (Sender as TStringGrid).FixedRows) then
  begin

    DataInCell := (Sender as TStringGrid).Cells[Acol,Arow];

    with (Sender as TStringGrid).Canvas do
    begin
      FillRect(Rect);  //켄버스를 칠한다.(기본값은 흰색)

      if DataInCell <> '' then
      begin
        nLeft := ((Rect.Right-Rect.Left) - TextWidth(DataInCell)) div 2;
        nTop := ((Rect.Bottom-Rect.Top) - TextHeight(DataInCell)) div 2;
        TextRect(Rect, Rect.Left + nLeft, Rect.Top + nTop, DataInCell);  //문자를 뿌려준다.. 기본은 검정색
      end;

    End;
  End;

end;

procedure TfmWorkCodeType.FormActivate(Sender: TObject);
begin
 ShowWorkCode('');

end;

procedure TfmWorkCodeType.ShowWorkCode(aCode: string);
var
  stSql : string;
  nRow : integer;
  i : integer;
  TempAdoQuery : TADOQuery;
begin
  GridInit(sg_Code,2); //스트링그리드 초기화

  State := 'SEARCH';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  stSql := 'select * from TB_ATWORKTYPE ';
  stSql := stSql + ' Order by AW_CODE ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

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
          cells[0,nRow] := FindField('AW_CODE').AsString;
          cells[1,nRow] := FindField('AW_NAME').AsString;
          cells[2,nRow] := FindField('AW_YESTERDAYTIME').AsString;
          cells[3,nRow] := FindField('AW_SATURDAYTYPE').AsString;
          cells[4,nRow] := FindField('AW_DEVICETYPE').AsString;
          cells[5,nRow] := FindField('AW_FIXATTYPE').AsString;
          cells[6,nRow] := FindField('AW_NOTBACKUPTYPE').AsString;
          cells[7,nRow] := FindField('AW_ATSTARTBUTTON').AsString;
          cells[8,nRow] := FindField('AW_ATOFFBUTTON').AsString;
          cells[9,nRow] := FindField('AW_INOUTDEVICETYPE').AsString;
          cells[10,nRow] := FindField('AW_WORKOUTBUTTON').AsString;
          cells[11,nRow] := FindField('AW_WORKINBUTTON').AsString;
          if FindField('AW_CODE').AsString  = aCode then
          begin
            SelectRows(nRow,1);
          end;

          nRow := nRow + 1;
          Next;
        end;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  sg_CodeClick(sg_Code);
end;

procedure TfmWorkCodeType.sg_CodeClick(Sender: TObject);
begin
  inherited;
  State := 'CLICK';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);
  with sg_code do
  begin
    ed_Code.Text := cells[0,Row];
    ed_name.Text := cells[1,Row];
    ed_YesterDayTime.Text := cells[2,Row];
    if isDigit(cells[3,Row]) then cmb_Saturday.ItemIndex := strtoint(cells[3,Row])
    else cmb_Saturday.ItemIndex := 0;
    if isDigit(cells[4,Row]) then cmb_AtDevicType.ItemIndex := strtoint(cells[4,Row])
    else cmb_AtDevicType.ItemIndex := 0;
    if isDigit(cells[5,Row]) then cmb_FixAtType.ItemIndex := strtoint(cells[5,Row])
    else cmb_FixAtType.ItemIndex := 0;
    if isDigit(cells[6,Row]) then cmb_NotBackupType.ItemIndex := strtoint(cells[6,Row])
    else cmb_NotBackupType.ItemIndex := 0;
    ed_atStart.Text := cells[7,Row];
    ed_atOff.Text := cells[8,Row];
    if isDigit(cells[9,Row]) then cmb_inOutDeviceType.ItemIndex := strtoint(cells[9,Row])
    else cmb_inOutDeviceType.ItemIndex := 0;
    ed_WorkOut.Text := cells[10,Row];
    ed_WorkIn.Text := cells[11,Row];

  end;

end;

procedure TfmWorkCodeType.ButtonEnable(aState: string);
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

procedure TfmWorkCodeType.FormClear;
begin
  ed_Code.Text := '';
  ed_name.Text := '';
  ed_YesterDayTime.Text := '';
  cmb_Saturday.ItemIndex := 0;
  cmb_AtDevicType.ItemIndex := 0;
  cmb_FixAtType.ItemIndex := 0;
  cmb_NotBackupType.ItemIndex := 0;
  ed_atStart.Text := '';
  ed_atOff.Text := '';
  cmb_inOutDeviceType.ItemIndex := 0;
  ed_WorkOut.Text := '';
  ed_WorkIn.Text := '';
end;

procedure TfmWorkCodeType.FormEnable(aState: string);
begin
  if upperCase(aState) = 'INSERT'  then
  begin
    chk_AutoCode.Enabled := True;
    ed_Code.Enabled := True;
    ed_name.Enabled := True;
    ed_YesterDayTime.Enabled := True;
    cmb_Saturday.Enabled := True;
    cmb_AtDevicType.Enabled := True;
    cmb_FixAtType.Enabled := True;
    cmb_NotBackupType.Enabled := True;
    ed_atStart.Enabled := True;
    ed_atOff.Enabled := True;
    cmb_inOutDeviceType.Enabled := True;
    ed_WorkOut.Enabled := True;
    ed_WorkIn.Enabled := True;
  end else if upperCase(aState) = 'SEARCH' then
  begin
    chk_AutoCode.Enabled := False;
    ed_Code.Enabled := False;
    ed_name.Enabled := False;
    ed_YesterDayTime.Enabled := False;
    cmb_Saturday.Enabled := False;
    cmb_AtDevicType.Enabled := False;
    cmb_FixAtType.Enabled := False;
    cmb_NotBackupType.Enabled := False;
    ed_atStart.Enabled := False;
    ed_atOff.Enabled := False;
    cmb_inOutDeviceType.Enabled := False;
    ed_WorkOut.Enabled := False;
    ed_WorkIn.Enabled := False;
  end else if upperCase(aState) = 'CLICK' then
  begin
    chk_AutoCode.Enabled := False;
    ed_Code.Enabled := False;
    ed_name.Enabled := False;
    ed_YesterDayTime.Enabled := False;
    cmb_Saturday.Enabled := False;
    cmb_AtDevicType.Enabled := False;
    cmb_FixAtType.Enabled := False;
    cmb_NotBackupType.Enabled := False;
    ed_atStart.Enabled := False;
    ed_atOff.Enabled := False;
    cmb_inOutDeviceType.Enabled := False;
    ed_WorkOut.Enabled := False;
    ed_WorkIn.Enabled := False;
  end else if upperCase(aState) = 'UPDATE' then
  begin
    chk_AutoCode.Enabled := False;
    ed_Code.Enabled := False;
    ed_name.Enabled := True;
    ed_YesterDayTime.Enabled := True;
    cmb_Saturday.Enabled := True;
    cmb_AtDevicType.Enabled := True;
    cmb_FixAtType.Enabled := True;
    cmb_NotBackupType.Enabled := True;
    ed_atStart.Enabled := True;
    ed_atOff.Enabled := True;
    cmb_inOutDeviceType.Enabled := True;
    ed_WorkOut.Enabled := True;
    ed_WorkIn.Enabled := True;
  end;

end;

procedure TfmWorkCodeType.btn_CancelClick(Sender: TObject);
begin
  inherited;
  ShowWorkCode(ed_code.Text);
end;

procedure TfmWorkCodeType.btn_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmWorkCodeType.btn_InsertClick(Sender: TObject);
begin
  inherited;
  State := 'INSERT';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);
  if chk_AutoCode.Checked then chk_AutoCodeClick(self);
end;

procedure TfmWorkCodeType.chk_AutoCodeClick(Sender: TObject);
begin
  inherited;
  if chk_AutoCode.Checked then ed_Code.Text := GetAutoWorkCode;

end;

function TfmWorkCodeType.GetAutoWorkCode: string;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin

  result := '001';
  
  stSql := 'select Max(AW_CODE) as AW_CODE from TB_ATWORKTYPE ';
  stSql := stSql + ' Order by AW_CODE ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

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
      if isDigit(FindField('AW_CODE').AsString) then
      begin
        result := FillZeroNumber(strtoint(FindField('AW_CODE').AsString) + 1,3);
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmWorkCodeType.btn_DeleteClick(Sender: TObject);
begin
  inherited;
  if ed_Code.Text = '001' then
  begin
    showmessage('001 코드는 기본코드이므로 삭제 할 수 없습니다.');
    Exit;
  end;
  if DeleteTB_ATWorkCode(ed_Code.Text) then
  begin
    ShowWorkCode('');
  end else
  begin
    showmessage('근무자타입관리 코드 삭제에 실패하였습니다.');
  end;
end;

function TfmWorkCodeType.DeleteTB_ATWorkCode(aCode: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Delete From TB_ATWORKTYPE ';
  stSql := stSql + ' Where AW_CODE = ''' + aCode + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmWorkCodeType.btn_UpdateClick(Sender: TObject);
begin
  inherited;
  State := 'UPDATE';
  FormEnable(State);
  ButtonEnable(State);

end;

procedure TfmWorkCodeType.FormResize(Sender: TObject);
var
  nWidth : integer;
  nBlock : integer;
  nLeft : integer;
  nCenter : integer;
begin
  nWidth := fmWorkCodeType.Width;
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

procedure TfmWorkCodeType.btn_SaveClick(Sender: TObject);
var
  bResult : Boolean;
begin
  inherited;
  if Not isDigit(ed_Code.Text) then
  begin
    showmessage('근무자타입코드는 숫자타입입니다.');
    Exit;
  end;
  if ed_name.Text = '' then
  begin
    showmessage('근무자타입 명칭이 없습니다.');
    Exit;
  end;
  if (Not IsDigit(ed_YesterDayTime.Text)) or (Length(ed_YesterDayTime.Text) <> 4) then
  begin
    showmessage('어제 퇴근기준시간은 4자리 숫자입니다.');
    Exit;
  end;

  if State = 'INSERT' then
  begin
    bResult := InsertTB_ATWORKTYPE(ed_Code.Text,ed_name.Text,ed_YesterDayTime.Text,
                       copy(cmb_Saturday.Text,1,1),copy(cmb_AtDevicType.Text,1,1),
                       copy(cmb_FixAtType.Text,1,1),copy(cmb_NotBackupType.Text,1,1),
                       ed_atStart.Text,ed_atOff.Text,copy(cmb_inOutDeviceType.Text,1,1),
                       ed_WorkOut.Text,ed_WorkIn.Text);
  end else if State = 'UPDATE' then
  begin
    bResult := UpdateTB_ATWORKTYPE(ed_Code.Text,ed_name.Text,ed_YesterDayTime.Text,
                       copy(cmb_Saturday.Text,1,1),copy(cmb_AtDevicType.Text,1,1),
                       copy(cmb_FixAtType.Text,1,1),copy(cmb_NotBackupType.Text,1,1),
                       ed_atStart.Text,ed_atOff.Text,copy(cmb_inOutDeviceType.Text,1,1),
                       ed_WorkOut.Text,ed_WorkIn.Text);
  end;
  if Not bResult then showmessage('데이터 저장에 실패하였습니다.')
  else ShowWorkCode(ed_code.Text);
end;

function TfmWorkCodeType.InsertTB_ATWORKTYPE(aCode, aName, aYesterDayTime,
  aSaturday, aAtDevicType, aFixAtType, aNotBackupType, aAtStart, aAtOff,
  aInOutDeviceType, aWorkOut, aWorkIn: string): Boolean;
var
  stTemp : string;
begin
    stTemp := 'Insert Into TB_ATWORKTYPE(';
    stTemp := stTemp + 'AW_CODE,';
    stTemp := stTemp + 'AW_NAME,';
    stTemp := stTemp + 'AW_YESTERDAYTIME,';
    stTemp := stTemp + 'AW_SATURDAYTYPE,';
    stTemp := stTemp + 'AW_DEVICETYPE,';
    stTemp := stTemp + 'AW_FIXATTYPE,';
    stTemp := stTemp + 'AW_NOTBACKUPTYPE,';
    stTemp := stTemp + 'AW_ATSTARTBUTTON,';
    stTemp := stTemp + 'AW_ATOFFBUTTON,';
    stTemp := stTemp + 'AW_INOUTDEVICETYPE,';
    stTemp := stTemp + 'AW_WORKOUTBUTTON,';
    stTemp := stTemp + 'AW_WORKINBUTTON) ';
    stTemp := stTemp + ' Values( ';
    stTemp := stTemp + '''' + aCode + ''',';
    stTemp := stTemp + '''' + aName + ''',';
    stTemp := stTemp + '''' + aYesterDayTime + ''',';
    stTemp := stTemp + '''' + aSaturday + ''',';
    stTemp := stTemp + '''' + aAtDevicType + ''',';
    stTemp := stTemp + '''' + aFixAtType + ''',';
    stTemp := stTemp + '''' + aNotBackupType + ''',';
    stTemp := stTemp + '''' + aAtStart + ''',';
    stTemp := stTemp + '''' + aAtOff + ''',';
    stTemp := stTemp + '''' + aInOutDeviceType + ''',';
    stTemp := stTemp + '''' + aWorkOut + ''',';
    stTemp := stTemp + '''' + aWorkIn + ''') ';

    result := DataModule1.ProcessExecSQL(stTemp);

end;

function TfmWorkCodeType.UpdateTB_ATWORKTYPE(aCode, aName, aYesterDayTime,
  aSaturday, aAtDevicType, aFixAtType, aNotBackupType, aAtStart, aAtOff,
  aInOutDeviceType, aWorkOut, aWorkIn: string): Boolean;
var
  stTemp : string;
begin
    stTemp := 'Update TB_ATWORKTYPE set ';
    stTemp := stTemp + 'AW_NAME = ''' + aName + ''',';
    stTemp := stTemp + 'AW_YESTERDAYTIME = ''' + aYesterDayTime + ''',';
    stTemp := stTemp + 'AW_SATURDAYTYPE = ''' + aSaturday + ''',';
    stTemp := stTemp + 'AW_DEVICETYPE = ''' + aAtDevicType + ''',';
    stTemp := stTemp + 'AW_FIXATTYPE = ''' + aFixAtType + ''',';
    stTemp := stTemp + 'AW_NOTBACKUPTYPE = ''' + aNotBackupType + ''',';
    stTemp := stTemp + 'AW_ATSTARTBUTTON = ''' + aAtStart + ''',';
    stTemp := stTemp + 'AW_ATOFFBUTTON = ''' + aAtOff + ''',';
    stTemp := stTemp + 'AW_INOUTDEVICETYPE = ''' + aInOutDeviceType + ''',';
    stTemp := stTemp + 'AW_WORKOUTBUTTON = ''' + aWorkOut + ''',';
    stTemp := stTemp + 'AW_WORKINBUTTON = ''' + aWorkIn + ''' ';
    stTemp := stTemp + ' Where AW_CODE = ''' + aCode + ''' ';

    result := DataModule1.ProcessExecSQL(stTemp);

end;

end.
