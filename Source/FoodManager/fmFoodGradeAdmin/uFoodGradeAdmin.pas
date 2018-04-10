unit uFoodGradeAdmin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BaseGrid, AdvGrid, StdCtrls, RzCmboBx, RzButton,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDCustomPanelFill, LMDPanelFill, ExtCtrls, RzPanel,
  Mask, RzEdit, DB, ADODB, uSubForm, CommandArray, AdvObj;

type
  TfmFoodGradeAdmin = class(TfmASubForm)
    RzPanel1: TRzPanel;
    LMDPanelFill2: TLMDPanelFill;
    btnSearch: TRzBitBtn;
    btn_close: TRzBitBtn;
    sg_Card: TAdvStringGrid;
    btn_save: TRzBitBtn;
    Query: TADOQuery;
    ADOExec: TADOQuery;
    GroupBox4: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label17: TLabel;
    Label20: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    cmb_Company: TComboBox;
    cmb_Jijum: TComboBox;
    cmb_Depart: TComboBox;
    cmb_Posi: TComboBox;
    ed_empNo: TEdit;
    ed_name: TEdit;
    cb_NonPay: TComboBox;
    Label1: TLabel;
    procedure btn_closeClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure sg_CardCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure btn_saveClick(Sender: TObject);
    procedure sg_CardGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure CommandArrayCommandsTCommand0Execute(Command: TCommand;
      Params: TStringList);
    procedure FormActivate(Sender: TObject);
    procedure cmb_CompanyChange(Sender: TObject);
    procedure cmb_JijumChange(Sender: TObject);
    procedure cmb_DepartChange(Sender: TObject);
    procedure cmb_PosiChange(Sender: TObject);
    procedure cb_NonPayChange(Sender: TObject);
  private
    { Private declarations }
    procedure SearchFoodAdmin(aCode:string);
    Procedure ExecQuery_ID(SearchItem:String);
    procedure sgCardGridInit(sg:TAdvStringGrid;aCol:integer);
    procedure sgCardGridHeaderSet(sg:TAdvStringGrid);
    procedure AdvStrinGridSetAllCheck(Sender: TObject;aCol:integer;bchkState:Boolean);
    function InsertTB_FOODGRADE(
        stCO_CODE,
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
    function UpdateTB_FOODGRADE(
        stCO_CODE,
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
  fmFoodGradeAdmin: TfmFoodGradeAdmin;
  CompanyCodeList : TStringList;
  JijumCodeList : TStringList;
  DepartCodeList : TStringList;
  PosiCodeList : TStringList;

implementation
uses
uDataModule1,
uMSDEsql,
uMDBSql,
uPostGreSql,
uMssql,
uCompanyCodeLoad;

{$R *.dfm}

procedure TfmFoodGradeAdmin.btn_closeClick(Sender: TObject);
begin
  Close;
end;

procedure TfmFoodGradeAdmin.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  CompanyCodeList.Free;
  JijumCodeList.Free;
  DepartCodeList.Free;
  PosiCodeList.Free;
end;


procedure TfmFoodGradeAdmin.FormCreate(Sender: TObject);
begin
  CompanyCodeList:= TStringList.Create;
  JijumCodeList := TStringList.Create;
  DepartCodeList:= TStringList.Create;
  PosiCodeList := TStringList.Create;

  sgCardGridHeaderSet(sg_Card);
  sgCardGridInit(sg_Card,18);

end;

procedure TfmFoodGradeAdmin.btnSearchClick(Sender: TObject);
var
  SearchItem: string;
begin
  SearchFoodAdmin('');
//  SearchItem:= CheckQuerySearchData;
//  ExecQuery_ID(SearchItem);

end;



procedure TfmFoodGradeAdmin.ExecQuery_ID(SearchItem: String);
var
  stSql : string;
  nRow : integer;
begin
    sgCardGridInit(sg_Card,18);

    stSql := 'select a.CO_COMPANYCODE,a.CO_DEPARTCODE,a.EM_CODE,a.PO_POSICODE,a.EM_NAME,';
    stSql := stSql + 'c.CO_NAME as COMPANY_NAME,d.CO_NAME as DEPART_NAME,';
    stSql := stSql + 'b.FO_BREAKFIRST,b.FO_LUNCH,b.FO_DINNER,';
    stSql := stSql + 'b.FO_MIDNIGHT,b.FO_MONEY,';
    stSql := stSql + 'b.FO_WEBREAKFIRST,b.FO_WELUNCH,b.FO_WEDINNER,';
    stSql := stSql + 'b.FO_WEMIDNIGHT,';
    stSql := stSql + 'b.FO_HOBREAKFIRST,b.FO_HOLUNCH,b.FO_HODINNER,';
    stSql := stSql + 'b.FO_HOMIDNIGHT';
    stSql := stSql + ' from ';
    stSql := stSql + ' TB_EMPLOYEE a ';
    stSql := stSql + ' LEFT JOIN TB_COMPANY c  ';
    stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
    stSql := stSql + ' AND a.CO_COMPANYCODE = c.CO_COMPANYCODE ';
    stSql := stSql + ' AND c.CO_GUBUN = ''1'') ';
    stSql := stSql + ' LEFT JOIN TB_COMPANY d  ';
    stSql := stSql + ' ON (a.GROUP_CODE = d.GROUP_CODE ';
    stSql := stSql + ' AND a.CO_COMPANYCODE = d.CO_COMPANYCODE  ';
    stSql := stSql + ' AND a.CO_DEPARTCODE = d.CO_DEPARTCODE  ';
    stSql := stSql + ' AND d.CO_GUBUN = ''2'')  ';
    stSql := stSql + ' LEFT JOIN TB_POSI e  ';
    stSql := stSql + ' ON (a.GROUP_CODE = e.GROUP_CODE  ';
    stSql := stSql + ' AND a.PO_POSICODE = e.PO_POSICODE)  ';
    stSql := stSql + ' Left Join TB_FOODGRADE b ';
    stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
    stSql := stSql + ' AND a.EM_CODE = b.EM_CODE)';
    if (SearchItem <> '') then stSql := stSql + ' WHERE ' + SearchItem;
    stSql := stSql + ' ORDER BY a.CO_COMPANYCODE, a.CO_DEPARTCODE, a.EM_CODE ';
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
          cells[0,nRow] := FindField('COMPANY_NAME').AsString;
          cells[1,nRow] := FindField('DEPART_NAME').AsString;
          cells[2,nRow] := FindField('EM_CODE').AsString;
          cells[3,nRow] := FindField('EM_NAME').AsString;
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
 {         if FindField('FO_MONEY').AsString = 'Y' then  AddCheckBox(16,nRow,True,False)
          else AddCheckBox(16,nRow,False,False); }
          cells[17,nRow] := FindField('CO_COMPANYCODE').AsString;
          cells[18,nRow] := FindField('CO_DEPARTCODE').AsString;
        end;
        nRow := nRow + 1;
        Next;
      end;
    end;
end;

procedure TfmFoodGradeAdmin.sgCardGridInit(sg: TAdvStringGrid; aCol: integer);
var
  i:integer;
begin
  with sg do
  begin
    RowCount := 3;
    for i:=1 to 2 do
    begin
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
      RemoveCheckBox(18,i);
    end;
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
    AddCheckBox(18,1,False,False);
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

procedure TfmFoodGradeAdmin.sg_CardCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
  if ARow = 1 then //전체선택 또는 해제
  begin
    AdvStrinGridSetAllCheck(Sender,ACol,State);
  end;
end;

procedure TfmFoodGradeAdmin.AdvStrinGridSetAllCheck(Sender: TObject;
  aCol: integer; bchkState: Boolean);
var
  i : integer;
begin
    for i:= 2 to (Sender as TAdvStringGrid).RowCount - 1  do
    begin
      (Sender as TAdvStringGrid).SetCheckBoxState(aCol,i,bchkState);
    end;
end;

procedure TfmFoodGradeAdmin.btn_saveClick(Sender: TObject);
var
  i : integer;
  stCO_CODE,stID_NO:string;
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
      stCO_CODE := Cells[18,i];
      stID_NO := Cells[3,i];
      GetCheckBoxState(5,i, bchkState);
      if bchkState then stBREAKFIRST := 'Y'
      else stBREAKFIRST := 'N';
      GetCheckBoxState(6,i, bchkState);
      if bchkState then stLUNCH := 'Y'
      else stLUNCH := 'N';
      GetCheckBoxState(7,i, bchkState);
      if bchkState then stDINNER := 'Y'
      else stDINNER := 'N';
      GetCheckBoxState(8,i, bchkState);
      if bchkState then stMIDNIGHT := 'Y'
      else stMIDNIGHT := 'N';

      GetCheckBoxState(9,i, bchkState);
      if bchkState then stWEBREAKFIRST := 'Y'
      else stWEBREAKFIRST := 'N';
      GetCheckBoxState(10,i, bchkState);
      if bchkState then stWELUNCH := 'Y'
      else stWELUNCH := 'N';
      GetCheckBoxState(11,i, bchkState);
      if bchkState then stWEDINNER := 'Y'
      else stWEDINNER := 'N';
      GetCheckBoxState(12,i, bchkState);
      if bchkState then stWEMIDNIGHT := 'Y'
      else stWEMIDNIGHT := 'N';

      GetCheckBoxState(13,i, bchkState);
      if bchkState then stHOBREAKFIRST := 'Y'
      else stHOBREAKFIRST := 'N';
      GetCheckBoxState(14,i, bchkState);
      if bchkState then stHOLUNCH := 'Y'
      else stHOLUNCH := 'N';
      GetCheckBoxState(15,i, bchkState);
      if bchkState then stHODINNER := 'Y'
      else stHODINNER := 'N';
      GetCheckBoxState(16,i, bchkState);
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
      GetCheckBoxState(17,i, bchkState);
      if bchkState then stMoney := 'Y'
      else stMoney := 'N';   

      if Not InsertTB_FOODGRADE(
        stCO_CODE,
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
        UpdateTB_FOODGRADE(
        stCO_CODE,
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

function TfmFoodGradeAdmin.InsertTB_FOODGRADE(stCO_CODE,
  stID_NO, stBREAKFIRST, stLUNCH, stDINNER, stMIDNIGHT,
  stWEBREAKFIRST,stWELUNCH,stWEDINNER,stWEMIDNIGHT,stHOBREAKFIRST,stHOLUNCH,
  stHODINNER,stHOMIDNIGHT,{stWEEK, stWEEKEND,stHOLIDAY,}
  stMoney: string): Boolean;
var
  stSql :string;
begin
  result := False;
  stSql := 'Insert Into TB_FOODGRADE(';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'CO_COMPANYCODE,';
  stSql := stSql + 'EM_CODE,';
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
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + stCO_CODE + ''',';
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

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmFoodGradeAdmin.UpdateTB_FOODGRADE(stCO_CODE,
  stID_NO, stBREAKFIRST, stLUNCH, stDINNER, stMIDNIGHT,
  stWEBREAKFIRST,stWELUNCH,stWEDINNER,stWEMIDNIGHT,stHOBREAKFIRST,stHOLUNCH,
  stHODINNER,stHOMIDNIGHT,{stWEEK, stWEEKEND,stHOLIDAY,}
  stMoney: string): Boolean;
var
  stSql :string;
begin
  result := False;
  stSql := 'update TB_FOODGRADE set ';
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
  stSql := stSql + ' where GROUP_CODE =''' + GROUPCODE + '''';
  stSql := stSql + ' AND CO_COMPANYCODE=''' + stCO_CODE + '''';
  stSql := stSql + ' AND EM_CODE=''' + stID_NO + '''';

  result := DataModule1.ProcessExecSQL(stSql);

end;

procedure TfmFoodGradeAdmin.sgCardGridHeaderSet(sg: TAdvStringGrid);
begin
  with sg do
  begin
    Clear;
    MergeCells(0,0,1,2);
    Cells[0,0] := '회사명';
    MergeCells(1,0,1,2);
    Cells[1,0] := '지점명';
    MergeCells(2,0,1,2);
    Cells[2,0] := '부서명';
    MergeCells(3,0,1,2);
    Cells[3,0] := '사원번호';
    MergeCells(4,0,1,2);
    Cells[4,0] := '이름';
    MergeCells(5,0,4,1);
    Cells[5,0] := '주중';
    MergeCells(9,0,4,1);
    Cells[9,0] := '주말';
    MergeCells(13,0,4,1);
    Cells[13,0] := '공휴일';
//    MergeCells(16,0,1,2);
//    Cells[16,0] := '미납구분';
    Cells[5,1] := '조식';
    Cells[6,1] := '중식';
    Cells[7,1] := '석식';
    Cells[8,1] := '야식';
    Cells[9,1] := '조식';
    Cells[10,1] := '중식';
    Cells[11,1] := '석식';
    Cells[12,1] := '야식';
    Cells[13,1] := '조식';
    Cells[14,1] := '중식';
    Cells[15,1] := '석식';
    Cells[16,1] := '야식';
    Cells[17,1] := '미납';
  end;
end;

procedure TfmFoodGradeAdmin.sg_CardGetAlignment(Sender: TObject; ARow,
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

procedure TfmFoodGradeAdmin.CommandArrayCommandsTCommand0Execute(
  Command: TCommand; Params: TStringList);
begin
//
end;

procedure TfmFoodGradeAdmin.FormActivate(Sender: TObject);
var
  nIndex : integer;
begin
  LoadCompanyCode(CompanyCodeList,cmb_Company);
  LoadJijumCode('',JijumCodeList,cmb_Jijum);
  LoadDepartCode('','',DepartCodeList,cmb_Depart);

  if Not IsMaster then
  begin
    if strtoint(CompanyGrade) > 1 then
    begin
      nIndex := CompanyCodeList.IndexOf(MasterCompany);
      if nIndex > -1 then
      begin
        cmb_Company.ItemIndex := nIndex;
        LoadJijumCode(CompanyCodeList.Strings[nIndex],JijumCodeList,cmb_Jijum);
      end;
      cmb_Company.Enabled := False;
      LoadPosiCode(MasterCompany,PosiCodeList,cmb_Posi);
    end;
    if strtoint(CompanyGrade) > 2 then
    begin
      nIndex := JijumCodeList.IndexOf(MasterCompany + MasterJijum);
      if nIndex > -1 then cmb_Jijum.ItemIndex := nIndex;
      cmb_Jijum.Enabled := False;
    end;
  end;
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);

  btnSearchClick(btnSearch);
end;

procedure TfmFoodGradeAdmin.SearchFoodAdmin(aCode: string);
var
  stCompanyCode,stJijumCode,stDepartCode,stPosiCode:string;
  stName,stEmCode,stNonPay : string;
  stSql : string;
  nRow : integer;
  i : integer;
begin
  sgCardGridInit(sg_Card,18);
  stCompanyCode := '';
  stJijumCode := '';
  stDepartCode := '';
  stPosiCode := '';
  stName := '';
  stEmCode := '';
  stNonPay := '';

   //미납구분
  if cb_Nonpay.ItemIndex = 1 then stNonPay := 'Y';

  if DBTYPE = 'MDB' then stSql :=  MDBSQL.SelectTB_EMPLOYEEJoinFOODGrade(stNonPay)
  else if DBTYPE = 'PG' then stSql := PostGreSQL.SelectTB_EMPLOYEEJoinFOODGrade(stNonPay)
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.SelectTB_EMPLOYEEJoinFOODGrade(stNonPay)
  else Exit;

  if (Not IsMaster) and (CompanyGrade <> '0') then
  begin
    if CompanyGrade = '1' then
    begin
      if cmb_Company.ItemIndex < 1 then
      begin
        if CompanyCodeList.Count < 2 then
        begin
          showmessage('관리할수 있는 회사 권한이 없습니다.');
          Exit;
        end;
        for i:= 1 to CompanyCodeList.Count - 1 do
        begin
          if i = 1 then stSql := stSql + ' AND ( '
          else stSql := stSql + ' OR ';
          stSql := stSql + ' a.CO_COMPANYCODE = ''' + CompanyCodeList.Strings[i] + ''' ';
        end;
        stSql := stSql + ')'; 
      end else stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + CompanyCodeList.Strings[cmb_Company.ItemIndex] + ''' ';
      if cmb_Jijum.ItemIndex > 0 then stSql := stSql + ' AND a.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3) + ''' ';
      if cmb_Depart.ItemIndex > 0 then stSql := stSql + ' AND a.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],7,3) + ''' ';
    end else if CompanyGrade = '2' then
    begin
      if cmb_Company.ItemIndex < 1 then
      begin
        showmessage('관리자 소속 회사코드가 이상합니다.');
        Exit;
      end;
      stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + CompanyCodeList.Strings[cmb_Company.ItemIndex] + ''' ';
      if cmb_Jijum.ItemIndex < 1 then
      begin
        if JijumCodeList.Count < 2 then
        begin
          showmessage('관리할수 있는 지점 권한이 없습니다.');
          Exit;
        end;
        for i:= 1 to JijumCodeList.Count - 1 do
        begin
          if i = 1 then stSql := stSql + ' AND ( '
          else stSql := stSql + ' OR ';
          stSql := stSql + ' a.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[i],4,3) + ''' ';
        end;
        stSql := stSql + ')';
      end else stSql := stSql + ' AND a.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3) + ''' ';
      if cmb_Depart.ItemIndex > 0 then stSql := stSql + ' AND a.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],7,3) + ''' ';
    end else if CompanyGrade = '3' then
    begin
      if cmb_Company.ItemIndex < 1 then
      begin
        showmessage('관리자 소속 회사코드가 이상합니다.');
        Exit;
      end;
      stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + CompanyCodeList.Strings[cmb_Company.ItemIndex] + ''' ';
      if cmb_Jijum.ItemIndex < 1 then
      begin
        showmessage('관리자 소속 지점코드가 이상합니다.');
        Exit;
      end;
      stSql := stSql + ' AND a.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3) + ''' ';
      if cmb_Depart.ItemIndex < 1 then
      begin
        if DepartCodeList.Count < 2 then
        begin
          showmessage('관리할수 있는 부서 권한이 없습니다.');
          Exit;
        end;
        for i:= 1 to DepartCodeList.Count - 1 do
        begin
          if i = 1 then stSql := stSql + ' AND ( '
          else stSql := stSql + ' OR ';
          stSql := stSql + ' a.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[i],7,3) + ''' ';
        end;
        stSql := stSql + ')';
      end else stSql := stSql + ' AND a.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],7,3) + ''' '; 
    end;
  end else
  begin
    if cmb_Depart.ItemIndex > 0 then
    begin
      stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],1,3) + ''' ' ;
      stSql := stSql + ' AND a.CO_JIJUMCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],4,3) + ''' ' ;
      stSql := stSql + ' AND a.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],7,3) + ''' ' ;
    end else if cmb_Jijum.ItemIndex > 0 then
    begin
      stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3) + ''' ' ;
      stSql := stSql + ' AND a.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3) + ''' ' ;
    end else if cmb_Company.ItemIndex > 0 then
    begin
      stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + CompanyCodeList.Strings[cmb_Company.ItemIndex] + ''' ' ;
    end;
  end;

  if cmb_Posi.ItemIndex > 0 then
    stSql := stSql + ' AND a.PO_POSICODE = ''' + copy(PosiCodeList.Strings[cmb_Posi.ItemIndex],4,3) + ''' ';
  if Trim(ed_empNo.Text) <> '' then
    stSql := stSql + ' AND a.EM_CODE = ''' + Trim(ed_empNo.Text)  + ''' ';
  if Trim(ed_name.Text) <> '' then
    stSql := stSql + ' AND a.EM_NAME LIKE ''%' + Trim(ed_name.Text)  + '%'' ';

  stSql := stSql + ' ORDER BY a.CO_COMPANYCODE,a.CO_JIJUMCODE, a.CO_DEPARTCODE, a.EM_CODE ';

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

    if recordCount < 1 then
    begin
      showmessage('조회할 자료가 없습니다.');
      Exit;
    end;
    First;
    sg_Card.RowCount := recordCount + 2;
    nRow := 2;

    While Not Eof do
    begin
      with sg_Card do
      begin
        cells[0,nRow] := FindField('COMPANY_NAME').AsString;
        cells[1,nRow] := FindField('JIJUM_NAME').AsString;
        cells[2,nRow] := FindField('DEPART_NAME').AsString;
        cells[3,nRow] := FindField('EM_CODE').AsString;
        cells[4,nRow] := FindField('EM_NAME').AsString;
        if FindField('FO_BREAKFIRST').AsString = 'Y' then  AddCheckBox(5,nRow,True,False)
        else AddCheckBox(5,nRow,False,False);
        if FindField('FO_LUNCH').AsString = 'Y' then  AddCheckBox(6,nRow,True,False)
        else AddCheckBox(6,nRow,False,False);
        if FindField('FO_DINNER').AsString = 'Y' then  AddCheckBox(7,nRow,True,False)
        else AddCheckBox(7,nRow,False,False);
        if FindField('FO_MIDNIGHT').AsString = 'Y' then  AddCheckBox(8,nRow,True,False)
        else AddCheckBox(8,nRow,False,False);

        if FindField('FO_WEBREAKFIRST').AsString = 'Y' then  AddCheckBox(9,nRow,True,False)
        else AddCheckBox(9,nRow,False,False);
        if FindField('FO_WELUNCH').AsString = 'Y' then  AddCheckBox(10,nRow,True,False)
        else AddCheckBox(10,nRow,False,False);
        if FindField('FO_WEDINNER').AsString = 'Y' then  AddCheckBox(11,nRow,True,False)
        else AddCheckBox(11,nRow,False,False);
        if FindField('FO_WEMIDNIGHT').AsString = 'Y' then  AddCheckBox(12,nRow,True,False)
        else AddCheckBox(12,nRow,False,False);

        if FindField('FO_HOBREAKFIRST').AsString = 'Y' then  AddCheckBox(13,nRow,True,False)
        else AddCheckBox(13,nRow,False,False);
        if FindField('FO_HOLUNCH').AsString = 'Y' then  AddCheckBox(14,nRow,True,False)
        else AddCheckBox(14,nRow,False,False);
        if FindField('FO_HODINNER').AsString = 'Y' then  AddCheckBox(15,nRow,True,False)
        else AddCheckBox(15,nRow,False,False);
        if FindField('FO_HOMIDNIGHT').AsString = 'Y' then  AddCheckBox(16,nRow,True,False)
        else AddCheckBox(16,nRow,False,False);

    {    if FindField('FO_WEEK').AsString = 'Y' then  AddCheckBox(8,nRow,True,False)
        else AddCheckBox(8,nRow,False,False);
        if FindField('FO_WEEKEND').AsString = 'Y' then  AddCheckBox(9,nRow,True,False)
        else AddCheckBox(9,nRow,False,False);
        if FindField('FO_HOLIDAY').AsString = 'Y' then  AddCheckBox(10,nRow,True,False)
        else AddCheckBox(10,nRow,False,False);}
        if FindField('FO_MONEY').AsString = 'Y' then  AddCheckBox(17,nRow,True,False)
        else AddCheckBox(17,nRow,False,False);
        cells[18,nRow] := FindField('CO_COMPANYCODE').AsString;
        cells[19,nRow] := FindField('CO_DEPARTCODE').AsString;
      end;
      nRow := nRow + 1;
      Next;
    end;
  end;
end;

procedure TfmFoodGradeAdmin.cmb_CompanyChange(Sender: TObject);
begin
  LoadJijumCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],JijumCodeList,cmb_Jijum);
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
  LoadPosiCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],PosiCodeList,cmb_Posi);
  btnSearchClick(Self);

end;

procedure TfmFoodGradeAdmin.cmb_JijumChange(Sender: TObject);
begin
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
  btnSearchClick(Self);

end;

procedure TfmFoodGradeAdmin.cmb_DepartChange(Sender: TObject);
begin
  btnSearchClick(Self);

end;

procedure TfmFoodGradeAdmin.cmb_PosiChange(Sender: TObject);
begin
  btnSearchClick(Self);

end;

procedure TfmFoodGradeAdmin.cb_NonPayChange(Sender: TObject);
begin
  btnSearchClick(Self);
end;

initialization
  RegisterClass(TfmFoodGradeAdmin);
Finalization
  UnRegisterClass(TfmFoodGradeAdmin);

end.
