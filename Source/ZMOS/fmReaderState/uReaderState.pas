unit uReaderState;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, uSubForm, CommandArray, StdCtrls, DB, ADODB, Buttons,
  Grids, BaseGrid, AdvGrid, ComCtrls,ActiveX, AdvObj;

type
  TfmReaderState = class(TfmASubForm)
    Panel12: TPanel;
    GroupBox1: TGroupBox;
    ADOQuery: TADOQuery;
    Label7: TLabel;
    cmb_BuildingCode: TComboBox;
    cmb_FloorCode: TComboBox;
    Label20: TLabel;
    Label22: TLabel;
    cmb_AreaCode: TComboBox;
    btn_Search: TBitBtn;
    btn_Close: TBitBtn;
    sg_Reader: TAdvStringGrid;
    Label1: TLabel;
    dt_FromDate: TDateTimePicker;
    Label2: TLabel;
    dt_ToDate: TDateTimePicker;
    Label3: TLabel;
    cmb_Device: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_CloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cmb_BuildingCodeChange(Sender: TObject);
    procedure cmb_FloorCodeChange(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure cmb_AreaCodeChange(Sender: TObject);
    procedure CommandArrayCommandsTCloseExecute(Command: TCommand;
      Params: TStringList);
  private
    BuildingCodeList : TStringList;
    FloorCodeList : TStringList;
    AreaCodeList : TStringList;
    DeviceIDList : TStringList;
    { Private declarations }
    procedure LoadBuildingCode(cmb_Box:TComboBox);
    procedure LoadFloorCode(aBuildingCode:string;cmb_Box:TComboBox);
    procedure LoadAreaCode(aBuildingCode,aFloorCode:string;cmb_Box:TComboBox);
    procedure LoadDeviceCode(aBuildingCode,aFloorCode,aAreaCode:string;cmb_Box:TComboBox);

    procedure showReaderHistory();
  public
    { Public declarations }
  end;

var
  fmReaderState: TfmReaderState;

implementation
uses
  uDataModule1,
  uLomosUtil;
{$R *.dfm}



procedure TfmReaderState.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  BuildingCodeList.Free;
  FloorCodeList.Free;
  AreaCodeList.Free;
  DeviceIDList.Free;

  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'ReaderState';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;

  Action := caFree;
end;

procedure TfmReaderState.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmReaderState.FormShow(Sender: TObject);
begin
  LoadBuildingCode(cmb_BuildingCode);
  LoadDeviceCode('','','',cmb_Device);

  dt_FromDate.Date := Now;
  dt_ToDate.Date := Now;

  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'ReaderState';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;
end;

procedure TfmReaderState.LoadBuildingCode(cmb_Box: TComboBox);
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  cmb_Box.Clear;
  BuildingCodeList.Clear;

  stSql := 'select * from TB_LOCATION ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND LO_GUBUN = ''0'' ';

  if G_nBuildingSearchIndex = 0 then
  begin
    stSql := stSql + ' Order by LO_DONGCODE ';
  end else
  begin
    stSql := stSql + ' Order by LO_NAME ';
  end;

  cmb_Box.Items.Add('전체');
  BuildingCodeList.Add('');
  cmb_Box.ItemIndex := 0;

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
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;

    if RecordCount < 1 then
    begin
      TempAdoQuery.Free;
      CoUninitialize;
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
  TempAdoQuery.Free;
  CoUninitialize;
end;

procedure TfmReaderState.FormCreate(Sender: TObject);
begin
  BuildingCodeList := TStringList.Create;
  FloorCodeList := TStringList.Create;
  AreaCodeList := TStringList.Create;
  DeviceIDList := TStringList.Create;
end;

procedure TfmReaderState.cmb_BuildingCodeChange(Sender: TObject);
var
  stBuildingCode,stFloorCode,stAreaCode:string;
begin
  stBuildingCode := '';
  stFloorCode := '';
  stAreaCode := '';
  if cmb_BuildingCode.ItemIndex > 0 then  stBuildingCode := BuildingCodeList.Strings[ cmb_BuildingCode.itemindex ];
  LoadFloorCode(stBuildingCode,cmb_FloorCode);
  if cmb_FloorCode.ItemIndex > 0 then stFloorCode := FloorCodeList.Strings[cmb_FloorCode.itemIndex];
  LoadAreaCode(stBuildingCode,stFloorCode,cmb_AreaCode);
  if cmb_AreaCode.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode.itemIndex];
  LoadDeviceCode(stBuildingCode,stFloorCode,stAreaCode,cmb_Device);
end;

procedure TfmReaderState.LoadAreaCode(aBuildingCode, aFloorCode: string;
  cmb_Box: TComboBox);
var
  stSql : string;
begin
  cmb_Box.Clear;
  AreaCodeList.Clear;

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

  if G_nBuildingSearchIndex = 0 then
  begin
    stSql := stSql + ' Order by LO_AREACODE ';
  end else
  begin
    stSql := stSql + ' Order by LO_NAME ';
  end;

  cmb_Box.Items.Add('전체');
  AreaCodeList.Add('');
  cmb_Box.ItemIndex := 0;

  with DataModule1.ADOTmpQuery do
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
      cmb_Box.Items.Add(FindField('LO_NAME').AsString );
      AreaCodeList.Add(FindField('LO_AREACODE').AsString);
      Next;
    end;
  end;
end;

procedure TfmReaderState.LoadFloorCode(aBuildingCode: string;
  cmb_Box: TComboBox);
var
  stSql : string;
begin
  cmb_Box.Clear;
  FloorCodeList.Clear;

  stSql := 'select * from TB_LOCATION ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND LO_GUBUN = ''1'' ';

  if (aBuildingCode <> '') And (aBuildingCode <> '000')  then
  begin
    stSql := stSql + ' AND LO_DONGCODE = ''' + aBuildingCode + '''';
  end else Exit;

  if G_nBuildingSearchIndex = 0 then
  begin
    stSql := stSql + ' Order by LO_FLOORCODE ';
  end else
  begin
    stSql := stSql + ' Order by LO_NAME ';
  end;

  cmb_Box.Items.Add('전체');
  FloorCodeList.Add('');
  cmb_Box.ItemIndex := 0;

  with DataModule1.ADOTmpQuery do
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
      cmb_Box.Items.Add(FindField('LO_NAME').AsString );
      FloorCodeList.Add(FindField('LO_FLOORCODE').AsString);
      Next;
    end;
  end;
end;

procedure TfmReaderState.cmb_FloorCodeChange(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
begin
  stBuildingCode := '';
  stFloorCode := '';
  stAreaCode := '';

  if cmb_BuildingCode.ItemIndex > 0 then  stBuildingCode := BuildingCodeList.Strings[ cmb_BuildingCode.itemindex ];
  if cmb_FloorCode.ItemIndex > 0 then stFloorCode := FloorCodeList.Strings[ cmb_FloorCode.itemindex ];
  LoadAreaCode(stBuildingCode,stFloorCode,cmb_AreaCode);
  if cmb_AreaCode.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode.itemIndex];
  LoadDeviceCode(stBuildingCode,stFloorCode,stAreaCode,cmb_Device);
end;

procedure TfmReaderState.btn_SearchClick(Sender: TObject);
begin
  showReaderHistory();

end;

procedure TfmReaderState.showReaderHistory;
var
  stSql : string;
  nRow : integer;
begin

  sg_Reader.ClearRows(1,sg_reader.RowCount - 1);
  sg_Reader.RowCount := 2;
  //GridInitialize(sg_Reader);

  stSql := 'select b.ac_devicename,';
  stSql := stSql + 'a.al_date,a.al_time,';
  stSql := stSql + 'a.ac_ecuid,a.al_alarmdevicetypecode,';
  stSql := stSql + 'a.al_subaddr,a.al_alarmstatuscode,c.al_alarmname ';
  stSql := stSql + ' from tb_alarmevent a ';
  stSql := stSql + ' Left Join tb_accessdevice b ';
  stSql := stSql + ' on (a.group_code = b.group_code ';
  stSql := stSql + ' and a.ac_nodeno = b.ac_nodeno ';
  stSql := stSql + ' and a.ac_ecuid = b.ac_ecuid) ';
  stSql := stSql + ' Left Join tb_alarmstatuscode c ';
  stSql := stSql + ' on (a.group_code = c.group_code ';
  stSql := stSql + ' and a.al_alarmstatuscode = c.al_alarmstatuscode )';
  stSql := stSql + ' where a.group_code = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' and a.al_date between ''' + formatdatetime('yyyymmdd',dt_FromDate.Date) + ''' ';
  stSql := stSql + ' and ''' + formatdatetime('yyyymmdd',dt_ToDate.Date) + ''' ';
  stSql := stSql + ' and a.al_alarmdevicetypecode = ''CD'' ';
  if cmb_BuildingCode.ItemIndex > 0 then stSql := stSql + ' and b.lo_dongcode = ''' + BuildingCodeList.Strings[ cmb_BuildingCode.itemindex ] + ''' ';
  if cmb_FloorCode.itemindex > 0 then stSql := stSql + ' and b.lo_floorcode = ''' + FloorCodeList.Strings[ cmb_FloorCode.itemindex ] + ''' ';
  if cmb_AreaCode.itemindex > 0 then stSql := stSql + ' and b.lo_floorcode = ''' + AreaCodeList.Strings[ cmb_AreaCode.itemindex ] + ''' ';
  if cmb_Device.ItemIndex > 0 then
  begin
    stSql := stSql + ' and a.ac_nodeno = ' + copy(DeviceIDList.Strings[cmb_Device.ItemIndex],1,3);
    stSql := stSql + ' and a.ac_ecuid = ''' + copy(DeviceIDList.Strings[cmb_Device.ItemIndex],4,2) + ''' ';
  end;
  stSql := stSql + ' order by a.al_date DESC,a.al_time DESC';

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
    nRow := 1;

    with sg_Reader do
    begin
      RowCount := recordCount + 1;
      while Not Eof do
      begin
        Cells[0,nRow] := FindField('al_date').AsString;
        Cells[1,nRow] := FindField('al_time').AsString;
        Cells[2,nRow] := FindField('ac_devicename').AsString;
        Cells[3,nRow] := FindField('ac_ecuid').AsString;
        Cells[4,nRow] := FindField('al_alarmdevicetypecode').AsString;
        Cells[5,nRow] := FindField('al_subaddr').AsString;
        Cells[6,nRow] := FindField('al_alarmstatuscode').AsString;
        Cells[7,nRow] := FindField('al_alarmname').AsString;
        if FindField('al_alarmstatuscode').AsString = 'NF' then
        begin
          RowColor[nRow] := clFuchsia;
        end;

        inc(nRow);
        Next;
      end;
    end;
  end;
  
end;

procedure TfmReaderState.LoadDeviceCode(aBuildingCode, aFloorCode,
  aAreaCode: string; cmb_Box: TComboBox);
var
  stSql : string;
begin
  cmb_Box.Clear;
  DeviceIDList.Clear;

  stSql := 'select * from TB_ACCESSDEVICE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';

  if (aBuildingCode <> '') And (aBuildingCode <> '000')  then
  begin
    stSql := stSql + ' AND LO_DONGCODE = ''' + aBuildingCode + '''';
  end;

  if (aFloorCode <> '') And (aFloorCode <> '000')  then
  begin
    stSql := stSql + ' AND LO_FLOORCODE = ''' + aFloorCode + '''';
  end;

  if (aAreaCode <> '') And (aAreaCode <> '000')  then
  begin
    stSql := stSql + ' AND LO_AREACODE = ''' + aFloorCode + '''';
  end;

  stSql := stSql + 'order by ac_nodeno,ac_ecuid ';

  cmb_Box.Items.Add('전체');
  DeviceIDList.Add('');
  cmb_Box.ItemIndex := 0;

  with DataModule1.ADOTmpQuery do
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
      cmb_Box.Items.Add(FindField('AC_DEVICENAME').AsString );
      DeviceIDList.Add(FillzeroNumber(FindField('AC_NODENO').asinteger,3) + FindField('AC_ECUID').AsString);
      Next;
    end;
  end;
end;

procedure TfmReaderState.cmb_AreaCodeChange(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
begin
  stBuildingCode := '';
  stFloorCode := '';
  stAreaCode := '';
  if cmb_BuildingCode.itemindex > 0 then
    stBuildingCode := BuildingCodeList.Strings[ cmb_BuildingCode.itemindex ];
  if cmb_FloorCode.itemindex > 0 then
    stFloorCode := FloorCodeList.Strings[ cmb_FloorCode.itemindex ];
  if cmb_AreaCode.itemindex > 0 then
    stAreaCode := AreaCodeList.Strings[cmb_AreaCode.itemIndex];
  LoadDeviceCode(stBuildingCode,stFloorCode,stAreaCode,cmb_Device);
end;

procedure TfmReaderState.CommandArrayCommandsTCloseExecute(
  Command: TCommand; Params: TStringList);
begin
  inherited;
  Close;
end;

initialization
  RegisterClass(TfmReaderState);
Finalization
  UnRegisterClass(TfmReaderState);


end.
