unit uFoodGubunAdmin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BaseGrid, AdvGrid, StdCtrls, RzCmboBx, RzButton,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDCustomPanelFill, LMDPanelFill, ExtCtrls, RzPanel,
  Mask, RzEdit, DB, ADODB;

type
  TfmFoodGubunAdmin = class(TForm)
    RzPanel1: TRzPanel;
    Label3: TLabel;
    Label4: TLabel;
    LMDPanelFill2: TLMDPanelFill;
    btnSearch: TRzBitBtn;
    CB_Class: TRzComboBox;
    cbDepart: TRzComboBox;
    btn_close: TRzBitBtn;
    sg_Card: TAdvStringGrid;
    btn_save: TRzBitBtn;
    edName: TRzEdit;
    edSabun: TRzEdit;
    Label1: TLabel;
    Label2: TLabel;
    cb_Nonpay: TRzComboBox;
    Label5: TLabel;
    Query: TADOQuery;
    ADOExec: TADOQuery;
    procedure btn_closeClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure sg_CardCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure btn_saveClick(Sender: TObject);
    procedure sg_CardGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
  private
    { Private declarations }
    ClassCodeList: TStringList;
    procedure Load_comboData;
    function  CheckQuerySearchData: String;
    Procedure ExecQuery_ID(SearchItem:String);
    procedure sgCardGridInit(sg:TAdvStringGrid;aCol:integer);
    procedure sgCardGridHeaderSet(sg:TAdvStringGrid);
    procedure AdvStrinGridSetAllCheck(Sender: TObject;aCol:integer;bchkState:Boolean);
    function InsertTB_FOODADMIN(
        stCO_CODE,
        stDepart_code,
        stID_NO,
        stBREAKFIRST,
        stLUNCH,
        stDINNER,
        stMIDNIGHT,
        stWEBREAKFIRST,
        stWELUNCH,
        stWEDINNER,
        stWEMIDNIGHT,
        stHOBREAKFIRST,
        stHOLUNCH,
        stHODINNER,
        stHOMIDNIGHT,
{        stWEEK,
        stWEEKEND,
        stHOLIDAY, }
        stMoney:string):Boolean;
    function UpdateTB_FOODADMIN(
        stCO_CODE,
        stDepart_code,
        stID_NO,
        stBREAKFIRST,
        stLUNCH,
        stDINNER,
        stMIDNIGHT,
        stWEBREAKFIRST,
        stWELUNCH,
        stWEDINNER,
        stWEMIDNIGHT,
        stHOBREAKFIRST,
        stHOLUNCH,
        stHODINNER,
        stHOMIDNIGHT,
{        stWEEK,
        stWEEKEND,
        stHOLIDAY, }
        stMoney:string):Boolean;
  public
    { Public declarations }
  end;

var
  fmFoodGubunAdmin: TfmFoodGubunAdmin;

implementation
uses
uDataModule1,
uMSDEsql;

{$R *.dfm}

procedure TfmFoodGubunAdmin.btn_closeClick(Sender: TObject);
begin
  Close;
end;

procedure TfmFoodGubunAdmin.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfmFoodGubunAdmin.Load_comboData;
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

procedure TfmFoodGubunAdmin.FormCreate(Sender: TObject);
begin
  ClassCodeList:= TStringList.Create;

  Load_comboData;
  sgCardGridHeaderSet(sg_Card);
  sgCardGridInit(sg_Card,18);

end;

procedure TfmFoodGubunAdmin.btnSearchClick(Sender: TObject);
var
  SearchItem: string;
begin
  SearchItem:= CheckQuerySearchData;
  ExecQuery_ID(SearchItem);

end;

function TfmFoodGubunAdmin.CheckQuerySearchData: String;
var
  st: string;
begin
  Result:= '';

  //출입자명
  if (edName.Text <> '') then
  begin
    if (Result <> '') then Result := Result + ' AND ';
    Result := Result + 'a.USER_NAME LIKE ' + '''' + edName.Text + '%''';
  end;
  // 학급코드
  if (CB_Class.Text <> '') then
  begin
    st:=ClassCodeList.Strings[CB_Class.IndexOf(CB_Class.Text)];
    if (Result <> '') then Result := Result + ' AND ';
    Result := Result + 'a.CO_CODE LIKE ' + '''' + st + '%''';
  end;

  //부서

  if (cbDepart.ItemIndex > 0) then
  begin
    st:= Copy(cbDepart.Text,1,3);
    if (Result <> '') then Result := Result + ' AND ';
    Result := Result + 'a.DEPART_CODE LIKE ' + '''' + st + '%''';
  end;

  //사번

  if (edSabun.Text <> '') then
  begin
    if (Result <> '') then Result := Result + ' AND ';
    Result := Result + 'a.ID_NO LIKE ' + '''' + edSabun.Text + '%''';
  end;

  //미납구분
  if cb_Nonpay.ItemIndex = 1 then
  begin
    if (Result <> '') then Result := Result + ' AND ';
    Result := Result + 'b.FO_MONEY = ''Y''';
  end else
  if cb_Nonpay.ItemIndex = 2 then
  begin
    if (Result <> '') then Result := Result + ' AND ';
    Result := Result + 'b.FO_MONEY <> ''Y''';
  end;
  
end;

procedure TfmFoodGubunAdmin.ExecQuery_ID(SearchItem: String);
var
  stSql : string;
  nRow : integer;
begin
    sgCardGridInit(sg_Card,18);
    
    stSql := 'select a.CO_CODE,a.DEPART_CODE,a.ID_NO,';
    stSql := stSql + 'a.CO_NAME,a.DEPART_NAME,a.USER_NAME,';
    stSql := stSql + 'b.FO_BREAKFIRST,b.FO_LUNCH,b.FO_DINNER,';
    stSql := stSql + 'b.FO_MIDNIGHT,b.FO_MONEY,b.FO_WEEK,b.FO_WEEKEND,';
    stSql := stSql + 'b.FO_WEBREAKFIRST,b.FO_WELUNCH,b.FO_WEDINNER,';
    stSql := stSql + 'b.FO_WEMIDNIGHT,';
    stSql := stSql + 'b.FO_HOBREAKFIRST,b.FO_HOLUNCH,b.FO_HODINNER,';
    stSql := stSql + 'b.FO_HOMIDNIGHT,';
    stSql := stSql + 'b.FO_HOLIDAY from ';
    stSql := stSql + ' TB_CARD a ';
    stSql := stSql + ' Left Join TB_FOODADMIN b ';
    stSql := stSql + ' ON(';
    stSql := stSql + ' a.CO_CODE = b.CO_CODE ';
    stSql := stSql + ' AND a.DEPART_CODE = b.DEPART_CODE ';
    stSql := stSql + ' AND a.ID_NO = b.ID_NO)';
    if (SearchItem <> '') then stSql := stSql + ' WHERE ' + SearchItem;
    stSql := stSql + ' ORDER BY a.CO_CODE, a.DEPART_CODE, a.ID_NO ';
    with Query do
    begin
      Close;
      SQL.Clear;
      SQL.Text := stSql;
      Try
        Open;
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

      if recordCount < 1 then Exit;
      First;
      sg_Card.RowCount := recordCount + 2;
      nRow := 2;

      While Not Eof do
      begin
        with sg_Card do
        begin
          cells[0,nRow] := FindField('CO_NAME').AsString;
          cells[1,nRow] := FindField('DEPART_NAME').AsString;
          cells[2,nRow] := FindField('ID_NO').AsString;
          cells[3,nRow] := FindField('USER_NAME').AsString;
          if FindField('FO_BREAKFIRST').AsString = 'Y' then  AddCheckBox(4,nRow,True,False)
          else AddCheckBox(4,nRow,False,False);
          if FindField('FO_LUNCH').AsString = 'Y' then  AddCheckBox(5,nRow,True,False)
          else AddCheckBox(5,nRow,False,False);
          if FindField('FO_DINNER').AsString = 'Y' then  AddCheckBox(6,nRow,True,False)
          else AddCheckBox(6,nRow,False,False);
          if FindField('FO_MIDNIGHT').AsString = 'Y' then  AddCheckBox(7,nRow,True,False)
          else AddCheckBox(7,nRow,False,False);

          if FindField('FO_WEBREAKFIRST').AsString = 'Y' then  AddCheckBox(8,nRow,True,False)
          else AddCheckBox(8,nRow,False,False);
          if FindField('FO_WELUNCH').AsString = 'Y' then  AddCheckBox(9,nRow,True,False)
          else AddCheckBox(9,nRow,False,False);
          if FindField('FO_WEDINNER').AsString = 'Y' then  AddCheckBox(10,nRow,True,False)
          else AddCheckBox(10,nRow,False,False);
          if FindField('FO_WEMIDNIGHT').AsString = 'Y' then  AddCheckBox(11,nRow,True,False)
          else AddCheckBox(11,nRow,False,False);

          if FindField('FO_HOBREAKFIRST').AsString = 'Y' then  AddCheckBox(12,nRow,True,False)
          else AddCheckBox(12,nRow,False,False);
          if FindField('FO_HOLUNCH').AsString = 'Y' then  AddCheckBox(13,nRow,True,False)
          else AddCheckBox(13,nRow,False,False);
          if FindField('FO_HODINNER').AsString = 'Y' then  AddCheckBox(14,nRow,True,False)
          else AddCheckBox(14,nRow,False,False);
          if FindField('FO_HOMIDNIGHT').AsString = 'Y' then  AddCheckBox(15,nRow,True,False)
          else AddCheckBox(15,nRow,False,False);

      {    if FindField('FO_WEEK').AsString = 'Y' then  AddCheckBox(8,nRow,True,False)
          else AddCheckBox(8,nRow,False,False);
          if FindField('FO_WEEKEND').AsString = 'Y' then  AddCheckBox(9,nRow,True,False)
          else AddCheckBox(9,nRow,False,False);
          if FindField('FO_HOLIDAY').AsString = 'Y' then  AddCheckBox(10,nRow,True,False)
          else AddCheckBox(10,nRow,False,False);}
          if FindField('FO_MONEY').AsString = 'Y' then  AddCheckBox(16,nRow,True,False)
          else AddCheckBox(16,nRow,False,False);
          cells[17,nRow] := FindField('CO_CODE').AsString;
          cells[18,nRow] := FindField('DEPART_CODE').AsString;
        end;
        nRow := nRow + 1;
        Next;
      end;
    end;
end;

procedure TfmFoodGubunAdmin.sgCardGridInit(sg: TAdvStringGrid; aCol: integer);
var
  i:integer;
begin
  with sg do
  begin
    RowCount := 3;
    for i:=1 to 2 do
    begin
      RemoveCheckBox(4,i);
      RemoveCheckBox(5,i);
      RemoveCheckBox(6,i);
      RemoveCheckBox(7,i);
      RemoveCheckBox(8,i);
      RemoveCheckBox(9,i);
      RemoveCheckBox(10,i);
      RemoveCheckBox(11,i);
      RemoveCheckBox(12,i);
      RemoveCheckBox(13,i);
      RemoveCheckBox(14,i);
      RemoveCheckBox(15,i);
      RemoveCheckBox(16,i);
      RemoveCheckBox(17,i);
    end;
    AddCheckBox(4,1,False,False);
    AddCheckBox(5,1,False,False);
    AddCheckBox(6,1,False,False);
    AddCheckBox(7,1,False,False);
    AddCheckBox(8,1,False,False);
    AddCheckBox(9,1,False,False);
    AddCheckBox(10,1,False,False);
    AddCheckBox(11,1,False,False);
    AddCheckBox(12,1,False,False);
    AddCheckBox(13,1,False,False);
    AddCheckBox(14,1,False,False);
    AddCheckBox(15,1,False,False);
    AddCheckBox(16,1,False,False);
    AddCheckBox(17,1,False,False);
    for i:= 0 to ColCount - 1 do
    begin
      Cells[i,2] := '';
    end;

    for i := aCol to ColCount - 1 do
    begin
      ColWidths[i] := 0;
    end;
  end;

end;

procedure TfmFoodGubunAdmin.sg_CardCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
  if ARow = 1 then //전체선택 또는 해제
  begin
    AdvStrinGridSetAllCheck(Sender,ACol,State);
  end;
end;

procedure TfmFoodGubunAdmin.AdvStrinGridSetAllCheck(Sender: TObject;
  aCol: integer; bchkState: Boolean);
var
  i : integer;
begin
    for i:= 2 to (Sender as TAdvStringGrid).RowCount - 1  do
    begin
      (Sender as TAdvStringGrid).SetCheckBoxState(aCol,i,bchkState);
    end;
end;

procedure TfmFoodGubunAdmin.btn_saveClick(Sender: TObject);
var
  i : integer;
  stCO_CODE,stDepart_code,stID_NO:string;
  stBREAKFIRST,stLUNCH,stDINNER,stMIDNIGHT : string;
  stWEBREAKFIRST,stWELUNCH,stWEDINNER,stWEMIDNIGHT : string;
  stHOBREAKFIRST,stHOLUNCH,stHODINNER,stHOMIDNIGHT : string;
  stWEEK,stWEEKEND,stHOLIDAY,stMoney:string;
  bchkState : Boolean;
begin
  btn_save.Enabled := False;
  with sg_card do
  begin
    for i:= 1 to RowCount - 1 do
    begin
      stCO_CODE := Cells[17,i];
      stDepart_code := Cells[18,i];
      stID_NO := Cells[2,i];
      GetCheckBoxState(4,i, bchkState);
      if bchkState then stBREAKFIRST := 'Y'
      else stBREAKFIRST := 'N';
      GetCheckBoxState(5,i, bchkState);
      if bchkState then stLUNCH := 'Y'
      else stLUNCH := 'N';
      GetCheckBoxState(6,i, bchkState);
      if bchkState then stDINNER := 'Y'
      else stDINNER := 'N';
      GetCheckBoxState(7,i, bchkState);
      if bchkState then stMIDNIGHT := 'Y'
      else stMIDNIGHT := 'N';

      GetCheckBoxState(8,i, bchkState);
      if bchkState then stWEBREAKFIRST := 'Y'
      else stWEBREAKFIRST := 'N';
      GetCheckBoxState(9,i, bchkState);
      if bchkState then stWELUNCH := 'Y'
      else stWELUNCH := 'N';
      GetCheckBoxState(10,i, bchkState);
      if bchkState then stWEDINNER := 'Y'
      else stWEDINNER := 'N';
      GetCheckBoxState(11,i, bchkState);
      if bchkState then stWEMIDNIGHT := 'Y'
      else stWEMIDNIGHT := 'N';

      GetCheckBoxState(12,i, bchkState);
      if bchkState then stHOBREAKFIRST := 'Y'
      else stHOBREAKFIRST := 'N';
      GetCheckBoxState(13,i, bchkState);
      if bchkState then stHOLUNCH := 'Y'
      else stHOLUNCH := 'N';
      GetCheckBoxState(14,i, bchkState);
      if bchkState then stHODINNER := 'Y'
      else stHODINNER := 'N';
      GetCheckBoxState(15,i, bchkState);
      if bchkState then stHOMIDNIGHT := 'Y'
      else stHOMIDNIGHT := 'N';

{      GetCheckBoxState(8,i, bchkState);
      if bchkState then stWEEK := 'Y'
      else stWEEK := 'N';
      GetCheckBoxState(9,i, bchkState);
      if bchkState then stWEEKEND := 'Y'
      else stWEEKEND := 'N';
      GetCheckBoxState(10,i, bchkState);
      if bchkState then stHOLIDAY := 'Y'
      else stHOLIDAY := 'N';  }
      GetCheckBoxState(16,i, bchkState);
      if bchkState then stMoney := 'Y'
      else stMoney := 'N';

      if Not InsertTB_FOODADMIN(
        stCO_CODE,
        stDepart_code,
        stID_NO,
        stBREAKFIRST,
        stLUNCH,
        stDINNER,
        stMIDNIGHT,
        stWEBREAKFIRST,
        stWELUNCH,
        stWEDINNER,
        stWEMIDNIGHT,
        stHOBREAKFIRST,
        stHOLUNCH,
        stHODINNER,
        stHOMIDNIGHT,
{        stWEEK,
        stWEEKEND,
        stHOLIDAY,  }
        stMoney) then
        UpdateTB_FOODADMIN(
        stCO_CODE,
        stDepart_code,
        stID_NO,
        stBREAKFIRST,
        stLUNCH,
        stDINNER,
        stMIDNIGHT,
        stWEBREAKFIRST,
        stWELUNCH,
        stWEDINNER,
        stWEMIDNIGHT,
        stHOBREAKFIRST,
        stHOLUNCH,
        stHODINNER,
        stHOMIDNIGHT,
{        stWEEK,
        stWEEKEND,
        stHOLIDAY,  }
        stMoney);

    end;
  end;

  btn_Save.Enabled := True;

end;

function TfmFoodGubunAdmin.InsertTB_FOODADMIN(stCO_CODE, stDepart_code,
  stID_NO, stBREAKFIRST, stLUNCH, stDINNER, stMIDNIGHT,
  stWEBREAKFIRST,stWELUNCH,stWEDINNER,stWEMIDNIGHT,stHOBREAKFIRST,stHOLUNCH,
  stHODINNER,stHOMIDNIGHT,{stWEEK, stWEEKEND,stHOLIDAY,}
  stMoney: string): Boolean;
var
  stSql :string;
begin
  result := False;
  stSql := 'Insert Into TB_FOODADMIN(';
  stSql := stSql + 'CO_CODE,';
  stSql := stSql + 'DEPART_CODE,';
  stSql := stSql + 'ID_NO,';
  stSql := stSql + 'FO_BREAKFIRST,';
  stSql := stSql + 'FO_LUNCH,';
  stSql := stSql + 'FO_DINNER,';
  stSql := stSql + 'FO_MIDNIGHT,';

  stSql := stSql + 'FO_WEBREAKFIRST,';
  stSql := stSql + 'FO_WELUNCH,';
  stSql := stSql + 'FO_WEDINNER,';
  stSql := stSql + 'FO_WEMIDNIGHT,';

  stSql := stSql + 'FO_HOBREAKFIRST,';
  stSql := stSql + 'FO_HOLUNCH,';
  stSql := stSql + 'FO_HODINNER,';
  stSql := stSql + 'FO_HOMIDNIGHT,';

  stSql := stSql + 'FO_MONEY ) ';
{  stSql := stSql + 'FO_WEEK,';
  stSql := stSql + 'FO_WEEKEND,';
  stSql := stSql + 'FO_HOLIDAY) ';}
  stSql := stSql + ' Values(';
  stSql := stSql + '''' + stCO_CODE + ''',';
  stSql := stSql + '''' + stDEPART_CODE + ''',';
  stSql := stSql + '''' + stID_NO + ''',';
  stSql := stSql + '''' + stBREAKFIRST + ''',';
  stSql := stSql + '''' + stLUNCH + ''',';
  stSql := stSql + '''' + stDINNER + ''',';
  stSql := stSql + '''' + stMIDNIGHT + ''',';

  stSql := stSql + '''' + stWEBREAKFIRST + ''',';
  stSql := stSql + '''' + stWELUNCH + ''',';
  stSql := stSql + '''' + stWEDINNER + ''',';
  stSql := stSql + '''' + stWEMIDNIGHT + ''',';

  stSql := stSql + '''' + stHOBREAKFIRST + ''',';
  stSql := stSql + '''' + stHOLUNCH + ''',';
  stSql := stSql + '''' + stHODINNER + ''',';
  stSql := stSql + '''' + stHOMIDNIGHT + ''',';

  stSql := stSql + '''' + stMONEY + ''' ) ';
{  stSql := stSql + '''' + stWEEK + ''',';
  stSql := stSql + '''' + stWEEKEND + ''',';
  stSql := stSql + '''' + stHOLIDAY + ''') '; }

  with ADOExec do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      ExecSQL;
    Except
      Exit;
    End;
  end;

  result := True;
end;

function TfmFoodGubunAdmin.UpdateTB_FOODADMIN(stCO_CODE, stDepart_code,
  stID_NO, stBREAKFIRST, stLUNCH, stDINNER, stMIDNIGHT,
  stWEBREAKFIRST,stWELUNCH,stWEDINNER,stWEMIDNIGHT,stHOBREAKFIRST,stHOLUNCH,
  stHODINNER,stHOMIDNIGHT,{stWEEK, stWEEKEND,stHOLIDAY,}
  stMoney: string): Boolean;
var
  stSql :string;
begin
  result := False;
  stSql := 'update TB_FOODADMIN set ';
  stSql := stSql + 'FO_BREAKFIRST=''' + stBREAKFIRST + ''',';
  stSql := stSql + 'FO_LUNCH=''' + stLUNCH + ''',';
  stSql := stSql + 'FO_DINNER=''' + stDINNER + ''',';
  stSql := stSql + 'FO_MIDNIGHT=''' + stMIDNIGHT + ''',';

  stSql := stSql + 'FO_WEBREAKFIRST=''' + stWEBREAKFIRST + ''',';
  stSql := stSql + 'FO_WELUNCH=''' + stWELUNCH + ''',';
  stSql := stSql + 'FO_WEDINNER=''' + stWEDINNER + ''',';
  stSql := stSql + 'FO_WEMIDNIGHT=''' + stWEMIDNIGHT + ''',';

  stSql := stSql + 'FO_HOBREAKFIRST=''' + stHOBREAKFIRST + ''',';
  stSql := stSql + 'FO_HOLUNCH=''' + stHOLUNCH + ''',';
  stSql := stSql + 'FO_HODINNER=''' + stHODINNER + ''',';
  stSql := stSql + 'FO_HOMIDNIGHT=''' + stHOMIDNIGHT + ''',';

  stSql := stSql + 'FO_MONEY=''' + stMONEY + ''' ';
{  stSql := stSql + 'FO_WEEK=''' + stWEEK + ''',';
  stSql := stSql + 'FO_WEEKEND=''' + stWEEKEND + ''',';
  stSql := stSql + 'FO_HOLIDAY=''' + stHOLIDAY + ''' ';  }
  stSql := stSql + ' where ';
  stSql := stSql + ' CO_CODE =''' + stCO_CODE + '''';
  stSql := stSql + ' AND DEPART_CODE=''' + stDEPART_CODE + '''';
  stSql := stSql + ' AND ID_NO=''' + stID_NO + '''';

  with ADOExec do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      ExecSQL;
    Except
      Exit;
    End;
  end;

  result := True;
end;

procedure TfmFoodGubunAdmin.sgCardGridHeaderSet(sg: TAdvStringGrid);
begin
  with sg do
  begin
    Clear;
    MergeCells(0,0,1,2);
    Cells[0,0] := '학급';
    MergeCells(1,0,1,2);
    Cells[1,0] := '구분';
    MergeCells(2,0,1,2);
    Cells[2,0] := '번호';
    MergeCells(3,0,1,2);
    Cells[3,0] := '이름';
    MergeCells(4,0,4,1);
    Cells[4,0] := '주중';
    MergeCells(8,0,4,1);
    Cells[8,0] := '주말';
    MergeCells(12,0,4,1);
    Cells[12,0] := '공휴일';
//    MergeCells(16,0,1,2);
    Cells[16,0] := '미납구분';
    Cells[4,1] := '조식';
    Cells[5,1] := '중식';
    Cells[6,1] := '석식';
    Cells[7,1] := '야식';
    Cells[8,1] := '조식';
    Cells[9,1] := '중식';
    Cells[10,1] := '석식';
    Cells[11,1] := '야식';
    Cells[12,1] := '조식';
    Cells[13,1] := '중식';
    Cells[14,1] := '석식';
    Cells[15,1] := '야식';
    Cells[16,1] := '미납';
  end;
end;

procedure TfmFoodGubunAdmin.sg_CardGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if ARow < 1 then
  begin
    HAlign := taCenter;
    VAlign := vtaCenter;
  end  else
  begin
    HAlign := taLeftJustify;
    VAlign := vtaCenter;
  end;
end;

initialization
  RegisterClass(TfmFoodGubunAdmin);
Finalization
  UnRegisterClass(TfmFoodGubunAdmin);

end.
