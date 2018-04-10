unit uFoodPermit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Menus, StdCtrls, RzLstBox, RzChkLst, Grids, DBGrids,
  RzDBGrid, RzSplit, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDCustomPanelFill, LMDPanelFill, RzButton,
  RzCmboBx, Mask, RzEdit, RzPanel, RzStatus, ExtCtrls, CommandArray;

type
  TfmFoodPermit = class(TForm)
    CommandArray: TCommandArray;
    RzStatusBar1: TRzStatusBar;
    RzStatusPane1: TRzStatusPane;
    RzStatusPane2: TRzStatusPane;
    RzPanel5: TRzPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edSabun: TRzEdit;
    edName: TRzEdit;
    cb_Class: TRzComboBox;
    cbDepart: TRzComboBox;
    btnSearch: TRzBitBtn;
    LMDPanelFill2: TLMDPanelFill;
    btnClose: TRzBitBtn;
    RzPanel3: TRzPanel;
    Splitter1: TRzSplitter;
    LMDPanelFill1: TLMDPanelFill;
    DBGrid1: TRzDBGrid;
    LMDPanelFill3: TLMDPanelFill;
    clDoor: TRzCheckList;
    RzPanel4: TRzPanel;
    btnDeletePermit: TRzBitBtn;
    btnRegPermit: TRzBitBtn;
    btnSelectAll: TRzBitBtn;
    dsQuery_ID: TDataSource;
    dsQuery_DeviceCard: TDataSource;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    Query_DeviceCard: TADOQuery;
    qryQueryID: TADOQuery;
    qryQueryIDCARD_NO: TStringField;
    qryQueryIDCO_CODE: TStringField;
    qryQueryIDCO_NAME: TStringField;
    qryQueryIDLOCAL_CODE: TStringField;
    qryQueryIDLOCAL_NAME: TStringField;
    qryQueryIDDEPART_CODE: TStringField;
    qryQueryIDDEPART_NAME: TStringField;
    qryQueryIDPOSI_CODE: TStringField;
    qryQueryIDPOSI_NAME: TStringField;
    qryQueryIDID_NO: TStringField;
    qryQueryIDUSER_NAME: TStringField;
    qryQueryIDISMASTER: TStringField;
    qryQueryIDAGROUP_CODE: TStringField;
    qryQueryIDTP_CODE: TStringField;
    qryQueryIDUSE_EXP: TStringField;
    qryQueryIDS_DATE: TDateTimeField;
    qryQueryIDE_DATE: TDateTimeField;
    qryQueryIDUSE_ATTEND: TStringField;
    qryQueryIDATTEND_GROUP: TStringField;
    qryQueryIDUSE_FOOD: TStringField;
    qryQueryIDUSE_TYPE: TStringField;
    qryQueryIDCARD_TYPE: TStringField;
    qryQueryIDCARD_STATE: TStringField;
    qryQueryIDUP_DATE: TDateTimeField;
    qryQueryIDOPERATOR: TStringField;
    qryQueryIDENTERCOMPANY: TStringField;
    qryQueryIDLEAVECOMPANY: TStringField;
    qryQueryIDJUMINNO: TStringField;
    qryQueryIDDORMITORY: TStringField;
    qryQueryIDREG_DAY: TDateTimeField;
    edCardNo: TRzEdit;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSearchClick(Sender: TObject);
    procedure btnSelectAllClick(Sender: TObject);
    procedure btnRegPermitClick(Sender: TObject);
    procedure clDoorChange(Sender: TObject; Index: Integer;
      NewState: TCheckBoxState);
    procedure btnDeletePermitClick(Sender: TObject);
  private
    { Private declarations }
    AppendCount: Integer;
    duplicateCount: Integer;
    FailCount: Integer;
    CancelCount: Integer;
    DoorList: TStringList;
    CurCheckedList: TStringList;  //현재 체크되어 있는 리스트
    ClassCodeList: TStringList;
    procedure Load_comboData;
    Procedure LoadDoorInfo(aDoor:String);
    function  CheckQuerySearchData: String;
    Procedure ExecQuery_ID(SearchItem:String);
    Procedure RegCardPermit(aCardNo:String;aPermitCode:Char);
    Function AppendDB(aCardNo:String;aDeviceID:String;aDoorNo:Char;aPermitCode:Char):Boolean;
    procedure DbGrid1SelectAll;

  public
    { Public declarations }
  end;

var
  fmFoodPermit: TfmFoodPermit;

implementation

uses
uDataModule1,
uMSDEsql;
{$R *.dfm}

procedure TfmFoodPermit.FormShow(Sender: TObject);
begin
  ClassCodeList := TStringList.Create;
  ClassCodeList.Clear;
  CurCheckedList:= TStringList.Create;
  CurCheckedList.Clear;
  Splitter1.Percent:= 70;
  DoorList:= TStringList.Create;

  Screen.Cursor:= crHourGlass;
  Load_comboData;
  LoadDoorInfo('');
  btnSearchClick(Self);
  Screen.Cursor:= crDefault;

end;

procedure TfmFoodPermit.LoadDoorInfo(aDoor: String);
var
  st: string;
  Floor: String;
begin

  Screen.Cursor:= crHourGlass;
  DoorList.Clear;
  clDoor.Clear;
  clDoor.Items.Add('0.전체');
  DoorList.Add('0.전체');
  Try
    with Datamodule1.GetObject.ADOTmpQuery  do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT DOOR_CODE,DEVICE_ID,DOOR_NO,DOOR_NAME,DOOR_FLOOR');
      SQL.Add('FROM TB_DOOR');
      SQL.Add('Where DOOR_TYPE = ''6'' ');

      if aDoor <> '' then
      begin
        SQL.Add('AND DOOR_FLOOR = :DOOR_FLOOR');
        parameters.ParambyName('DOOR_FLOOR').value:= aDoor;
      end;
      SQL.Add('ORDER BY DOOR_CODE');
      OPen;

      First;

      while not eof do
      begin
        st:= FindField('DOOR_CODE').asString +'-'+
             FindField('DOOR_NAME').asString;
        clDoor.Items.Add(st);
        DoorList.Add(FindField('DEVICE_ID').asString + FindField('DOOR_NO').asString);
        Next;
      end;
    end;
  Except
    //
  End;
  Screen.Cursor:= crDefault;
end;

procedure TfmFoodPermit.Load_comboData;
var
  Str: String;
  stSql : string;
  bOpen : Boolean;
begin

  stSql := SelectTB_CLASSAll;
  //학급명 로드
  with DataModule1.GetObject.ADOTmpQuery do
  begin
    CB_Class.Clear;
    CB_Class.Items.Add('');
    ClassCodeList.Add('');
    Close;
    SQL.Clear;
    SQL.Text := stSql;

    Try
      Open;
    Except
      Exit;
    End;

    First;
    while not eof do
    begin
      Str:=  Trim(FindField('CLASS_NAME').asString);
      CB_Class.Items.Add(Str);
      ClassCodeList.Add(Trim(FindField('CLASS_CODE').asString));
      next;
    end;
  end;
  CB_Class.ItemIndex:= 0;

  //부서명 로드
  stSql := SelectTB_DEPARTAll;
  with Datamodule1.GetObject.ADOTmpQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Text := stSql;
    bOpen := True;
    Try
      Open;
    Except
      bOpen := False;
    End;
    if bOpen then
    begin
      cbDepart.Clear;
      cbDepart.Items.Add(' ');
      First;
      while not eof do
      begin
        Str:= FindField('DEPART_CODE').asString + '.'+
              FindField('DEPART_NAME1').asString;
        cbDepart.Items.Add(str);
        next;
      end;
    end;
  end;
  cbDepart.ItemIndex:= 0;

end;


procedure TfmFoodPermit.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmFoodPermit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ClassCodeList.Free;
  CurCheckedList.Free;
  Action := caFree;
end;

procedure TfmFoodPermit.btnSearchClick(Sender: TObject);
var
  SearchItem: string;
begin
  SearchItem:= CheckQuerySearchData;
  ExecQuery_ID(SearchItem);

end;

function TfmFoodPermit.CheckQuerySearchData: String;
var
  st: string;
begin
  Result:= '';
  // 카드번호 NOT NULL CHECK
  if (edCardNo.Text <> '') then
  begin
    if (Result <> '') then Result := Result + ' AND ';
    Result := Result + 'CARD_NO LIKE ' + '''' + edCardNo.Text + '%''';
  end;
  //출입자명
  if (edName.Text <> '') then
  begin
    if (Result <> '') then Result := Result + ' AND ';
    Result := Result + 'USER_NAME LIKE ' + '''' + edName.Text + '%''';
  end;
  // 학급코드
  if (CB_Class.Text <> '') then
  begin
    st:=ClassCodeList.Strings[CB_Class.IndexOf(CB_Class.Text)];
    if (Result <> '') then Result := Result + ' AND ';
    Result := Result + 'CO_CODE LIKE ' + '''' + st + '%''';
  end;

  //부서

  if (cbDepart.ItemIndex > 0) then
  begin
    st:= Copy(cbDepart.Text,1,3);
    if (Result <> '') then Result := Result + ' AND ';
    Result := Result + 'DEPART_CODE LIKE ' + '''' + st + '%''';
  end;

  //사번

  if (edSabun.Text <> '') then
  begin
    if (Result <> '') then Result := Result + ' AND ';
    Result := Result + 'ID_NO LIKE ' + '''' + edSabun.Text + '%''';
  end;

end;

procedure TfmFoodPermit.ExecQuery_ID(SearchItem: String);
var
  stSql : string;
begin
  try
    stSql := SelectTB_CARDAll;
    if (SearchItem <> '') then stSql := stSql + ' WHERE ' + SearchItem;
    stSql := stSql + ' ORDER BY CO_CODE, DEPART_CODE, ID_NO ';
    with qryQueryID do
    begin
      Close;
      SQL.Clear;
      SQL.Text := stSql;
      Open;
    end;
  except
    // DATABASE ERROR
    on E : EDatabaseError do
    begin
      // ERROR MESSAGE-BOX DISPLAY
      Application.MessageBox (PChar('자료조회가 실패했습니다!' + #13 +
                                    '(' + E.Message + ')'),
                              PChar(Caption),MB_ICONSTOP or MB_OK);
      Exit;
    end
    else begin
        // ERROR MESSAGE-BOX DISPLAY
        Application.MessageBox (PChar('자료조회가 실패했습니다!'),
                                PChar(Caption),MB_ICONSTOP or MB_OK);
        Exit;
    end;
  end;
  // DBGRID FOCUS 설정
  DBGrid1.SetFocus;
end;

procedure TfmFoodPermit.btnSelectAllClick(Sender: TObject);
begin
  DbGrid1SelectAll;
end;

procedure TfmFoodPermit.btnRegPermitClick(Sender: TObject);
var
  I: Integer;
  CardNo: String;
  aCardState: String;
begin
  Screen.Cursor:= crHourGlass;
  AppendCount:=0;
  duplicateCount:=0;
  FailCount:=0;
  CancelCount:= 0;

  if clDoor.ItemsChecked <= 0 then
  begin
    ShowMessage('선택된 출입문이 없습니다.');
    Exit;
  end;

  
  for I:= 0 to DBGrid1.SelectedRows.Count -1 do
  begin

    DBGrid1.DataSource.Dataset.Gotobookmark(pointer(DBGrid1.SelectedRows.Items[i]));
    CardNo:= DBGrid1.DataSource.Dataset.FindField('CARD_NO').asString;
    aCardState:= DBGrid1.DataSource.Dataset.FindField('CARD_STATE').asString;
    if aCardState = '1' then RegCardPermit(CardNo,'Y')
    else                     Inc(CancelCount);

  end;
  Screen.Cursor:= crDefault;
  SHowMessage('신규등록데이터:'+InttoStr(AppendCount)+#13+
              '수정등록데이터:'+InttoStr(duplicateCount)+#13+
              '등록실패데이터:'+InttoStr(FailCount)+#13+
              '등록불가데이터:'+InttoStr(CancelCount));
end;

procedure TfmFoodPermit.RegCardPermit(aCardNo: String; aPermitCode: Char);
var
  I: Integer;
  st: string;
  DeviceID: string[9];
  DoorNo: Char;
begin
  for I:= 1 to clDoor.Items.Count -1 do
  begin
    if clDoor.ItemChecked[I] then
    begin
      st:= DoorList[I];
      DeviceID:= Copy(st,1,9);
      DoorNo:= st[10];
      AppendDB(aCardNo,DeviceID,DoorNo,aPermitCode);
    end;
  end;
end;

function TfmFoodPermit.AppendDB(aCardNo, aDeviceID: String; aDoorNo,
  aPermitCode: Char): Boolean;
var
  ChkPermit : Char;
  stSql : string;
begin
  Result:= False;

  ChkPermit := 'L';

  if Datamodule1.GetObject.DupCheckTB_DEVICE_CARDNO(aCardNo,aDeviceID) then
  begin
    if aDoorNo = '1' then stSql := UpdateDoor1TB_DEVICE_CARDNO
    else if aDoorNo = '2' then stSql := UpdateDoor2TB_DEVICE_CARDNO;

    with Datamodule1.GetObject.ADOExecQuery   do
    begin
      Close;
      SQL.Clear;
      SQL.Text := stSql;
      parameters.ParamByName('DOOR').Value := aPermitCode;
      parameters.ParamByName('USE_ACCESS').Value := 'Y';
      parameters.ParamByName('PERMIT').Value := UpperCase(ChkPermit);
      parameters.ParamByName('RCV_ACK').Value := 'N';
      parameters.ParamByName('CARD_NO').Value := aCardNo;
      parameters.ParamByName('DEVICE_ID').Value := aDeviceID;

      Try
        ExecSQL;
        Inc(duplicateCount);
        Result:= True;
      Except
        Inc(FailCount);
        Exit;
      End;
      Result := True;
    end;
  end else
  begin
    if aDoorNo = '1' then stSql := InsertDoor1TB_DEVICE_CARDNO
    else if aDoorNo = '2' then stSql := InsertDoor2TB_DEVICE_CARDNO;
    with Datamodule1.GetObject.ADOExecQuery   do
    begin
      Close;
      SQL.Clear;
      SQL.Text := stSql;               //,,,,,,,

      parameters.ParamByName('CARD_NO').Value := aCardNo;
      parameters.ParamByName('DEVICE_ID').Value := aDeviceID;
      parameters.ParamByName('DOOR').Value := aPermitCode;
      parameters.ParamByName('USE_ACCESS').Value := 'Y';
      parameters.ParamByName('USE_ALARM').Value := '';
      parameters.ParamByName('TIMECODE').Value := '';
      parameters.ParamByName('PERMIT').Value := UpperCase(ChkPermit);
      parameters.ParamByName('RCV_ACK').Value := 'N';

      Try
        ExecSQL;
        Inc(AppendCount);
        Result:= True;
      Except
        Inc(FailCount);
        Exit;
      End;
      Result := True;
    end;
  end;

end;

procedure TfmFoodPermit.DbGrid1SelectAll;
var
 SaveBookmark: TBookmark;
begin
 with DBGrid1.DataSource.DataSet do
 begin
   if IsEmpty then Exit;
   DisableControls;
   SaveBookmark := GetBookmark;
   try
     First;
     while not Eof do
     begin
       DBGrid1.SelectedRows.CurrentRowSelected := True;
       Next;
     end;
     GotoBookmark(SaveBookmark);
   finally
     FreeBookmark(SaveBookmark);
     EnableControls;
   end;
 end;
end;

procedure TfmFoodPermit.clDoorChange(Sender: TObject; Index: Integer;
  NewState: TCheckBoxState);
var
  aIndex: Integer;
  Loop : Integer;
begin
  //0.전체를 선택하면 cbUnchecked, cbChecked
  if Index = 0  then
  begin
    if NewState = cbUnChecked then
    begin
      TRzCheckList(Sender).UncheckAll;
    end
    else if NewState = cbChecked then
    begin
      TRzCheckList(Sender).checkAll;
    end;
  end;

end;

procedure TfmFoodPermit.btnDeletePermitClick(Sender: TObject);
var
  I: Integer;
  CardNo: String;
  aCardState: String;
begin
  Screen.Cursor:= crHourGlass;

  AppendCount:=0;
  duplicateCount:=0;
  FailCount:=0;
  CancelCount:= 0;

  if clDoor.ItemsChecked <= 0 then
  begin
    ShowMessage('선택된 출입문이 없습니다.');
    Exit;
  end;

  for I:= 0 to DBGrid1.SelectedRows.Count -1 do
  begin
    DBGrid1.DataSource.Dataset.Gotobookmark(pointer(DBGrid1.SelectedRows.Items[i]));
    CardNo:= DBGrid1.DataSource.Dataset.FindField('CARD_NO').asString;
    RegCardPermit(CardNo,'N')
  end;
  Screen.Cursor:= crDefault;
  SHowMessage('신규등록데이터:'+InttoStr(AppendCount)+#13+
              '수정등록데이터:'+InttoStr(duplicateCount)+#13+
              '등록실패데이터:'+InttoStr(FailCount)+#13+
              '등록불가데이터:'+InttoStr(CancelCount));
end;

initialization
  RegisterClass(TfmFoodPermit);
Finalization
  UnRegisterClass(TfmFoodPermit);

end.
