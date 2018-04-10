unit uUpdateASList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, BaseGrid, AdvGrid, ExtCtrls, ComCtrls,
  DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, uSubForm,
  CommandArray,ActiveX, Menus;

type
  TfmUpdateASList = class(TfmASubForm)
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label1: TLabel;
    dt_Date: TDateTimePicker;
    ed_customername: TEdit;
    ed_customerphone: TEdit;
    ed_customeraddr: TEdit;
    ed_customerperson: TEdit;
    ed_zip: TEdit;
    GroupBox2: TGroupBox;
    Panel5: TPanel;
    btn_ASGoodsListAdd: TSpeedButton;
    Label2: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label15: TLabel;
    cmb_Group: TComboBox;
    cmb_GoodsList: TComboBox;
    ed_GoodsSerial: TEdit;
    mem_etc: TMemo;
    sg_AsGoodList: TAdvStringGrid;
    cmb_UserName: TComboBox;
    btn_Save: TBitBtn;
    btn_Close: TSpeedButton;
    TempQuery: TZQuery;
    Label11: TLabel;
    cmb_state: TComboBox;
    Label12: TLabel;
    ed_deliveryCompany: TEdit;
    ed_deliveryNum: TEdit;
    Label13: TLabel;
    PopupMenu2: TPopupMenu;
    MenuItem1: TMenuItem;
    sg_Customer: TAdvStringGrid;
    ZQuery1: TZQuery;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure cmb_GroupChange(Sender: TObject);
    procedure btn_ASGoodsListAddClick(Sender: TObject);
    procedure sg_AsGoodListButtonClick(Sender: TObject; ACol,
      ARow: Integer);
    procedure sg_AsGoodListCanEditCell(Sender: TObject; ARow,
      ACol: Integer; var CanEdit: Boolean);
    procedure MenuItem1Click(Sender: TObject);
    procedure sg_AsGoodListDblClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure sg_CustomerDblClick(Sender: TObject);
    procedure ed_customernameKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed_customernameChange(Sender: TObject);
  private
    ASGroupCodeList : TStringList;
    GoodsCodeList:TStringList;
    MasterIDList:TStringList;
    L_bChange : Boolean;
    { Private declarations }
    procedure LoadGroupCode;
    procedure LoadGoodsList;
    procedure  LoadUserName(cmb_box:TComboBox);
    procedure ShowASGOODSList;
    function GetState(aDate,aSerial:string):string;
    function CheckTB_ASGOODSList(aDate,aCode,aGoodsCode,aGoodsSerial:string):Boolean;
    function InsertTB_ASGOODSList(aDate,aCode,aGoodsCode,aGoodsSerial,aBadState:string):Boolean;
    function DeleteTB_ASGOODSLIST(aDate,aCode,aGoodsCode,aSerial:string):Boolean;
    function UpdateTB_ASGOODSLIST_State(aDate,aCode,aState:string):Boolean;
    function UpdateTB_ASList(aDate,aCode,aCustomername,acustomerperson,aphone,azip,
                  aAddr,aState,aNextID,adeliveryCompany,adeliveryNum:string):Boolean;
    procedure SearchCustomerName(aname:string);
  public
    { Public declarations }
    L_stDate : string;
    L_stCode : string;
    L_stCompanyCode : string;
    L_stNextID : string;
    L_stState : string;
    L_stLastGoodsState : string;
  end;

var
  fmUpdateASList: TfmUpdateASList;

implementation

uses uDataModule,
     uLomosUtil, uUpdateASGoodsList;

{$R *.dfm}

procedure TfmUpdateASList.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmUpdateASList.FormShow(Sender: TObject);
var
  i : integer;
begin
  L_stDate := stringReplace(L_stDate,'-','',[rfReplaceAll]);
  L_stDate := stringReplace(L_stDate,':','',[rfReplaceAll]);
  L_stDate := stringReplace(L_stDate,' ','',[rfReplaceAll]);

  dt_Date.Date := strtodate(copy(L_stDate,1,4) + '-' + copy(L_stDate,5,2) + '-' + copy(L_stDate,7,2));
  LoadGroupCode;
  LoadGoodsList;
  LoadUserName(cmb_UserName);
  cmb_UserName.ItemIndex := MasterIDList.IndexOf(L_stNextID);
  for i := 0 to cmb_state.Items.Count - 1 do
  begin
    if copy(cmb_state.Items.Strings[i],1,1) = copy(L_stState,1,1) then
    begin
      cmb_state.ItemIndex := i;
      break;
    end;
  end;
  
end;

procedure TfmUpdateASList.LoadGoodsList;
var
  stSql : string;
  stGroupCode : string;
begin
  cmb_GoodsList.Clear;
  cmb_GoodsList.Items.Add('');
  cmb_GoodsList.ItemIndex := 0;
  GoodsCodeList.Clear;
  GoodsCodeList.Add('');
  stSql := 'select * from TB_GOODSLIST ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + L_stCompanyCode + ''' ';
  if cmb_Group.ItemIndex > 0 then
  begin
    stGroupCode := ASGroupCodeList.Strings[cmb_Group.ItemIndex];
    stSql := stSql + ' AND AG_CODE = ''' + stGroupCode + ''' ';
  end;

  with TempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    while Not Eof do
    begin
      GoodsCodeList.Add(FindField('GL_CODE').AsString);
      cmb_GoodsList.Items.Add(FindField('GL_NAME').AsString);
      Next;
    end;
  end;

end;

procedure TfmUpdateASList.LoadGroupCode;
var
  stSql : string;
  i : integer;
  TempAdoQuery : TZQuery;
begin

  ASGroupCodeList.Clear;
  cmb_Group.Clear;
  ASGroupCodeList.Add('000');
  cmb_Group.Items.Add('전체');
  cmb_Group.ItemIndex := 0;

  stSql := 'select * from TB_ASGROUP ';
  stSql := stSql + ' order by AG_CODE ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TZQuery.Create(nil);
    TempAdoQuery.Connection := dmDB.ZConnection1;

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
      if RecordCount < 1 then exit;

      while Not Eof do
      begin
        cmb_Group.Items.Add(FindField('AG_NAME').AsString);
        ASGroupCodeList.Add(FindField('AG_CODE').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmUpdateASList.LoadUserName(cmb_box: TComboBox);
var
  stSql : string;
begin
  MasterIDList.Clear;
  cmb_box.Clear;
  cmb_box.ItemIndex := -1;
  stSql := ' Select * from TB_MASTER ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + Master_COMPANYCODE + ''' ';
  stSql := stsql + ' Order by MA_USERNAME ';

  with TempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if RecordCount < 1 then Exit;
    While Not Eof do
    begin
      MasterIDList.Add(FindField('MA_USERID').AsString);
      cmb_box.Items.Add(FindField('MA_USERNAME').AsString);
      Next;
    end;
    cmb_UserName.ItemIndex := MasterIDList.IndexOf(Master_ID);
  end;
end;

procedure TfmUpdateASList.FormCreate(Sender: TObject);
begin
  ASGroupCodeList := TStringList.Create;
  GoodsCodeList:= TStringList.Create;
  MasterIDList:= TStringList.Create;
end;

procedure TfmUpdateASList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ASGroupCodeList.Free;
  GoodsCodeList.Free;
  MasterIDList.Free;
end;

procedure TfmUpdateASList.ShowASGOODSList;
var
  stSql :string;
  nRow : integer;
  stGubun : string;
begin
  L_stLastGoodsState := '';
  GridInit(sg_AsGoodList,10);

  stSql := 'select a.*,b.GL_NAME,';
  stSql := stSql + ' CASE ';
  stSql := stSql + ' WHEN a.AG_STATE = ''1'' THEN ''입고'' ';
  stSql := stSql + ' WHEN a.AG_STATE = ''2'' THEN ''상태점검'' ';
  stSql := stSql + ' WHEN a.AG_STATE = ''3'' THEN ''수리중'' ';
  stSql := stSql + ' WHEN a.AG_STATE = ''4'' THEN ''공장입고'' ';
  stSql := stSql + ' WHEN a.AG_STATE = ''8'' THEN ''수리완료'' ';
  stSql := stSql + ' WHEN a.AG_STATE = ''9'' THEN ''발송완료'' ';
  stSql := stSql + ' ELSE '' '' ';
  stSql := stSql + ' END as STATE ';
  stSql := stSql + ' from TB_ASGOODSLIST a ';
  stSql := stSql + ' Left Join TB_GOODSLIST b ';
  stSql := stSql + ' ON ( a.CO_COMPANYCODE = b.CO_COMPANYCODE  ';
  stSql := stSql + ' AND a.GL_CODE = b.GL_CODE)  ';
  stSql := stSql + ' Where a.AL_DATE = ''' + FormatDateTime('yyyymmdd',dt_Date.DateTime) + ''' ';
  stSql := stSql + ' AND a.AL_CODE = ' + L_stCode + ' ';

  with TempQuery do
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
    sg_AsGoodList.RowCount := recordCount + 1;
    nRow := 1;
    while Not Eof do
    begin
      with sg_AsGoodList do
      begin               
        AddButton(0,nRow,1,1,'X',haFull,vaFull);
        cells[1,nRow] := inttostr(FindField('AL_CODE').asinteger);
        cells[2,nRow] := FindField('GL_NAME').AsString;
        cells[3,nRow] := FindField('AG_SERIAL').AsString;
        cells[4,nRow] := FindField('AG_BADSTATE').AsString;
        cells[5,nRow] := FindField('STATE').AsString;
        cells[6,nRow] := FindField('AG_ACTIONSTATE').AsString;
        cells[7,nRow] := FindField('GL_CODE').AsString;
        cells[8,nRow] := FindField('AG_STATE').AsString;
        cells[9,nRow] := GetState(FormatDateTime('yyyymmdd',dt_Date.DateTime),FindField('AG_SERIAL').AsString);

        if isDigit(FindField('AG_STATE').AsString) then
        begin
          if L_stLastGoodsState = '' then L_stLastGoodsState := FindField('AG_STATE').AsString
          else
          begin
            if strtoint(L_stLastGoodsState) > strtoint(FindField('AG_STATE').AsString) then L_stLastGoodsState := FindField('AG_STATE').AsString;
          end;
        end;
      end;
      nRow := nRow + 1;
      Next;
    end;
  end;
end;

procedure TfmUpdateASList.FormActivate(Sender: TObject);
begin
  ShowASGOODSList;
  L_bChange := False;
end;

procedure TfmUpdateASList.cmb_GroupChange(Sender: TObject);
begin
  inherited;
  LoadGoodsList;

end;

procedure TfmUpdateASList.btn_ASGoodsListAddClick(Sender: TObject);
var
  stGoodsCode : string;
begin
  if Trim(ed_GoodsSerial.Text) = '' then
  begin
    showmessage('물품의 시리얼 번호를 입력 하세요.');
    Exit;
  end;
  stGoodsCode := GoodsCodeList.Strings[cmb_GoodsList.itemIndex];
  if stGoodsCode = '' then
  begin
    showmessage('물품명을 선택 하세요.');
    Exit;
  end;
  if stGoodsCode = '000' then
  begin
    showmessage('물품명을 선택 하세요.');
    Exit;
  end;

  if CheckTB_ASGOODSList(FormatDateTime('yyyymmdd',dt_Date.Date),L_stCode,stGoodsCode,ed_GoodsSerial.Text) then
  begin
    showmessage('같은 물품이 이미 등록 되었습니다.');
    Exit;
  end;

  if InsertTB_ASGOODSList(FormatDateTime('yyyymmdd',dt_Date.Date),L_stCode,stGoodsCode,ed_GoodsSerial.Text,mem_etc.Text) then
  begin
    ed_GoodsSerial.Text := '';
    mem_etc.Text := '';
    ShowASGOODSList;
  end else
  begin
    showmessage('저장에 실패 하였습니다.');
  end;

end;

function TfmUpdateASList.CheckTB_ASGOODSList(aDate, aCode, aGoodsCode,
  aGoodsSerial: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' Select * from TB_ASGOODSLIST ';
  stSql := stSql + ' Where AL_DATE = ''' + aDate + ''' ';
  stSql := stsql + ' AND AL_CODE = ' + aCode ;
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + Master_COMPANYCODE + ''' ';
  stSql := stSql + ' AND GL_CODE = ''' + aGoodsCode + ''' ';
  stSql := stSql + ' AND AG_SERIAL = ''' + aGoodsSerial + ''' ';

  with TempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if RecordCount < 1 then Exit;
    result := True;
  end;
end;

function TfmUpdateASList.InsertTB_ASGOODSList(aDate, aCode, aGoodsCode,
  aGoodsSerial, aBadState: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_ASGOODSLIST(';
  stsql := stSql + ' AL_DATE,';
  stsql := stSql + ' AL_CODE,';
  stsql := stSql + ' CO_COMPANYCODE,';
  stsql := stSql + ' GL_CODE,';
  stsql := stSql + ' AG_SERIAL,';
  stsql := stSql + ' AG_BADSTATE,';
  stsql := stSql + ' MA_USERID';
  stsql := stSql + ' ) Values (';
  stsql := stSql + '''' + aDate + ''',';
  stsql := stSql + '' + aCode + ',';
  stsql := stSql + '''' + Master_COMPANYCODE + ''',';
  stsql := stSql + '''' + aGoodsCode + ''',';
  stsql := stSql + '''' + aGoodsSerial + ''',';
  stsql := stSql + '''' + aBadState + ''',';
  stsql := stSql + '''' + Master_ID + ''')';

  result := dmDB.ProcessExecSQL(stSql);

end;

function TfmUpdateASList.DeleteTB_ASGOODSLIST(aDate, aCode, aGoodsCode,
  aSerial: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Delete From TB_ASGOODSLIST ';
  stSql := stSql + ' Where AL_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND AL_CODE = ' + aCode + ' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + Master_COMPANYCODE + ''' ';
  if aGoodsCode <> '' then stSql := stSql + ' AND GL_CODE = ''' + aGoodsCode + ''' ';
  if aSerial <> '' then stSql := stSql + ' AND AG_SERIAL = ''' + aSerial + ''' ';

  result := dmDB.ProcessExecSQL(stSql);
end;

procedure TfmUpdateASList.sg_AsGoodListButtonClick(Sender: TObject; ACol,
  ARow: Integer);
begin
  inherited;
  with sg_AsGoodList do
  begin
    if (Application.MessageBox(PChar('데이터를 삭제하시겠습니까?'),'삭제',MB_OKCANCEL) = ID_CANCEL)  then Exit;
    DeleteTB_ASGOODSLIST(FormatDateTime('yyyymmdd',dt_date.DateTime),cells[1,ARow],Cells[5,ARow],Cells[3,ARow]);
    ClearRows(ARow,1);
    if rowCount > 2 then RemoveRows(ARow,1);
  end;

end;

procedure TfmUpdateASList.sg_AsGoodListCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  inherited;
  if ACol = 0 then canEDIT := True
  else  canEDIT := False;

end;

procedure TfmUpdateASList.MenuItem1Click(Sender: TObject);
begin
  inherited;
  with sg_AsGoodList do
  begin
    if Cells[1,Row] = '' then Exit;
    fmUpdateASGoodsList:= TfmUpdateASGoodsList.Create(Self);
    fmUpdateASGoodsList.L_stDate := FormatDateTime('yyyymmdd',dt_Date.dateTime);
    fmUpdateASGoodsList.L_stCode := cells[1,Row];
    fmUpdateASGoodsList.L_stGoodsCode := cells[7,Row];
    fmUpdateASGoodsList.L_stSerial := cells[3,Row];
    fmUpdateASGoodsList.mem_etc.text := cells[4,Row];
    fmUpdateASGoodsList.L_stState := cells[8,Row];
    fmUpdateASGoodsList.mem_Actionstate.text := cells[6,Row];
    fmUpdateASGoodsList.L_stCompanyCode := L_stCompanyCode;

    fmUpdateASGoodsList.ShowModal;
    fmUpdateASGoodsList.free;
  end;
  ShowASGOODSList;
end;

procedure TfmUpdateASList.sg_AsGoodListDblClick(Sender: TObject);
begin
  inherited;
  MenuItem1Click(self);
end;

procedure TfmUpdateASList.btn_SaveClick(Sender: TObject);
var
  stProcessState : string;
  stNextID : string;
begin
  inherited;
  if ed_GoodsSerial.Text <> '' then
  begin
    if (Application.MessageBox(PChar('입고 물품 처리중입니다. 저장후 종료 하시겠습니까?'),'변경',MB_OKCANCEL) = ID_CANCEL)  then Exit;
    btn_ASGoodsListAddClick(self);
  end;
  if cmb_state.ItemIndex < 0 then
  begin
    showmessage('처리상태를 입력 하세요.');
    Exit;
  end;
  if isDigit(L_stLastGoodsState) then
  begin
    if strtoint(L_stLastGoodsState) >= strtoint(copy(cmb_state.Text,1,1)) then
    begin
      if strtoint(L_stLastGoodsState) > strtoint(copy(cmb_state.Text,1,1)) then
      begin
        if (Application.MessageBox(PChar('접수물품의 처리상태가 현재보다 상위입니다. 접수물품의 처리상태로 변경하시겠습니까?'),'변경',MB_OKCANCEL) = ID_CANCEL)  then Exit;
      end;
      stProcessState := L_stLastGoodsState;
    end else
    begin
      if (Application.MessageBox(PChar('접수 물품 중 처리상태가 '+ cmb_state.Text + ' 이전 상태가 존재 합니다.' + #13#10 +
                                       '접수물품의 처리상태를 ' + cmb_state.Text + ' 상태로 변경 하시겠습니까?'),'변경',MB_OKCANCEL) = ID_CANCEL)  then Exit;
      UpdateTB_ASGOODSLIST_State(FormatDateTime('yyyymmdd',dt_Date.DateTime),L_stCode,copy(cmb_state.Text,1,1));
      stProcessState := copy(cmb_state.Text,1,1);
    end;
  end else stProcessState := copy(cmb_state.Text,1,1);
  stNextID := MasterIDList.Strings[cmb_UserName.itemIndex];
  if UpdateTB_ASList(FormatDateTime('yyyymmdd',dt_Date.DateTime),L_stCode,ed_customername.Text,
                  ed_customerperson.Text,ed_customerphone.Text,ed_zip.Text,
                  ed_customeraddr.Text,stProcessState,stNextID,ed_deliveryCompany.Text,ed_deliveryNum.Text) then Close
  else showmessage('데이터 저장에 실패하였습니다.');
end;

function TfmUpdateASList.UpdateTB_ASGOODSLIST_State(aDate, aCode,
  aState: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_ASGOODSLIST set AG_STATE = ''' + aState + ''' ';
  stSql := stSql + ' Where AL_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND AL_CODE = ' + aCode + ' ';
  stSql := stSql + ' AND AG_STATE < ''' + aState + ''' ';

  result := dmDB.ProcessExecSQL(stSql);
end;

function TfmUpdateASList.UpdateTB_ASList(aDate, aCode, aCustomername,
  acustomerperson, aphone, azip, aAddr, aState, aNextID,
  adeliveryCompany, adeliveryNum: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_ASLIST set ';
  stSql := stSql + ' AL_NAME = ''' + aCustomername + ''', ';
  stSql := stSql + ' AL_USERNAME = ''' + acustomerperson + ''', ';
  stSql := stSql + ' AL_TELNUM = ''' + aphone + ''', ';
  stSql := stSql + ' AL_ZIPCODE = ''' + azip + ''', ';
  stSql := stSql + ' AL_ADDR = ''' + aAddr + ''', ';
  stSql := stSql + ' AL_STATE = ''' + aState + ''', ';
  stSql := stSql + ' AL_NEXTID = ''' + aNextID + ''', ';
  stSql := stSql + ' AL_CONFIRM = ''N'', ';
  stSql := stSql + ' AL_DELIVERYCOMPANY = ''' + adeliveryCompany + ''', ';
  stSql := stSql + ' AL_DELIVERYNUM = ''' + adeliveryNum + ''', ';
  stSql := stSql + ' AL_LASTDATE = ''' + FormatDateTime('yyyymmdd',now) + ''', ';
  stSql := stSql + ' MA_USERID = ''' + Master_ID + ''' ';
  stSql := stSql + ' Where AL_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND AL_CODE = ' + aCode + ' ';

  result := dmDB.ProcessExecSQL(stSql);

end;

procedure TfmUpdateASList.SearchCustomerName(aname: string);
var
  stSql : string;
  nRow : integer;
begin
  sg_Customer.Visible := False;
  if aname = '' then Exit;

  stSql := ' Select * from TB_ASLIST ';
  stSql := stSql + ' Where AL_NAME Like ''%' + aname + '%'' ';

  with TempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    sg_Customer.Visible := True;
    GridInit(sg_Customer,2); //스트링그리드 초기화
    with sg_Customer do
    begin
      RowCount := recordCount + 1;
      nRow := 1;
      While Not Eof do
      begin
        Cells[0,nRow] := FindField('AL_NAME').AsString;
        Cells[1,nRow] := FindField('AL_TELNUM').AsString;
        Cells[2,nRow] := FindField('AL_USERNAME').AsString;
        Cells[3,nRow] := FindField('AL_ZIPCODE').AsString;
        Cells[4,nRow] := FindField('AL_ADDR').AsString;
        inc(nRow);
        next;
      end;
    end;
  end;
end;

procedure TfmUpdateASList.sg_CustomerDblClick(Sender: TObject);
begin
  inherited;
  with sg_Customer do
  begin
    ed_customername.Text := Cells[0,Row];
    ed_customerphone.Text := Cells[1,Row];
    ed_customerperson.Text := Cells[2,Row];
    ed_zip.Text := Cells[3,Row];
    ed_customeraddr.Text := Cells[4,Row];
    visible := False;
  end;

end;

procedure TfmUpdateASList.ed_customernameKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if L_bChange then
    SearchCustomerName(ed_customername.Text);

end;

procedure TfmUpdateASList.ed_customernameChange(Sender: TObject);
begin
  inherited;
  L_bChange := True;
end;

function TfmUpdateASList.GetState(aDate, aSerial: string): string;
var
  stSql : string;
begin
  result := '';
  if Not isDigit(aSerial) then Exit;
  stSql := 'select *';
  stSql := stSql + ' from TB_ASGOODSLIST  ';
  stSql := stSql + ' Where AL_DATE <> ''' + aDate + ''' ';
  stSql := stSql + ' AND AL_CODE = ' + aSerial + ' ';

  with ZQuery1 do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordcount < 1 then Exit;
    result := 'O';
  end;

end;

end.
