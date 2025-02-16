unit uDeviceGradeSearch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Grids, BaseGrid, AdvGrid, FR_Class, FR_DSet,
  FR_DBSet, DB, ADODB, uSubForm, CommandArray, AdvObj;

type
  TfmDeviceGradeSearch = class(TfmASubForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    cmb_Type: TComboBox;
    cmb_DeviceName: TComboBox;
    Label3: TLabel;
    cmb_DeviceSend: TComboBox;
    btn_Search: TSpeedButton;
    btn_FileSave: TSpeedButton;
    btn_Print: TSpeedButton;
    btn_Close: TSpeedButton;
    GroupBox2: TGroupBox;
    sg_DeviceAdmin: TAdvStringGrid;
    frDBDataSet1: TfrDBDataSet;
    frReport1: TfrReport;
    qry_Device: TADOQuery;
    SaveDialog1: TSaveDialog;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmb_TypeChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure btn_FileSaveClick(Sender: TObject);
    procedure btn_PrintClick(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure btn_CloseClick(Sender: TObject);
    procedure CommandArrayCommandsTCommand0Execute(Command: TCommand;
      Params: TStringList);
    procedure FormShow(Sender: TObject);
    procedure CommandArrayCommandsTCloseExecute(Command: TCommand;
      Params: TStringList);
  private
    { Private declarations }
    DeviceCodeList : TStringList;
    procedure LoadDevice(Index:integer;cmb_Box:TComboBox);
    Function GetDeviceInfo(aGubun:integer;var aNodeNo,aECUID,aDoorNo:string):Boolean;
  public
    { Public declarations }
  end;

var
  fmDeviceGradeSearch: TfmDeviceGradeSearch;

implementation

uses
  uDataModule1,
  uLomosUtil;
{$R *.dfm}




procedure TfmDeviceGradeSearch.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'DeviceGradeSearch';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;

  DeviceCodeList.Free;
  Action := caFree;

end;

procedure TfmDeviceGradeSearch.cmb_TypeChange(Sender: TObject);
begin
  LoadDevice(cmb_Type.ItemIndex,cmb_DeviceName);
end;

procedure TfmDeviceGradeSearch.LoadDevice(Index: integer;
  cmb_Box: TComboBox);
var
  stSql : string;
begin
  //
  Cmb_Box.Clear;
  DeviceCodeList.Clear;
  if Index = 0 then       //출입
  begin
    stSql := 'Select a.DO_DOORNONAME as Name,a.AC_NODENO ,a.AC_ECUID + a.DO_DOORNO as DeviceID from ';
    stSql := stSql + ' TB_DOOR a ';
    if Not IsMaster then
    begin
      if BuildingGrade = 4 then
      begin
        stSql := stSql + ' Inner Join TB_ADMINDOOR b ';
        stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
        stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
        stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ';
        stSql := stSql + ' AND a.DO_DOORNO = b.DO_DOORNO ) ';
      end;
    end;
  end else if Index = 1 then  //방범
  begin
    stSql := 'Select a.AR_NAME as Name,a.AC_NODENO ,a.AC_ECUID + a.AR_AREANO as DeviceID from ';
    stSql := stSql + ' (select * from TB_ARMAREA where AR_USE = ''Y'') a ';
    if Not IsMaster then
    begin
      if BuildingGrade = 4 then
      begin
        stSql := stSql + ' Inner Join TB_ADMINALARMAREA b ';
        stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
        stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
        stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ';
        stSql := stSql + ' AND a.AR_AREANO = b.AR_AREANO) ';
      end;
    end;
  end else if Index = 2 then   //식수
  begin
    stSql := 'Select a.FO_NAME as Name,a.AC_NODENO ,a.AC_ECUID + a.FO_DOORNO as DeviceID from ';
    stSql := stSql + ' TB_FOOD a ';
    if Not IsMaster then
    begin
      if BuildingGrade = 4 then
      begin
        stSql := stSql + ' Inner Join TB_ADMINFOOD b ';
        stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
        stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
        stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ';
        stSql := stSql + ' AND a.FO_DOORNO = b.FO_DOORNO ) ';
      end;
    end;
  end;
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  if Not IsMaster then
  begin
    if BuildingGrade = 1 then
    begin
      stSql := stSql + ' AND a.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
    end else if BuildingGrade = 2 then
    begin
      stSql := stSql + ' AND a.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
      stSql := stSql + ' AND a.LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
    end else if BuildingGrade = 3 then
    begin
      stSql := stSql + ' AND a.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
      stSql := stSql + ' AND a.LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
      stSql := stSql + ' AND a.LO_AREACODE = ''' + MasterAreaCode + ''' ';
    end else if BuildingGrade = 4 then stSql := stSql + ' AND b.AD_USERID = ''' + Master_ID + ''' ';
  end;

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
      Cmb_Box.Items.Add(FindField('Name').AsString);
      DeviceCodeList.Add(FillZeroNumber(FindField('AC_NODENO').asInteger,3) + FindField('DeviceID').AsString);
      Next;
    end;
  end;
  Cmb_Box.ItemIndex := 0;

end;

procedure TfmDeviceGradeSearch.FormCreate(Sender: TObject);
begin
  DeviceCodeList := TStringList.Create;
end;

procedure TfmDeviceGradeSearch.FormActivate(Sender: TObject);
begin
  LoadDevice(0,cmb_DeviceName);
end;

procedure TfmDeviceGradeSearch.btn_SearchClick(Sender: TObject);
var
  i : integer;
  stSql : string;
  stNodeNo,stECUID : string;
  stDoorNo : string;
  bResult : boolean;
  nRow : Integer;
begin
  GridInitialize(sg_DeviceAdmin);

  bResult := GetDeviceInfo(cmb_Type.ItemIndex,stNodeNo,stECUID,stDoorNo);
  if Not bResult then
  begin
    showmessage('기기명칭이 선택되어 있지 않습니다.');
    Exit;
  end;

  stSql := 'select ';
  if cmb_Type.ItemIndex = 0 then
    stSql := stSql + ' a.DO_DOORNONAME as DEVICENAME,''출입'' as TYPE, '
  else if cmb_Type.ItemIndex = 1 then
    stSql := stSql + ' a.AR_NAME as DEVICENAME,''방범'' as TYPE, '
  else if cmb_Type.ItemIndex = 2 then
    stSql := stSql + ' a.FO_NAME as DEVICENAME,''식수'' as TYPE ,';
  stSql := stSql + ' c.CO_COMPANYCODE,c.CO_COMPANYNAME,';
  stSql := stSql + ' c.CO_DEPARTCODE,c.CO_DEPARTNAME,c.PO_POSICODE,c.PO_NAME,';
  stSql := stSql + ' c.EM_CODE,c.EM_NAME,b.DE_DOOR1,b.DE_DOOR2,b.DE_PERMIT,';
  stSql := stSql + ' CASE ';
  stSql := stSql + ' WHEN b.DE_RCVACK = ''Y'' THEN ''전송'' ';
  stSql := stSql + ' ELSE ''미전송'' END AS DE_RCVACK, ';
  stSql := stSql + ' b.DE_USEACCESS,b.DE_USEALARM ';
  stSql := stSql + ' from TB_DEVICECARDNO b ';
  if cmb_Type.ItemIndex = 0 then
    stSql := stSql + ' Inner Join TB_DOOR a  '
  else if cmb_Type.ItemIndex = 1 then
    stSql := stSql + ' Inner Join (select * from TB_ARMAREA where AR_USE = ''Y'' )  a  '
  else if cmb_Type.ItemIndex = 2 then
    stSql := stSql + ' Inner Join TB_FOOD a  ';
  stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ) ';
  stSql := stSql + ' Inner JOIN ';
  stSql := stSql + ' (select a.GROUP_CODE, ';
  stSql := stSql + '         a.CA_CARDNO, ';
  stSql := stSql + '         b.EM_CODE,  ';
  stSql := stSql + '         b.EM_NAME,  ';
  stSql := stSql + '         b.CO_COMPANYCODE, ';
  stSql := stSql + '         c.CO_NAME as CO_COMPANYNAME, ';
  stSql := stSql + '         b.CO_DEPARTCODE, ';
  stSql := stSql + '         d.CO_NAME as CO_DEPARTNAME, ';
  stSql := stSql + '         b.PO_POSICODE,';
  stSql := stSql + '         e.PO_NAME ';
  stSql := stSql + ' from TB_CARD a  ';
  stSql := stSql + ' Inner Join TB_EMPLOYEE b ';
  stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE  ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.EM_CODE = b.EM_CODE) ';
  stSql := stSql + ' Left Join TB_COMPANY c ';
  stSql := stSql + ' On (b.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND b.CO_COMPANYCODE = c.CO_COMPANYCODE ';
  stSql := stSql + ' AND c.CO_GUBUN = ''1'')  ';
  stSql := stSql + ' Left Join TB_COMPANY d  ';
  stSql := stSql + ' ON (b.GROUP_CODE = d.GROUP_CODE ';
  stSql := stSql + ' AND b.CO_COMPANYCODE = d.CO_COMPANYCODE ';
  stSql := stSql + ' AND c.CO_DEPARTCODE = d.CO_DEPARTCODE ';
  stSql := stSql + ' AND c.CO_GUBUN = ''2'') ';
  stSql := stSql + ' Left Join TB_POSI e ';
  stSql := stSql + ' ON (b.GROUP_CODE = e.GROUP_CODE ';
  stSql := stSql + ' AND b.PO_POSICODE = e.PO_POSICODE ) ';
  stSql := stSql + ' ) c ';
  stSql := stSql + ' ON ( b.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND b.CA_CARDNO = c.CA_CARDNO ) ';
  stSql := stSql + ' WHERE b.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND b.AC_NODENO = ' + inttostr(strtoint(stNodeNo)) ;
  stSql := stSql + ' AND b.AC_ECUID = ''' + stECUID + ''' ';
  if cmb_DeviceSend.ItemIndex = 1 then
    stSql := stSql + ' AND b.DE_RCVACK = ''Y'' '
  else if cmb_DeviceSend.ItemIndex = 2 then
    stSql := stSql + ' AND b.DE_RCVACK = ''N'' ';

  if (cmb_Type.ItemIndex = 0) or (cmb_Type.ItemIndex = 2)  then   //출입 식수 권한 조회
  begin
    stSql := stSql + ' AND b.DE_DOOR' + stDoorNo + ' = ''Y'' ' ;
    if cmb_Type.ItemIndex = 0 then
      stSql := stSql + ' AND a.DO_DOORNO = ''' + stDoorNo + ''' '
    else stSql := stSql + ' AND a.FO_DOORNO = ''' + stDoorNo + ''' ';
    stSql := stSql + ' AND b.DE_USEACCESS = ''Y'' ';
  end else if (cmb_Type.ItemIndex = 1) then
  begin
//    stSql := stSql + ' AND b.DE_USEALARM = ''Y'' ';
    stSql := stSql + ' AND b.DE_ALARM' + stDoorNo + ' = ''Y'' ';
    stSql := stSql + ' AND a.AR_AREANO = ''' + FillzeroStrNum(stDoorNo,2) + ''' '
  end else Exit;

  With qry_Device do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    //memo1.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if RecordCount < 1 then Exit;
    First;
    nRow := 1;
    sg_DeviceAdmin.RowCount := RecordCount + 1;
    While Not Eof do
    begin
      with sg_DeviceAdmin  do
      begin
        cells[0,nRow] := FindField('DEVICENAME').AsString;
        cells[1,nRow] := FindField('CO_COMPANYNAME').AsString;
        cells[2,nRow] := FindField('CO_DEPARTNAME').AsString;
        cells[3,nRow] := FindField('PO_NAME').AsString;
        cells[4,nRow] := FindField('EM_CODE').AsString;
        cells[5,nRow] := FindField('EM_NAME').AsString;
        cells[6,nRow] := FindField('TYPE').AsString;
        cells[7,nRow] := FindField('DE_RCVACK').AsString;

      end;
      nRow := nRow + 1;
      Next;
    end;
  end;

end;

function TfmDeviceGradeSearch.GetDeviceInfo(aGubun: integer; var aNodeNo,
  aECUID, aDoorNo: string): Boolean;
var
  stDeviceID : string;
begin
  Result := False;
  if cmb_DeviceName.ItemIndex < 0 then Exit;
  stDeviceID := DeviceCodeList.Strings[cmb_DeviceName.itemIndex];
  aNodeNo := copy(stDeviceID,1,3);
  aECUID := copy(stDeviceID,4,2);
  aDoorNo := '';
  if (aGubun = 0) or (aGubun = 1) or (aGubun = 2) then //출입 또는 식수
  begin
    aDoorNo := copy(stDeviceID,6,1);
  end;
  Result := True;
end;

procedure TfmDeviceGradeSearch.btn_FileSaveClick(Sender: TObject);
var
  aFileName: String;
  sDate: String;
  eDate: String;
begin
  Screen.Cursor:= crHourGlass;
  aFileName:='기기별 권한조회 보고서';
  SaveDialog1.DefaultExt:= 'CSV';
  SaveDialog1.Filter := 'Text files (*.CSV)|*.CSV';
  SaveDialog1.FileName := aFileName;
  if SaveDialog1.Execute then
  begin
    sg_DeviceAdmin.SaveToCSV(SaveDialog1.FileName);
  end;
  Screen.Cursor:= crDefault;
end;

procedure TfmDeviceGradeSearch.btn_PrintClick(Sender: TObject);
begin
  frReport1.ShowReport;
end;

procedure TfmDeviceGradeSearch.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
 if AnsiCompareText(ParName, 'aDAY') = 0 then
    ParValue := '기기명칭:'+ cmb_DeviceName.text;
 if AnsiCompareText(ParName, 'SUBTITLE') = 0 then
    ParValue :=  cmb_Type.text;

end;

procedure TfmDeviceGradeSearch.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmDeviceGradeSearch.CommandArrayCommandsTCommand0Execute(
  Command: TCommand; Params: TStringList);
begin
//권한부여
end;

procedure TfmDeviceGradeSearch.FormShow(Sender: TObject);
begin
  inherited;
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'DeviceGradeSearch';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;

end;

procedure TfmDeviceGradeSearch.CommandArrayCommandsTCloseExecute(
  Command: TCommand; Params: TStringList);
begin
  inherited;
  Close;
end;

initialization
  RegisterClass(TfmDeviceGradeSearch);
Finalization
  UnRegisterClass(TfmDeviceGradeSearch);

end.
