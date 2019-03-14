unit uSMSZoneSetting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BaseGrid, AdvGrid, StdCtrls, Buttons, ExtCtrls, ComCtrls,
  AdoDB,ActiveX, DB, AdvObj,uSubForm, CommandArray;

type
  TfmSMSZoneSetting = class(TfmASubForm)
    StatusBar1: TStatusBar;
    pan_header: TPanel;
    Panel5: TPanel;
    GroupBox11: TGroupBox;
    Label9: TLabel;
    lb_Building1: TLabel;
    lb_FloorCode1: TLabel;
    lb_AreaCode1: TLabel;
    Label2: TLabel;
    cmb_AlarmCode: TComboBox;
    cmb_BuildingCode1: TComboBox;
    cmb_FloorCode1: TComboBox;
    cmb_AreaCode1: TComboBox;
    cmb_MCUCode: TComboBox;
    sg_AlarmZone: TAdvStringGrid;
    ADOQuery: TADOQuery;
    Splitter2: TSplitter;
    Panel6: TPanel;
    GroupBox10: TGroupBox;
    Label1: TLabel;
    ed_AlarmNo: TEdit;
    ed_devicecode: TEdit;
    cmb_smsuse: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    ed_Telnum: TEdit;
    Label5: TLabel;
    mem_Message: TMemo;
    Label6: TLabel;
    Label7: TLabel;
    st_ZoneName: TStaticText;
    Panel2: TPanel;
    Panel1: TPanel;
    btn_Update: TBitBtn;
    btn_Save: TBitBtn;
    btn_Cancel: TBitBtn;
    btn_Add: TBitBtn;
    GroupBox1: TGroupBox;
    sg_smsphone: TAdvStringGrid;
    btn_Delete: TBitBtn;
    ed_OldTelNumber: TEdit;
    procedure Panel1Resize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmb_AlarmCodeChange(Sender: TObject);
    procedure sg_AlarmZoneClick(Sender: TObject);
    procedure btn_UpdateClick(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure cmb_BuildingCode1Change(Sender: TObject);
    procedure cmb_FloorCode1Change(Sender: TObject);
    procedure cmb_AreaCode1Change(Sender: TObject);
    procedure cmb_MCUCodeChange(Sender: TObject);
    procedure btn_AddClick(Sender: TObject);
    procedure sg_smsphoneClick(Sender: TObject);
    procedure btn_DeleteClick(Sender: TObject);
  private
    BuildingCodeList : TStringList;
    FloorCodeList : TStringList;
    AreaCodeList : TStringList;
    MCUIDList : TStringList;
    ALARMIDList : TStringList;
    FDefaultMessage: string;
    { Private declarations }
    procedure LoadBuildingCode(cmb_Box:TComboBox);
    procedure LoadFloorCode(aBuildingCode:string;cmb_Box:TComboBox);
    procedure LoadAreaCode(aBuildingCode,aFloorCode:string;cmb_Box:TComboBox);
    procedure MCULoad(aList:TStringList;aBuildingCode,aFloorCode,aAreaCode:string;cmb_Box: TComboBox; aType: string);
    procedure AlarmDeviceLoad(cmb_Box:TComboBox;bState:Boolean);
    procedure AlarmZoneSearch(aAlarmNo,aSearchAlarmNo:string;aTop :integer = 0);
    procedure ShowSMSPhone(aNodeNo,aEcuID,aAlarmNo:string);
    function CheckTB_SMSALARMZONE(aNodeNo,aEcuID,aZoneNum:string):Boolean;
    function CheckTB_SMSALARMZONE_PhoneNum(aNodeNo,aEcuID,aZoneNum,aPhoneNumber:string):Boolean;
  private
    State : string;
    procedure FormClear;
    procedure FormEnable(aState:string);
    procedure ButtonEnable(aState:string);
//    procedure GridInit;

  public
    { Public declarations }
    property DefaultMessage : string read FDefaultMessage write FDefaultMessage;
  end;

var
  fmSMSZoneSetting: TfmSMSZoneSetting;

implementation

uses
  uDataModule1,
  uLomosUtil;

{$R *.dfm}

procedure TfmSMSZoneSetting.LoadBuildingCode(cmb_Box: TComboBox);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin

  cmb_Box.Clear;
  cmb_Box.Enabled := True;
  BuildingCodeList.Clear;

  stSql := 'select * from TB_LOCATION ';
  stSql := stSql + ' where LO_GUBUN = ''0'' ';
  stSql := stSql + ' order by LO_DONGCODE ';

  cmb_Box.Items.Add('전체');
  BuildingCodeList.Add('');
  cmb_Box.ItemIndex := 0;

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

procedure TfmSMSZoneSetting.Panel1Resize(Sender: TObject);
var
  nWidth : integer;
  nBlock : integer;
  nLeft : integer;
  nCenter : integer;
begin
  nWidth := Panel1.Width;
  nBlock := (nWidth - 200) div 4; //양쪽으로 50 씩 띄우자

  nCenter := nBlock div 2;
  nLeft := nCenter - (btn_Update.Width div 2);

(*  btn_Update.Left := 100 + nLeft;
  btn_Save.Left := 100 + nBlock + nLeft;
  btn_Cancel.Left := 100 + (nBlock * 2) + nLeft;
  btn_Close.Left := 100 + (nBlock * 3) + nLeft;
*)
end;

procedure TfmSMSZoneSetting.FormCreate(Sender: TObject);
begin
  BuildingCodeList := TStringList.Create;
  FloorCodeList := TStringList.Create;
  AreaCodeList := TStringList.Create;
  MCUIDList := TStringList.Create;
  ALARMIDList := TStringList.Create;
end;

procedure TfmSMSZoneSetting.FormShow(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
begin
  stBuildingCode := '000';
  stFloorCode := '000';
  stAreaCode := '000';
  LoadBuildingCode(cmb_BuildingCode1);
  if cmb_BuildingCode1.ItemIndex > 0 then
  begin
    stBuildingCode := BuildingCodeList.Strings[cmb_BuildingCode1.ItemIndex];
    LoadFloorCode(stBuildingCode,cmb_FloorCode1);
    if cmb_FloorCode1.ItemIndex > 0 then
    begin
      stFloorCode := FloorCodeList.Strings[cmb_FloorCode1.ItemIndex];
      LoadAreaCode(stBuildingCode,stFloorCode,cmb_AreaCode1);
      if cmb_AreaCode1.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode1.ItemIndex];
    end;
  end;
  MCULoad(MCUIDList,stBuildingCode,stFloorCode,stAreaCode,cmb_MCUCode,'Y');
  AlarmDeviceLoad(cmb_AlarmCode,True);
  cmb_AlarmCodeChange(self);
end;

procedure TfmSMSZoneSetting.LoadAreaCode(aBuildingCode, aFloorCode: string;
  cmb_Box: TComboBox);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  AreaCodeList.Clear;

  stSql := 'select * from TB_LOCATION ';
  stSql := stSql + ' where LO_GUBUN = ''2'' ';

  if (aBuildingCode <> '') And (aBuildingCode <> '000')  then
  begin
    stSql := stSql + ' AND LO_DONGCODE = ''' + aBuildingCode + '''';
  end else Exit;

  if (aFloorCode <> '') And (aFloorCode <> '000')  then
  begin
    stSql := stSql + ' AND LO_FLOORCODE = ''' + aFloorCode + '''';
  end else Exit;
  stSql := stSql + ' order by LO_DONGCODE,LO_FLOORCODE ';

  cmb_Box.Items.Add('전체');
  AreaCodeList.Add('');
  cmb_Box.ItemIndex := 0;

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

procedure TfmSMSZoneSetting.LoadFloorCode(aBuildingCode: string;
  cmb_Box: TComboBox);
var
  stSql : string;
  TempAdoQuery:TADOQuery;
begin
  cmb_Box.Clear;
  FloorCodeList.Clear;

  stSql := 'select * from TB_LOCATION ';
  stSql := stSql + ' where LO_GUBUN = ''1'' ';
  if (aBuildingCode <> '') And (aBuildingCode <> '000')  then
  begin
    stSql := stSql + ' AND LO_DONGCODE = ''' + aBuildingCode + '''';
  end else Exit;
  stSql := stSql + ' order by LO_DONGCODE,LO_FLOORCODE';

  cmb_Box.Items.Add('전체');
  FloorCodeList.Add('');
  cmb_Box.ItemIndex := 0;

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

procedure TfmSMSZoneSetting.MCULoad(aList: TStringList; aBuildingCode,
  aFloorCode, aAreaCode: string; cmb_Box: TComboBox; aType: string);
var
  stSql : string;
  stDeviceName : string;
begin
  aList.Clear;
  cmb_Box.Clear;
  aList.Add('');
  if aType = 'Y' then
  begin
    cmb_Box.Items.Add('전체');
  end else
  begin
    cmb_Box.Items.Add('');
  end;
  cmb_Box.ItemIndex := 0;

  stSql := 'select * from TB_ACCESSDEVICE ';
  stSql := stSql + ' WHERE AC_ECUID = ''00'' ';
  if (aBuildingCode <> '') and (aBuildingCode <> '000') then
    stSql := stSql + ' AND LO_DONGCODE = ''' + aBuildingCode + ''' ';
  if (aFloorCode <> '') and (aFloorCode <> '000') then
    stSql := stSql + ' AND LO_FLOORCODE = ''' + aFloorCode + ''' ';
  if (aAreaCode <> '') and (aAreaCode <> '000') then
    stSql := stSql + ' AND LO_AREACODE = ''' + aAreaCode + ''' ';
  stSql := stSql + ' order by AC_NODENO,AC_ECUID ';
  with AdoQuery do
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
    while Not Eof do
    begin
      if FindField('AC_DEVICENAME').AsString = '' then stDeviceName := FindField('AC_MCUIP').AsString
      else stDeviceName := FindField('AC_DEVICENAME').AsString;
      cmb_Box.Items.Add(stDeviceName);
      aList.Add(FillZeroNumber(FindField('AC_NODENO').asinteger,3));
      Next;
    end;
  end;

end;

procedure TfmSMSZoneSetting.AlarmDeviceLoad(cmb_Box: TComboBox;
  bState: Boolean);
var
  stSql : string;
  stDeviceName : string;
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
  stNodeNo : string;
begin
  ALARMIDList.Clear;
  cmb_Box.Clear;
  cmb_Box.ItemIndex := -1;

  stSql := 'select * from TB_ACCESSDEVICE ';
  stSql := stSql + ' WHERE GROUP_CODE = ''1234567890'' ';
  if cmb_MCUCode.ItemIndex > 0 then
  begin
    stNodeNo := MCUIDList.Strings[cmb_MCUCode.ItemIndex];
    stSql := stSql + ' AND AC_NODENO = ' + stNodeNo + ' ';
  end else if cmb_BuildingCode1.itemIndex > 0 then
  begin
    stBuildingCode := BuildingCodeList.Strings[cmb_BuildingCode1.ItemIndex];
    stSql := stSql + ' AND LO_DONGCODE = ''' + stBuildingCode + ''' ';
    if cmb_FloorCode1.ItemIndex > 0 then
    begin
      stFloorCode := FloorCodeList.Strings[cmb_FloorCode1.ItemIndex];
      stSql := stSql + ' AND LO_FLOORCODE = ''' + stFloorCode + ''' ';
      if cmb_AreaCode1.ItemIndex > 0 then
      begin
        stAreaCode := AreaCodeList.Strings[cmb_AreaCode1.ItemIndex];
        stSql := stSql + ' AND LO_AREACODE = ''' + stAreaCode + ''' ';
      end;
    end;
  end;
  stSql := stSql + ' order by AC_NODENO,AC_ECUID ';
  with AdoQuery do
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
    while Not Eof do
    begin
      cmb_Box.Items.Add(FindField('AC_DEVICENAME').AsString);
      ALARMIDList.Add(FillZeroNumber(FindField('AC_NODENO').asinteger,3) + FindField('AC_ECUID').AsString);
      Next;
    end;
    cmb_Box.ItemIndex := 0;
  end;

end;

procedure TfmSMSZoneSetting.cmb_AlarmCodeChange(Sender: TObject);
var
  stAlarmNo : string;
begin
  Try
    if cmb_AlarmCode.itemIndex = -1 then cmb_AlarmCode.itemIndex := 0;
    stAlarmNo := ALARMIDList.Strings[cmb_AlarmCode.itemIndex];
    AlarmZoneSearch(stAlarmNo,'');
  Except
    Exit;
  End;
end;

procedure TfmSMSZoneSetting.AlarmZoneSearch(aAlarmNo,
  aSearchAlarmNo: string; aTop: integer);
var
  stSql : string;
  nRow : integer;
  TempAdoQuery : TADOQuery;
begin

  GridInit(sg_AlarmZone,3); //스트링그리드 초기화

  stSql := 'select a.*,b.AL_ZONENAME as AlarmName  from TB_ZONEDEVICE a ';
  stSql := stSql + ' Inner Join TB_ALARMDEVICE b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO  ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ) ';
//  stSql := stSql + ' Left Join TB_SMSALARMZONE c ';
//  stSql := stSql + ' ON ( a.AC_NODENO = c.AC_NODENO ';
//  stSql := stSql + ' AND a.AC_ECUID = c.AC_ECUID ';
//  stSql := stSql + ' AND a.AL_ZONENUM = c.AL_ZONENUM ) ';
  stSql := stSql + ' where a.GROUP_CODE = ''1234567890'' ';
  if (aAlarmNo <> '') and (aAlarmNo <> '000') then
  begin
    stSql := stSql + ' AND a.AC_NODENO = ' + inttostr(strtoint(copy(aAlarmNo,1,3))) ;
    stSql := stSql + ' AND a.AC_ECUID = ''' + copy(aAlarmNo,4,2) + ''' ';
  end;
  stSql := stSql + ' order by a.AC_NODENO,a.AC_ECUID,a.AL_ZONENUM ';

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
      sg_AlarmZone.RowCount := RecordCount + 1;
      nRow := 1;
      while Not Eof do
      begin
        with sg_AlarmZone do
        begin
          cells[0,nRow] := FindField('AlarmName').AsString;
          cells[1,nRow] := FindField('AL_ZONENUM').AsString;
          cells[2,nRow] := FindField('AL_ZONENAME').AsString;
//          cells[3,nRow] := FindField('SA_USE').AsString;
//          cells[4,nRow] := FindField('SA_MESSAGE').AsString;
//          cells[5,nRow] := FindField('SA_TELNO').AsString;
          cells[6,nRow] := FillZeroNumber(FindField('AC_NODENO').AsInteger,3) + FindField('AC_ECUID').AsString;

          if cells[6,nRow] + FindField('AL_ZONENUM').AsString = aSearchAlarmNo then
          begin
            SelectRows(nRow,1);
          end;

          nRow := nRow + 1;
        end;
        Next;
      end;
      if aTop <> 0 then
        sg_AlarmZone.topRow := aTop
      else
      begin
        if sg_AlarmZone.row > 11 then sg_AlarmZone.TopRow := sg_AlarmZone.row - 10;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  sg_AlarmZoneClick(sg_AlarmZone);
end;

procedure TfmSMSZoneSetting.sg_AlarmZoneClick(Sender: TObject);
begin

  with sg_AlarmZone do
  begin
    st_ZoneName.Caption := cells[2,Row];
//    if isDigit(cells[3,Row]) then cmb_smsuse.ItemIndex := strtoint(cells[3,Row])
//    else cmb_smsuse.ItemIndex := 0;
//    ed_Telnum.Text := cells[5,Row];
//    mem_Message.Text := cells[4,Row];
    ed_devicecode.Text := cells[6,Row];
    ed_AlarmNo.Text := cells[1,Row];
  end;

  showSMSPhone(copy(ed_devicecode.Text,1,3),copy(ed_devicecode.Text,4,2),ed_AlarmNo.Text);

end;

procedure TfmSMSZoneSetting.ButtonEnable(aState: string);
begin
  if upperCase(aState) = 'INSERT'  then
  begin
    btn_Add.Enabled := False;
    btn_update.Enabled := false;
    btn_Save.Enabled := True;
    btn_Cancel.Enabled := True;
    btn_Delete.Enabled := False;
  end else if upperCase(aState) = 'SEARCH' then
  begin
    btn_Add.Enabled := True;
    btn_Update.Enabled := False;
    btn_Save.Enabled := False;
    btn_Cancel.Enabled := False;
    btn_Delete.Enabled := True;
  end else if upperCase(aState) = 'UPDATE' then
  begin
    btn_Add.Enabled := False;
    btn_Update.Enabled := False;
    btn_Save.Enabled := True;
    btn_Cancel.Enabled := True;
    btn_Delete.Enabled := False;
  end else if upperCase(aState) = 'CLICK' then
  begin
    btn_Add.Enabled := True;
    btn_Update.Enabled := True;
    btn_Save.Enabled := False;
    btn_Cancel.Enabled := False;
    btn_Delete.Enabled := True;
  end;
end;

procedure TfmSMSZoneSetting.FormClear;
begin
//  st_ZoneName.Caption := '';
  cmb_smsuse.ItemIndex := 1;
  ed_Telnum.Text := '';
  mem_Message.Text := DefaultMessage;
end;

procedure TfmSMSZoneSetting.FormEnable(aState: string);
begin
  if upperCase(aState) = 'INSERT'  then
  begin
    cmb_smsuse.Enabled := True;
    ed_Telnum.Enabled := True;
    mem_Message.Enabled := True;
  end else if upperCase(aState) = 'SEARCH' then
  begin
    cmb_smsuse.Enabled := False;
    ed_Telnum.Enabled := False;
    mem_Message.Enabled := False;
  end else if upperCase(aState) = 'UPDATE' then
  begin
    cmb_smsuse.Enabled := True;
    ed_Telnum.Enabled := True;
    mem_Message.Enabled := True;
  end else if upperCase(aState) = 'CLICK' then
  begin
    cmb_smsuse.Enabled := False;
    ed_Telnum.Enabled := False;
    mem_Message.Enabled := False;
  end;
end;

(*
procedure TfmSMSZoneSetting.GridInit;
var
  nCol : integer;
begin
  with sg_AlarmZone do
  begin
    RowCount := 2;
    for nCol := 0 to ColCount - 1 do
    begin
      Cells[nCol,1] := '';
    end;
    for nCol := 3 to ColCount - 1 do
    begin
      ColWidths[nCol] := 0;
    end;
  end;
end;
*)

procedure TfmSMSZoneSetting.btn_UpdateClick(Sender: TObject);
begin
  State := 'UPDATE';
  FormEnable(State);
  ButtonEnable(State);
end;

procedure TfmSMSZoneSetting.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmSMSZoneSetting.btn_CancelClick(Sender: TObject);
var
  stAlarmNo : string;
begin
  if cmb_AlarmCode.itemIndex = -1 then cmb_AlarmCode.itemIndex := 0;
  stAlarmNo := ALARMIDList.Strings[cmb_AlarmCode.itemIndex];
  AlarmZoneSearch(stAlarmNo,ed_devicecode.Text + ed_AlarmNo.Text,sg_AlarmZone.TopRow);

end;

procedure TfmSMSZoneSetting.btn_SaveClick(Sender: TObject);
var
  stNodeNo : string;
  stEcuID : string;
  stZoneNum : string;
  stSql : string;
  stAlarmNo : string;
begin
  stNodeNo := copy(ed_devicecode.Text,1,3);
  stEcuID := copy(ed_devicecode.Text,4,2);
  stZoneNum := ed_AlarmNo.Text;

  if cmb_smsuse.ItemIndex > 0 then
  begin
    if (ed_Telnum.Text = '') or (mem_Message.Text = '') then
    begin
      showmessage('SMS를 사용하시려면 휴대폰번호와 전송문구를 입력하셔야 합니다.');
      Exit;
    end;
  end;
  ed_Telnum.Text := stringReplace(ed_Telnum.Text,'-','',[rfReplaceAll]);
  if Not isDigit(ed_Telnum.Text) then
  begin
    showmessage('휴대폰번호를 확인 하여 주세요.');
    Exit;
  end;
  if (copy(ed_Telnum.Text,1,3) <> '010') and (copy(ed_Telnum.Text,1,3) <> '011') and (copy(ed_Telnum.Text,1,3) <> '016') and (copy(ed_Telnum.Text,1,3) <> '017') and (copy(ed_Telnum.Text,1,3) <> '019') then
  begin
    showmessage('휴대폰번호를 확인 하여 주세요.');
    Exit;
  end;

  if State = 'UPDATE' then
  begin
    stSql := ' Update TB_SMSALARMZONE SET ';
    stSql := stSql + ' SA_USE = ''' + inttostr(cmb_smsuse.ItemIndex) + ''', ';
    stSql := stSql + ' SA_MESSAGE = ''' + mem_Message.Text + ''',';
    stSql := stSql + ' SA_TELNO = ''' + ed_Telnum.Text + ''' ';
    stSql := stSql + ' Where AC_NODENO = ' +  stNodeNo ;
    stSql := stSql + ' AND AC_ECUID = ''' + stEcuID + ''' ';
    stSql := stSql + ' AND AL_ZONENUM = ''' + stZoneNum + ''' ';
    stSql := stSql + ' AND SA_TELNO = ''' + ed_OldTelnumber.Text + ''' ';
    DataModule1.ProcessExecSQL(stSql);
  end
  else if State = 'INSERT' then
  begin
    if CheckTB_SMSALARMZONE_PhoneNum(stNodeNo,stEcuID,stZoneNum,ed_Telnum.Text) then
    begin
      showmessage('이미 존재하는 전화번호입니다.');
      Exit;
    end;
    stSql := ' Insert Into TB_SMSALARMZONE ( ';
    stSql := stSql + 'AC_NODENO,';
    stSql := stSql + 'AC_ECUID,';
    stSql := stSql + 'AL_ZONENUM,';
    stSql := stSql + 'SA_USE,';
    stSql := stSql + 'SA_MESSAGE,';
    stSql := stSql + 'SA_TELNO)';
    stSql := stSql + ' Values( ';
    stSql := stSql + '' + stNodeNo + ',';
    stSql := stSql + '''' + stEcuID + ''',';
    stSql := stSql + '''' + stZoneNum + ''',';
    stSql := stSql + '''' + inttostr(cmb_smsuse.ItemIndex) + ''',';
    stSql := stSql + '''' + mem_Message.Text + ''',';
    stSql := stSql + '''' + ed_Telnum.Text + ''')';
    DataModule1.ProcessExecSQL(stSql);
  end;
  showSMSPhone(copy(ed_devicecode.Text,1,3),copy(ed_devicecode.Text,4,2),ed_AlarmNo.Text);

end;

function TfmSMSZoneSetting.CheckTB_SMSALARMZONE(aNodeNo, aEcuID,
  aZoneNum: string): Boolean;
var
  stSql :string;
begin
  result := False;
  
  stSql := 'select * from TB_SMSALARMZONE ';
  stSql := stSql + ' Where AC_NODENO = ' +  aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND AL_ZONENUM = ''' + aZoneNum + ''' ';

  with ADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordcount < 1 then Exit;
    result := True;
  end;
end;

procedure TfmSMSZoneSetting.cmb_BuildingCode1Change(Sender: TObject);
var
  stNodeNo : string;
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
begin
  if cmb_BuildingCode1.itemindex < 0 then Exit;
  stBuildingCode := '000';
  stFloorCode := '000';
  stAreaCode := '000';

  stBuildingCode := BuildingCodeList.Strings[ cmb_BuildingCode1.itemindex ];
  LoadFloorCode(stBuildingCode,cmb_FloorCode1);
  if cmb_FloorCode1.ItemIndex > 0 then stFloorCode := FloorCodeList.Strings[cmb_FloorCode1.itemIndex];
  LoadAreaCode(stBuildingCode,stFloorCode,cmb_AreaCode1);
  if cmb_AreaCode1.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode1.itemIndex];;

  MCULoad(MCUIDList,stBuildingCode,stFloorCode,stAreaCode,cmb_MCUCode,'Y');

  AlarmDeviceLoad(cmb_AlarmCode,True);
  cmb_AlarmCodeChange(self);
end;

procedure TfmSMSZoneSetting.cmb_FloorCode1Change(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
  stNodeNo : string;
begin
  stBuildingCode := '000';
  stFloorCode := '000';
  stAreaCode := '000';
  if cmb_BuildingCode1.itemindex < 0 then Exit;
  stBuildingCode := BuildingCodeList.Strings[ cmb_BuildingCode1.itemindex ];
  if cmb_FloorCode1.itemindex < 0 then Exit;
  stFloorCode := FloorCodeList.Strings[ cmb_FloorCode1.itemindex ];
  LoadAreaCode(stBuildingCode,stFloorCode,cmb_AreaCode1);
  if cmb_AreaCode1.itemindex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode1.itemindex];
  MCULoad(MCUIDList,stBuildingCode,stFloorCode,stAreaCode,cmb_MCUCode,'Y');

  AlarmDeviceLoad(cmb_AlarmCode,True);
  cmb_AlarmCodeChange(self);

end;

procedure TfmSMSZoneSetting.cmb_AreaCode1Change(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
begin
  if cmb_BuildingCode1.itemindex < 0 then Exit;
  stBuildingCode := BuildingCodeList.Strings[ cmb_BuildingCode1.itemindex ];
  if cmb_FloorCode1.itemindex < 0 then Exit;
  stFloorCode := FloorCodeList.Strings[ cmb_FloorCode1.itemindex ];
  if cmb_AreaCode1.itemindex < 0 then Exit;
  stAreaCode := AreaCodeList.Strings[cmb_AreaCode1.itemindex];
  MCULoad(MCUIDList,stBuildingCode,stFloorCode,stAreaCode,cmb_MCUCode,'Y');

  AlarmDeviceLoad(cmb_AlarmCode,True);
  cmb_AlarmCodeChange(self);

end;

procedure TfmSMSZoneSetting.cmb_MCUCodeChange(Sender: TObject);
begin
  AlarmDeviceLoad(cmb_AlarmCode,True);
  cmb_AlarmCodeChange(self);

end;

procedure TfmSMSZoneSetting.ShowSMSPhone(aNodeNo, aEcuID,
  aAlarmNo: string);
var
  stSql : string;
  nRow : integer;
  TempAdoQuery : TADOQuery;
begin
  State := 'SEARCH';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);
  GridInit(sg_smsphone,3);

  stSql := 'Select * from TB_SMSALARMZONE ';
  stSql := stSql + ' where AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND AL_ZONENUM = ''' + aAlarmNo + ''' ';

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
      sg_smsphone.RowCount := RecordCount + 1;
      nRow := 1;
      while Not Eof do
      begin
        with sg_smsphone do
        begin
          cells[0,nRow] := FindField('SA_TELNO').AsString;
          cells[1,nRow] := FindField('SA_USE').AsString;
          cells[2,nRow] := FindField('SA_MESSAGE').AsString;

          nRow := nRow + 1;
        end;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  sg_smsphoneClick(sg_smsphone);
end;

procedure TfmSMSZoneSetting.btn_AddClick(Sender: TObject);
begin
  inherited;
  State := 'INSERT';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);
end;

procedure TfmSMSZoneSetting.sg_smsphoneClick(Sender: TObject);
begin
  inherited;
  State := 'CLICK';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  with sg_smsphone do
  begin
    if isDigit(cells[1,Row]) then cmb_smsuse.ItemIndex := strtoint(cells[1,Row])
    else cmb_smsuse.ItemIndex := 0;
    ed_Telnum.Text := cells[0,Row];
    ed_OldTelNumber.Text := cells[0,Row];
    mem_Message.Text := cells[2,Row];
  end;
  
end;

function TfmSMSZoneSetting.CheckTB_SMSALARMZONE_PhoneNum(aNodeNo, aEcuID,
  aZoneNum, aPhoneNumber: string): Boolean;
var
  stSql :string;
begin
  result := False;
  
  stSql := 'select * from TB_SMSALARMZONE ';
  stSql := stSql + ' Where AC_NODENO = ' +  aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND AL_ZONENUM = ''' + aZoneNum + ''' ';
  stSql := stSql + ' AND SA_TELNO = ''' + aPhoneNumber + ''' ';

  with ADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordcount < 1 then Exit;
    result := True;
  end;
end;

procedure TfmSMSZoneSetting.btn_DeleteClick(Sender: TObject);
var
  stNodeNo : string;
  stEcuID : string;
  stZoneNum : string;
  stSql : string;
begin
  inherited;
  stNodeNo := copy(ed_devicecode.Text,1,3);
  stEcuID := copy(ed_devicecode.Text,4,2);
  stZoneNum := ed_AlarmNo.Text;

  stSql := ' Delete from TB_SMSALARMZONE ';
  stSql := stSql + ' Where AC_NODENO = ' +  stNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + stEcuID + ''' ';
  stSql := stSql + ' AND AL_ZONENUM = ''' + stZoneNum + ''' ';
  stSql := stSql + ' AND SA_TELNO = ''' + ed_OldTelnumber.Text + ''' ';
  DataModule1.ProcessExecSQL(stSql);
  showSMSPhone(copy(ed_devicecode.Text,1,3),copy(ed_devicecode.Text,4,2),ed_AlarmNo.Text);

end;

end.
