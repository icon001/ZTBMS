unit uAlarmZoneAdmin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Buttons, Grids, BaseGrid, AdvGrid, Mask, RzEdit,
  RzSpnEdt, StdCtrls, Spin, ExtCtrls, RzCmboBx, DB, ADODB,ActiveX;

type
  TfmAlarmZoneAdmin = class(TForm)
    pan_header: TPanel;
    GroupBox4: TGroupBox;
    Splitter2: TSplitter;
    Panel6: TPanel;
    GroupBox10: TGroupBox;
    Label7: TLabel;
    Label22: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label23: TLabel;
    Label12: TLabel;
    ed_regZoneNO: TEdit;
    cmb_regAlarmCode: TComboBox;
    cmb_sBuildingCode: TComboBox;
    cmb_sFloorCode: TComboBox;
    cmb_sAreaCode: TComboBox;
    ed_TotWidth: TEdit;
    ed_TotHeight: TEdit;
    ed_CurX: TEdit;
    ed_CurY: TEdit;
    btnAlarmPosition: TBitBtn;
    chk_AlarmReg: TCheckBox;
    Panel5: TPanel;
    GroupBox11: TGroupBox;
    Label9: TLabel;
    cmb_AlarmCode: TComboBox;
    sg_AlarmZone: TAdvStringGrid;
    Panel1: TPanel;
    btn_Update: TSpeedButton;
    btn_Save: TSpeedButton;
    btn_Close: TSpeedButton;
    btn_Cancel: TSpeedButton;
    StatusBar1: TStatusBar;
    Label29: TLabel;
    cmb_WatchType: TComboBox;
    ADOQuery: TADOQuery;
    ed_AlarmNo: TEdit;
    chk_View: TCheckBox;
    ed_ZoneName: TEdit;
    Label1: TLabel;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure sg_AlarmZoneClick(Sender: TObject);
    procedure cmb_AlarmCodeChange(Sender: TObject);
    procedure btn_UpdateClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure cmb_sBuildingCodeChange(Sender: TObject);
    procedure cmb_sFloorCodeChange(Sender: TObject);
    procedure btnAlarmPositionClick(Sender: TObject);
  private
    State : string;
    ALARMIDList : TStringList;
    sBuildingCodeList : TStringList;
    sFloorCodeList : TStringList;
    sAreaCodeList : TStringList;
    { Private declarations }
    procedure GridInit;
    procedure AlarmDeviceLoad(cmb_Box:TComboBox;bState:Boolean);
    procedure LoadsBuildingCode(cmb_Box:TComboBox);
    procedure LoadsFloorCode(aBuildingCode:string;cmb_Box:TComboBox);
    procedure LoadsAreaCode(aBuildingCode,aFloorCode:string;cmb_Box:TComboBox);
    procedure AlarmZoneSearch(aAlarmNo,aSearchAlarmNo:string;aTop :integer = 0);
    procedure FormClear;
    procedure FormEnable(aState:string);
    procedure ButtonEnable(aState:string);
    Function  UpdateTB_ZoneDEVICE(aNodeNo,aEcuID,
                        aZoneNO,
                        aZoneName,
                        aWatchType,
                        aBuildingCode,
                        aFloorCode,
                        aAreaCode,
                        aLocationUse,
                        aTotX,
                        aTotY,
                        aX,
                        aY,
                        aZoneView:string):Boolean;
  public
    { Public declarations }
  end;

var
  fmAlarmZoneAdmin: TfmAlarmZoneAdmin;

implementation
uses
  uDataModule1,
  uLomosUtil,
  uPositionSet;

{$R *.dfm}

procedure TfmAlarmZoneAdmin.AlarmDeviceLoad(cmb_Box: TComboBox;bState:Boolean);
var
  stSql : string;
  stDeviceName : string;
begin
  ALARMIDList.Clear;
  cmb_Box.Clear;
  ALARMIDList.Add('');
  if bState then
    cmb_Box.Items.Add('전체')
  else cmb_Box.Items.add('');
  cmb_Box.ItemIndex := 0;

  stSql := 'select * from TB_ALARMDEVICE ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' order by AL_VIEWSEQ ';
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
      cmb_Box.Items.Add(FindField('AL_ZONENAME').AsString);
      ALARMIDList.Add(FillZeroNumber(FindField('AC_NODENO').asinteger,3) + FindField('AC_ECUID').AsString);
      Next;
    end;
  end;

end;

procedure TfmAlarmZoneAdmin.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmAlarmZoneAdmin.GridInit;
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

procedure TfmAlarmZoneAdmin.FormCreate(Sender: TObject);
begin
  ALARMIDList := TStringList.Create;
  sBuildingCodeList := TStringList.Create;
  sFloorCodeList := TStringList.Create;
  sAreaCodeList := TStringList.Create;
end;

procedure TfmAlarmZoneAdmin.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ALARMIDList.Free;
  sBuildingCodeList.Free;
  sFloorCodeList.Free;
  sAreaCodeList.Free;
end;

procedure TfmAlarmZoneAdmin.FormShow(Sender: TObject);
begin
  AlarmDeviceLoad(cmb_AlarmCode,True);
  AlarmDeviceLoad(cmb_regAlarmCode,False);
  LoadsBuildingCode(cmb_sBuildingCode);
  
  AlarmZoneSearch('','');
end;

procedure TfmAlarmZoneAdmin.AlarmZoneSearch(aAlarmNo,
  aSearchAlarmNo: string;aTop :integer = 0);
var
  stSql : string;
  nRow : integer;
  TempAdoQuery : TADOQuery;
begin
  State := 'SEARCH';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  GridInit; //스트링그리드 초기화

  stSql := 'select a.*,b.AL_ZONENAME as AlarmName from TB_ZONEDEVICE a ';
  stSql := stSql + ' Inner Join TB_ALARMDEVICE b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO  ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ) ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
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
          cells[3,nRow] := FindField('AL_WATCHTYPE').AsString;
          cells[4,nRow] := FindField('LO_DONGCODE').AsString;
          cells[5,nRow] := FindField('LO_FLOORCODE').AsString;
          cells[6,nRow] := FindField('LO_AREACODE').AsString;
          cells[7,nRow] := FindField('AL_LOCATEUSE').AsString;
          cells[8,nRow] := FindField('AL_TOTWIDTH').AsString;
          cells[9,nRow] := FindField('AL_TOTHEIGHT').AsString;
          cells[10,nRow] := FindField('AL_CURX').AsString;
          cells[11,nRow] := FindField('AL_CURY').AsString;
          cells[12,nRow] := FillZeroNumber(FindField('AC_NODENO').AsInteger,3) + FindField('AC_ECUID').AsString;
          cells[13,nRow] := FindField('AL_ZONEUSE').AsString;

          if cells[12,nRow] + FindField('AL_ZONENUM').AsString = aSearchAlarmNo then
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

procedure TfmAlarmZoneAdmin.ButtonEnable(aState: string);
begin
  if upperCase(aState) = 'INSERT'  then
  begin
    btn_update.Enabled := false;
    btn_Save.Enabled := True;
    btn_Cancel.Enabled := True;
  end else if upperCase(aState) = 'SEARCH' then
  begin
    btn_Update.Enabled := False;
    btn_Save.Enabled := False;
    btn_Cancel.Enabled := False;
  end else if upperCase(aState) = 'UPDATE' then
  begin
    btn_Update.Enabled := False;
    btn_Save.Enabled := True;
    btn_Cancel.Enabled := True;
  end else if upperCase(aState) = 'CLICK' then
  begin
    btn_Update.Enabled := True;
    btn_Save.Enabled := False;
    btn_Cancel.Enabled := False;
  end;
end;

procedure TfmAlarmZoneAdmin.FormClear;
begin
  cmb_regAlarmCode.ItemIndex := -1;
  ed_regZoneNO.Text := '';
  cmb_WatchType.ItemIndex := -1;
  ed_ZoneName.Text := '';
  chk_View.Checked := False;
  cmb_sBuildingCode.ItemIndex := 0;
  cmb_sFloorCode.Clear;
  cmb_sAreaCode.Clear;
  chk_AlarmReg.Checked := False;
  ed_TotWidth.Text := '0';
  ed_TotHeight.Text := '0';
  ed_CurX.Text := '0';
  ed_CurY.Text := '0';
end;

procedure TfmAlarmZoneAdmin.FormEnable(aState: string);
begin
  if upperCase(aState) = 'INSERT'  then
  begin
    //Alarm Form Enable
    sg_AlarmZone.Enabled := False;
    cmb_regAlarmCode.Enabled := True;
    ed_regZoneNO.Enabled := True;
    cmb_WatchType.Enabled := True;
    chk_View.Enabled := True;
    ed_ZoneName.Enabled := True;

    cmb_sBuildingCode.Enabled := True;
    cmb_sFloorCode.Enabled := True;
    cmb_sAreaCode.Enabled := True;
    chk_AlarmReg.Enabled := True;
    btnAlarmPosition.Enabled := True;
  end else if UpperCase(aState) = 'UPDATE' then
  begin
    //Alarm Form Enable
    sg_AlarmZone.Enabled := False;
    cmb_regAlarmCode.Enabled := False;
    ed_regZoneNO.Enabled := False;
    cmb_WatchType.Enabled := True;
    chk_View.Enabled := True;
    ed_ZoneName.Enabled := True;

    cmb_sBuildingCode.Enabled := True;
    cmb_sFloorCode.Enabled := True;
    cmb_sAreaCode.Enabled := True;
    chk_AlarmReg.Enabled := True;
    btnAlarmPosition.Enabled := True;
  end else if UpperCase(aState) = 'SEARCH' then
  begin
    //Alarm Form Enable
    sg_AlarmZone.Enabled := True;
    cmb_regAlarmCode.Enabled := False;
    ed_regZoneNO.Enabled := False;
    cmb_WatchType.Enabled := False;
    chk_View.Enabled := False;
    ed_ZoneName.Enabled := False;

    cmb_sBuildingCode.Enabled := False;
    cmb_sFloorCode.Enabled := False;
    cmb_sAreaCode.Enabled := False;
    chk_AlarmReg.Enabled := False;
    btnAlarmPosition.Enabled := False;
  end;
end;

procedure TfmAlarmZoneAdmin.sg_AlarmZoneClick(Sender: TObject);
var
  stAlarmNo : string;
  stBuildingCode,stFloorCode : string;
begin

  with (Sender as TStringGrid) do
  begin
    if cells[0,Row] = '' then exit;

    State := 'CLICK';
    FormClear;
    FormEnable(State);
    ButtonEnable(State);

    ed_AlarmNo.Text := cells[12,Row];
    cmb_regAlarmCode.ItemIndex := ALARMIDList.IndexOf(ed_AlarmNo.Text);

    ed_regZoneNO.Text  := cells[1,Row];
    ed_ZoneName.Text  := cells[2,Row];

    if Not IsDigit(cells[3,Row]) then cells[3,Row] := '0';
    cmb_WatchType.ItemIndex := strtoint(cells[3,Row]);

    if cells[13,Row] = 'Y' then chk_View.Checked := True
    else chk_View.Checked := False;

    if (cells[4,Row] = '') or (cells[4,Row] = '000') then cmb_sBuildingCode.ItemIndex := 0
    else cmb_sBuildingCode.ItemIndex := sBuildingCodeList.IndexOf(cells[4,Row]);
    stBuildingCode := sBuildingCodeList.Strings[ cmb_sBuildingCode.itemindex ];
    LoadsFloorCode(stBuildingCode,cmb_sFloorCode);
    if (cells[5,Row] = '') or (cells[5,Row] = '000') then cmb_sFloorCode.ItemIndex := 0
    else cmb_sFloorCode.ItemIndex := sFloorCodeList.IndexOf(cells[5,Row]);
    if cmb_sFloorCode.itemindex < 1 then stFloorCode := ''
    else stFloorCode := sFloorCodeList.Strings[ cmb_sFloorCode.itemindex ];
    LoadsAreaCode(stBuildingCode,stFloorCode,cmb_sAreaCode);
    if (cells[6,Row] = '') or (cells[6,Row] = '000') then cmb_sAreaCode.ItemIndex := 0
    else cmb_sAreaCode.ItemIndex := sAreaCodeList.IndexOf(cells[6,Row]);

    if cells[7,Row] = 'Y' then chk_AlarmReg.Checked := True
    else chk_AlarmReg.Checked := False;
    ed_TotWidth.Text := cells[8,Row];
    ed_TotHeight.Text := cells[9,Row];
    ed_CurX.Text := cells[10,Row];
    ed_CurY.Text := cells[11,Row];

  end;

end;

procedure TfmAlarmZoneAdmin.LoadsAreaCode(aBuildingCode,
  aFloorCode: string; cmb_Box: TComboBox);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  sAreaCodeList.Clear;

  cmb_Box.Items.Add('');
  sAreaCodeList.Add('');
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
        sAreaCodeList.Add(FindField('LO_AREACODE').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmAlarmZoneAdmin.LoadsBuildingCode(cmb_Box: TComboBox);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  sBuildingCodeList.Clear;

  stSql := 'select * from TB_LOCATION ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND LO_GUBUN = ''0'' ';
  stSql := stSql + ' order by LO_DONGCODE ';
  
  cmb_Box.Items.Add('');
  sBuildingCodeList.Add('000');
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
        sBuildingCodeList.Add(FindField('LO_DONGCODE').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmAlarmZoneAdmin.LoadsFloorCode(aBuildingCode: string;
  cmb_Box: TComboBox);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  sFloorCodeList.Clear;

  cmb_Box.Items.Add('');
  sFloorCodeList.Add('000');
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
        sFloorCodeList.Add(FindField('LO_FLOORCODE').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmAlarmZoneAdmin.cmb_AlarmCodeChange(Sender: TObject);
var
  stAlarmNo : string;
begin
  if cmb_AlarmCode.itemIndex = -1 then cmb_AlarmCode.itemIndex := 0;
  stAlarmNo := ALARMIDList.Strings[cmb_AlarmCode.itemIndex];
  AlarmZoneSearch(stAlarmNo,'');
end;

procedure TfmAlarmZoneAdmin.btn_UpdateClick(Sender: TObject);
begin
  State := 'UPDATE';
  FormEnable(State);
  ed_ZoneName.SetFocus;
  ButtonEnable(State);
end;

procedure TfmAlarmZoneAdmin.btn_CancelClick(Sender: TObject);
var
  stAlarmNo : string;
begin
  if cmb_AlarmCode.itemIndex = -1 then cmb_AlarmCode.itemIndex := 0;
  stAlarmNo := ALARMIDList.Strings[cmb_AlarmCode.itemIndex];
  AlarmZoneSearch(stAlarmNo,ed_AlarmNo.Text + ed_regZoneNO.Text,sg_AlarmZone.TopRow);
end;

procedure TfmAlarmZoneAdmin.btn_SaveClick(Sender: TObject);
var
  stAlarmNo : string;
  stBuildingCode,stFloorCode,stAreaCode : string;
  stLocationUse : string;
  stTotX,stTotY,stX,stY : string;
  stZoneView : string;
begin
  stAlarmNo := ed_AlarmNo.Text;

  stZoneView := 'N';
  if chk_View.Checked then stZoneView := 'Y';

  stBuildingCode := '000';
  if cmb_sBuildingCode.ItemIndex > 0 then stBuildingCode := sBuildingCodeList.Strings[cmb_sBuildingCode.ItemIndex];
  stFloorCode := '000';
  if cmb_sFloorCode.ItemIndex > 0 then stFloorCode := sFloorCodeList.Strings[cmb_sFloorCode.ItemIndex];
  stAreaCode := '000';
  if cmb_sAreaCode.ItemIndex > 0 then stAreaCode := sAreaCodeList.Strings[cmb_sAreaCode.ItemIndex];
  stLocationUse := 'N';
  if chk_AlarmReg.Checked then stLocationUse := 'Y';
  stTotX := '0';
  if IsDigit(ed_TotWidth.text) then stTotX := ed_TotWidth.text;
  stTotY := '0';
  if IsDigit(ed_TotHeight.text) then stTotY := ed_TotHeight.text;
  stX := '0';
  if IsDigit(ed_CurX.text) then stX := ed_CurX.text;
  stY := '0';
  if IsDigit(ed_CurY.text) then stY := ed_CurY.text;
  if UpperCase(State) = 'UPDATE' then
  begin
    UpdateTB_ZoneDEVICE(copy(stAlarmNo,1,3),copy(stAlarmNo,4,2),
                        ed_regZoneNO.Text,
                        ed_ZoneName.Text,
                        inttostr(cmb_WatchType.ItemIndex),
                        stBuildingCode,
                        stFloorCode,
                        stAreaCode,
                        stLocationUse,
                        stTotX,
                        stTotY,
                        stX,
                        stY,
                        stZoneView);
  end;

  if cmb_AlarmCode.itemIndex = -1 then cmb_AlarmCode.itemIndex := 0;
  stAlarmNo := ALARMIDList.Strings[cmb_AlarmCode.itemIndex];
  AlarmZoneSearch(stAlarmNo,ed_AlarmNo.Text + ed_regZoneNO.Text,sg_AlarmZone.TopRow);

end;

function TfmAlarmZoneAdmin.UpdateTB_ZoneDEVICE(aNodeNo,aEcuID, aZoneNO,aZoneName,
  aWatchType, aBuildingCode, aFloorCode, aAreaCode, aLocationUse, aTotX,
  aTotY, aX, aY,aZoneView: string): Boolean;
var
  stSql : string;
begin
  stSql := 'UPDATE TB_ZONEDEVICE set ';
  stSql := stSql + 'AL_ZONENAME = ''' + aZoneName + ''',';
  stSql := stSql + 'AL_LOCATEUSE = ''' + aLocationUse + ''',';
  stSql := stSql + 'AL_TOTWIDTH = ' + aTotX + ',';
  stSql := stSql + 'AL_TOTHEIGHT = ' + aTotY + ',';
  stSql := stSql + 'AL_CURX = ' + aX + ',';
  stSql := stSql + 'AL_CURY = ' + aY + ',';
  stSql := stSql + 'LO_DONGCODE = ''' + aBuildingCode + ''',';
  stSql := stSql + 'LO_FLOORCODE = ''' + aFloorCode + ''',';
  stSql := stSql + 'LO_AREACODE = ''' + aAreaCode + ''',';
  stSql := stSql + 'AL_WATCHTYPE = ''' + aWatchType + ''',';
  stSql := stSql + 'AL_ZONEUSE = ''' + aZoneView + ''',';
  stSql := stSql + 'SEND_ACK = ''N'', ';
  stSql := stSql + 'AL_UPDATE = ''Y'' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND AL_ZONENUM = ''' + aZoneNO + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmAlarmZoneAdmin.cmb_sBuildingCodeChange(Sender: TObject);
var
  stBuildingCode : string;
begin
  stBuildingCode := sBuildingCodeList.Strings[ cmb_sBuildingCode.itemindex ];
  LoadsFloorCode(stBuildingCode,cmb_sFloorCode);
  cmb_sAreaCode.Clear;

end;

procedure TfmAlarmZoneAdmin.cmb_sFloorCodeChange(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
begin
  stBuildingCode := sBuildingCodeList.Strings[ cmb_sBuildingCode.itemindex ];
  stFloorCode := sFloorCodeList.Strings[ cmb_sFloorCode.itemindex ];
  LoadsAreaCode(stBuildingCode,stFloorCode,cmb_sAreaCode);

end;

procedure TfmAlarmZoneAdmin.btnAlarmPositionClick(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
begin
  if cmb_sBuildingCode.itemIndex < 0 then
  begin
    stBuildingCode := '';
  end else
  begin
    stBuildingCode := sBuildingCodeList.Strings[cmb_sBuildingCode.itemIndex];
  end;
  if cmb_sFloorCode.itemIndex < 0 then
  begin
    stFloorCode := '';
  end else
  begin
    stFloorCode := sFloorCodeList.Strings[cmb_sFloorCode.itemIndex];
  end;
  if cmb_sAreaCode.itemIndex < 0 then
  begin
    stAreaCode := '';
  end else
  begin
    stAreaCode := sAreaCodeList.Strings[cmb_sAreaCode.itemIndex];
  end;

  fmPositionSet:= TfmPositionSet.Create(Self);
  fmPositionSet.FormName := 'fmAlarmZoneAdmin';
  fmPositionSet.DeviceType := '7';
  fmPositionSet.DeviceName := cmb_regAlarmCode.Text + ':' + ed_regZoneNO.Text;
  fmPositionSet.X_Position := ed_CurX.Text;
  fmPositionSet.Y_Position := ed_CurY.Text;
  fmPositionSet.X_Size := ed_TotWidth.Text;
  fmPositionSet.Y_Size := ed_TotHeight.Text;

  fmPositionSet.BuildingCode := stBuildingCode;
  fmPositionSet.FloorCode := stFloorCode;
  fmPositionSet.SectorCode := stAreaCode;
  
  fmPositionSet.SHowmodal;
  fmPositionSet.Free;
end;

end.
