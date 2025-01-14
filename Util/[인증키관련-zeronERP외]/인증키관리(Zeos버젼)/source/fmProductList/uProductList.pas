unit uProductList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, Gauges, ExtCtrls, Grids, AdvObj,
  BaseGrid, AdvGrid, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  uSubForm, CommandArray, Menus;

type
  TfmProductList = class(TfmASubForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label9: TLabel;
    Label4: TLabel;
    btn_Close: TSpeedButton;
    btn_Excel: TSpeedButton;
    btn_Search: TBitBtn;
    cmb_GoodsList: TComboBox;
    cmb_inOut: TComboBox;
    dt_FromDate: TDateTimePicker;
    dt_toDate: TDateTimePicker;
    GroupBox2: TGroupBox;
    btn_ProductCreat: TSpeedButton;
    btn_ProductOut: TSpeedButton;
    btn_ProductSummary: TSpeedButton;
    sg_List: TAdvStringGrid;
    pan_gauge: TPanel;
    lb_Message: TLabel;
    Gauge1: TGauge;
    TempQuery: TZQuery;
    pm_Menu: TPopupMenu;
    mn_03: TMenuItem;
    mn_04: TMenuItem;
    mn_01: TMenuItem;
    mn_11: TMenuItem;
    mn_13: TMenuItem;
    mn_14: TMenuItem;
    mn_21: TMenuItem;
    mn_23: TMenuItem;
    mn_24: TMenuItem;
    mn_31: TMenuItem;
    mn_33: TMenuItem;
    mn_34: TMenuItem;
    mn_02: TMenuItem;
    mn_12: TMenuItem;
    mn_22: TMenuItem;
    mn_32: TMenuItem;
    mn_41: TMenuItem;
    mn_42: TMenuItem;
    SummaryQuery: TZQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_CloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure sg_ListMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sg_ListClick(Sender: TObject);
    procedure btn_ProductCreatClick(Sender: TObject);
    procedure btn_ProductOutClick(Sender: TObject);
    procedure mn_01Click(Sender: TObject);
    procedure mn_02Click(Sender: TObject);
    procedure mn_03Click(Sender: TObject);
    procedure mn_04Click(Sender: TObject);
    procedure mn_12Click(Sender: TObject);
    procedure mn_41Click(Sender: TObject);
    procedure mn_22Click(Sender: TObject);
    procedure mn_42Click(Sender: TObject);
    procedure mn_32Click(Sender: TObject);
    procedure mn_23Click(Sender: TObject);
    procedure mn_24Click(Sender: TObject);
    procedure btn_ProductSummaryClick(Sender: TObject);
    procedure sg_ListDblClick(Sender: TObject);
  private
    GoodsList : TStringList;
    { Private declarations }
    procedure LoadGoodsList;
    procedure SearchList(aCode: string = '';aTopRow:integer=0);
    Function GetProductCount(aDate,aSeq:string):integer;
    Function GetCompleteProductCount(aDate,aSeq:string):integer;
    Function GetTB_PRODUCTLIST_ProductCreateCount(aCode:string):integer;
    Function GetTB_PRODUCTLIST_ProductCompleteCount(aCode:string):integer;
    Function GetTB_PRODUCTLIST_DeliveryCreateCount(aCode:string):integer;
    Function GetTB_PRODUCTLIST_DeliveryCompleteCount(aCode:string):integer;
    Function CheckTB_CONFIG_Value(aCode : string):string;
    Function ProductSummary:Boolean;
    Function ProductCodeSummary(aCode : string):Boolean;
  private
    Function UpdateTB_PRODUCTLIST_RequestConfirm(aDate,aSeq,aValue,aConfirmID:string):Boolean;
    function UpdateTB_PRODUCTLIST_Complete(aDate,aSeq,aValue:string):Boolean;
    Function DeleteTB_PRODUCTLIST_Key(aDate,aSeq:string):Boolean;
    Function UpdateTB_PRODUCTLIST_ActionConfirm(aDate,aSeq,aValue,aComplete,aConfirmID:string):Boolean;
    Function InsertIntoTB_PRODUCTSUM(aCode,aProductCreate,aProductComplete,aDeliveryCreate,aDeliveryComplete,aProductStoreCount:string):Boolean;
    Function DeleteTB_PRODUCTSUM_All:Boolean;
  public
    { Public declarations }
  end;

var
  fmProductList: TfmProductList;

implementation
uses
  uDataModule,
  uLomosUtil, uProductCreateRequest, uProductSummary;
{$R *.dfm}

procedure TfmProductList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  GoodsList.Free;
  Action := caFree;
end;

procedure TfmProductList.btn_CloseClick(Sender: TObject);
begin
  close;
end;

procedure TfmProductList.LoadGoodsList;
var
  stSql : string;
  stGroupCode : string;
begin
  cmb_GoodsList.Clear;
  GoodsList.Clear;
  cmb_GoodsList.Items.Add('전체');
  cmb_GoodsList.ItemIndex := 0;
  GoodsList.Add('');
  
  stSql := 'select * from TB_GOODSLIST ';
  stSql := stSql + ' Where GL_PRODUCTGUBUN = 1 ';
  stSql := stSql + ' Order by GL_CODE ';
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
      GoodsList.Add(FindField('GL_CODE').AsString);
      cmb_GoodsList.Items.Add(FindField('GL_NAME').AsString);
      Next;
    end;
  end;

end;

procedure TfmProductList.FormCreate(Sender: TObject);
begin
  GoodsList := TStringList.Create;
  LoadGoodsList;
  dt_FromDate.Date := Now - 31;
  dt_toDate.Date := Now;
  SearchList;
  if Master_COMPANYCODE = '00001' then
  begin
    btn_ProductCreat.Enabled := True;
    btn_ProductOut.Enabled := True;
  end;
end;

procedure TfmProductList.btn_SearchClick(Sender: TObject);
begin
  SearchList;
end;

procedure TfmProductList.SearchList(aCode: string = '';aTopRow:integer=0);
var
  stSql : string;
  stName : string;
  nRow : integer;
begin
  GridInit(sg_List,8);
  stSql := 'Select a.*,b.GL_NAME from TB_PRODUCTLIST a ';
  stSql := stSql + ' Left Join TB_GOODSLIST b ';
  stSql := stSql + ' ON (a.GL_CODE = b.GL_CODE ) ';
  stSql := stSql + ' Where a.PL_DATE BETWEEN ''' + FormatDateTime('yyyymmdd',dt_FromDate.Date) + ''' AND ''' + FormatDateTime('yyyymmdd',dt_toDate.Date) + ''' ';
  if cmb_GoodsList.ItemIndex > 0 then
  begin
    stSql := stSql + ' AND a.GL_CODE = ''' + GoodsList.Strings[cmb_GoodsList.ItemIndex] + ''' ';
  end;
  if cmb_inOut.ItemIndex > 0 then
  begin
    stSql := stSql + ' AND a.PL_GUBUN = ''' + inttostr(cmb_inOut.ItemIndex) + ''' ';
  end;
  stSql := stSql + ' order by a.PL_DATE DESC,a.PL_SEQ DESC';

  with sg_List do
  begin
    with TempQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if recordCount = 0 then Exit;
      nRow :=1 ;
      rowCount := recordCount + 1;
      While Not Eof do
      begin
{날짜     0
구분      1
요청상태  2
실행상태  3
물품명    4
갯수      5
고객사    6
비고      7
순번      8
구분코드  9
요청상태코드 10
실행상태코드 11
물품코드     12
요청자아이디 13
확인자아이디 14
요청시간     15
확인시간     16
주소         17
전화번호     18
담당자       19
요청일       20
요청순번     21
완료유무     22
}
        cells[0,nRow] := DateType(FindField('PL_DATE').AsString);
        stName := '';
        if FindField('PL_GUBUN').AsString = '1' then stName := '생산'
        else if FindField('PL_GUBUN').AsString = '2' then stName := '출고';
        cells[1,nRow] := stName;
        stName := '';
        if FindField('PL_REQUEST').AsString = '1' then stName := '요청'
        else if FindField('PL_REQUEST').AsString = '2' then stName := '확인';
        cells[2,nRow] := stName;
        stName := '';
        if FindField('PL_ACTION').AsString = '1' then stName := cells[1,nRow] + '완료'
        else if FindField('PL_ACTION').AsString = '2' then stName := cells[1,nRow] + '확인';
        cells[3,nRow] := stName;
        cells[4,nRow] := FindField('GL_NAME').AsString;
        cells[5,nRow] := FindField('PL_COUNT').AsString;
        cells[6,nRow] := FindField('PL_CUSTOMERNAME').AsString;
        cells[7,nRow] := FindField('PL_BIGO').AsString;
        cells[8,nRow] := FindField('PL_SEQ').AsString;
        cells[9,nRow] := FindField('PL_GUBUN').AsString;
        cells[10,nRow] := FindField('PL_REQUEST').AsString;
        cells[11,nRow] := FindField('PL_ACTION').AsString;
        cells[12,nRow] := FindField('GL_CODE').AsString;
        cells[13,nRow] := FindField('PL_REQUESTID').AsString;
        cells[14,nRow] := FindField('PL_CONFIRMID').AsString;
        cells[15,nRow] := FindField('PL_REQUESTTIME').AsString;
        cells[16,nRow] := FindField('PL_CONFIRMTIME').AsString;
        cells[17,nRow] := FindField('PL_ADDRESS').AsString;
        cells[18,nRow] := FindField('PL_TELNUMBER').AsString;
        cells[19,nRow] := FindField('PL_MANAGER').AsString;
        cells[20,nRow] := FindField('PL_REQUESTDATE').AsString;
        cells[21,nRow] := FindField('PL_REQUESTSEQ').AsString;
        cells[22,nRow] := FindField('PL_COMPLETE').AsString;

        case FindField('PL_GUBUN').AsString[1] of
          '1' : begin
            if FindField('PL_REQUEST').AsString = '1' then RowColor[nRow] := clYellow
            else if FindField('PL_REQUEST').AsString = '2' then RowColor[nRow] := $00FFFFCC
            else if FindField('PL_ACTION').AsString = '1' then RowColor[nRow] := $00B99D00
            else if FindField('PL_ACTION').AsString = '2' then RowColor[nRow] := $00FFFFCC;
          end;
          '2' : begin
            if FindField('PL_REQUEST').AsString = '1' then RowColor[nRow] := $00B99D7F
            else if FindField('PL_REQUEST').AsString = '2' then RowColor[nRow] := 16769216
            else if FindField('PL_ACTION').AsString = '1' then RowColor[nRow] := $00B9007F
            else if FindField('PL_ACTION').AsString = '2' then RowColor[nRow] := 16769216;
          end;
          else begin
            RowColor[nRow] := clWhite;
          end;
        end;
        if cells[22,nRow] = 'Y' then RowColor[nRow] := clWhite;
        
        if aCode = cells[0,nRow] + cells[8,nRow] then
        begin
          SelectRows(nRow,1);
        end;
        inc(nRow);
        Next;
      end;
      if aTopRow <> 0 then TopRow := aTopRow;
    end;
  end;
end;

procedure TfmProductList.sg_ListMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  nCol,nRow : integer;
begin
  inherited;
  Try
    TAdvStringGrid(Sender).MouseToCell(X,Y,nCol,nRow);
    TAdvStringGrid(Sender).SelectRows(nRow,1);
    if Button = mbRight then
    begin
      sg_ListClick(sender);
    end;
  Except
    sg_List.PopupMenu := nil;
    Exit;
  End;
end;

procedure TfmProductList.sg_ListClick(Sender: TObject);
begin
  inherited;
  Try
    with sg_List do
    begin
      if cells[8,Row] = '' then
      begin
        PopupMenu := nil;
        Exit;
      end else PopupMenu := pm_Menu;

      mn_01.Visible := False;  //생산요청삭제
      mn_02.Visible := False;  //생산요청수정
      mn_03.Visible := False;  //생산요청확인
      mn_04.Visible := False;  //생산요청확인취소
      mn_11.Visible := False;  //출고요청삭제
      mn_12.Visible := False;  //출고요청수정
      mn_13.Visible := False;  //출고요청확인
      mn_14.Visible := False;  //출고요청확인취소
      mn_21.Visible := False;  //생산완료삭제
      mn_22.Visible := False;  //생산완료수정
      mn_23.Visible := False;  //생산완료확인
      mn_24.Visible := False;  //생산완료확인취소
      mn_31.Visible := False;  //출고완료삭제
      mn_32.Visible := False;  //출고완료수정
      mn_33.Visible := False;  //출고완료확인
      mn_34.Visible := False;  //출고완료확인취소
      mn_41.Visible := False;  //생산완료
      mn_42.Visible := False;  //출고완료

      if cells[9,Row] = '1' then   //생산
      begin
        if cells[10,Row] = '1' then //요청
        begin
          if Master_ID = cells[13,Row] then //요청자 아이디이면
          begin
            mn_01.Visible := True;  //생산요청삭제
            mn_02.Visible := True;  //생산요청수정
          end else if Master_COMPANYCODE = '00031' then //애드콘이면
          begin
            mn_03.Visible := True;  //생산요청확인
          end else
          begin
            PopupMenu := nil;
          end;
        end else if cells[10,Row] = '2' then //확인
        begin
          PopupMenu := nil;
          if Master_ID = cells[14,Row] then //확인자 아이디이면
          begin
            if cells[22,Row] = 'N' then  //생산 들어 간게 없으면
            begin
              mn_04.Visible := True;  //생산요청확인취소
              PopupMenu := pm_Menu;
            end;
          end;
          if Master_COMPANYCODE = '00031' then //애드콘이면
          begin
            if cells[22,Row] <> 'Y' then  //생산 할것이 남아 있으면
            begin
              mn_41.Visible := True;  //생산완료
              PopupMenu := pm_Menu;
            end;
          end;
        end else if cells[11,Row] = '1' then //생산완료
        begin
          if Master_ID = cells[13,Row] then //완료자 아이디이면
          begin
            mn_21.Visible := True;  //생산완료삭제
            mn_22.Visible := True;  //생산완료수정
          end else if Master_COMPANYCODE = '00001' then //제론이면
          begin
            mn_23.Visible := True;  //생산완료확인
          end else
          begin
            PopupMenu := nil;
          end;
        end else if cells[11,Row] = '2' then //생산완료확인 중이면
        begin
          if Master_ID = cells[14,Row] then //완료확인자 아이디이면
          begin
            mn_24.Visible := True;  //생산완료확인취소
          end else
          begin
            PopupMenu := nil;
          end;
        end;
      end else if cells[9,Row] = '2' then //출고
      begin
        if cells[10,Row] = '1' then //출고요청
        begin
          if Master_ID = cells[13,Row] then //요청자 아이디이면
          begin
            mn_11.Visible := True;  //출고요청삭제
            mn_12.Visible := True;  //출고요청수정
          end else if Master_COMPANYCODE = '00031' then //애드콘이면
          begin
            mn_13.Visible := True;  //출고요청확인
          end else
          begin
            PopupMenu := nil;
          end;
        end else if cells[10,Row] = '2' then //출고요청확인중이면
        begin
          PopupMenu := nil;
          if Master_ID = cells[14,Row] then //확인자 아이디이면
          begin
            if cells[22,Row] = 'N' then  //출고 들어 간게 없으면
            begin
              mn_14.Visible := True;  //출고요청확인취소
              PopupMenu := pm_Menu;
            end;
          end;
          if Master_COMPANYCODE = '00031' then //애드콘이면
          begin
            if cells[22,Row] <> 'Y' then  //출고 할게 남아 있으면
            begin
              mn_42.Visible := True;  //출고완료
              PopupMenu := pm_Menu;
            end;
          end;
        end else if cells[11,Row] = '1' then //출고완료
        begin
          if Master_ID = cells[13,Row] then //완료자 아이디이면
          begin
            mn_31.Visible := True;  //출고완료삭제
            mn_32.Visible := True;  //출고완료수정
          end else if Master_COMPANYCODE = '00001' then //제론이면
          begin
            mn_33.Visible := True;  //출고완료확인
          end else
          begin
            PopupMenu := nil;
          end;
        end else if cells[11,Row] = '2' then //확인
        begin
          if Master_ID = cells[14,Row] then //완료확인자 아이디이면
          begin
            mn_34.Visible := True;  //출고완료확인취소
          end else
          begin
            PopupMenu := nil;
          end;
        end;
      end;
    end;
  Except
    PopupMenu := nil;
    Exit;
  End;
end;

procedure TfmProductList.btn_ProductCreatClick(Sender: TObject);
begin
  inherited;
  fmProductCreateRequest:= TfmProductCreateRequest.Create(Self);
  fmProductCreateRequest.InPutType := 'ProductCreate';
  fmProductCreateRequest.SHowmodal;
  fmProductCreateRequest.Free;
  SearchList;
end;

procedure TfmProductList.btn_ProductOutClick(Sender: TObject);
begin
  inherited;
  fmProductCreateRequest:= TfmProductCreateRequest.Create(Self);
  fmProductCreateRequest.InPutType := 'DeliveryCreate';
  fmProductCreateRequest.SHowmodal;
  fmProductCreateRequest.Free;
  SearchList;
end;

procedure TfmProductList.mn_01Click(Sender: TObject);
var
  stDate : string;
  stSeq : string;
  nOrgCount : integer;
  nCompleteCount : integer;
begin
  inherited;
  with sg_List do
  begin
    stDate := cells[0,Row];
    stDate := StringReplace(stDate,'-','',[rfReplaceAll]);
    stDate := StringReplace(stDate,' ','',[rfReplaceAll]);
    stDate := StringReplace(stDate,':','',[rfReplaceAll]);
    stSeq := cells[8,Row];

    DeleteTB_PRODUCTLIST_Key(stDate,stSeq);
    if cells[3,Row] <> '' then  //요청이 아닌 실행 삭제 이면
    begin
      nOrgCount := GetProductCount(cells[20,Row],cells[21,Row]);
      nCompleteCount := GetCompleteProductCount(cells[20,Row],cells[21,Row]);
      if nOrgCount = nCompleteCount  then
      begin
        UpdateTB_PRODUCTLIST_Complete(cells[20,Row],cells[21,Row],'Y');
      end else if nCompleteCount = 0 then
      begin
        UpdateTB_PRODUCTLIST_Complete(cells[20,Row],cells[21,Row],'N');
      end else
      begin
        UpdateTB_PRODUCTLIST_Complete(cells[20,Row],cells[21,Row],'R');
      end;
    end;
    dmDB.UpdateTB_CONFIG('PRODUCTSUM','N');
  end;
  SearchList;
end;

function TfmProductList.DeleteTB_PRODUCTLIST_Key(aDate,
  aSeq: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Delete From TB_PRODUCTLIST ';
  stSql := stSql + ' Where PL_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND PL_SEQ = ' + aSeq + ' ';

  result := dmDB.ProcessExecSQL(stSql);
end;

procedure TfmProductList.mn_02Click(Sender: TObject);
var
  stDate : string;
  stSeq : string;
begin
  inherited;
{날짜  : 0
구분   : 1
요청상태 : 2
실행상태 : 3
물품명   : 4
갯수     : 5
고객사   : 6
비고     : 7
순번     : 8
구분코드   : 9
요청상태코드  : 10
실행상태코드  : 11
물품코드      : 12
요청자아이디  : 13
확인자아이디  : 14
요청시간      : 15
확인시간      : 16
주소          : 17
전화번호      : 18
담당자        : 19
요청일        : 20
요청순번      : 21
완료유무      : 22
}
  fmProductCreateRequest:= TfmProductCreateRequest.Create(Self);
  Try
    with sg_List do
    begin
      stDate := cells[0,Row];
      stDate := StringReplace(stDate,'-','',[rfReplaceAll]);
      stDate := StringReplace(stDate,' ','',[rfReplaceAll]);
      stDate := StringReplace(stDate,':','',[rfReplaceAll]);
      stSeq := cells[8,Row];

      fmProductCreateRequest.InPutType := 'ProductUpdate';
      fmProductCreateRequest.KeyDate := stDate;
      fmProductCreateRequest.KeySeq := stSeq;
      fmProductCreateRequest.aGubun := cells[9,Row];
      fmProductCreateRequest.aRequest := cells[10,Row];
      fmProductCreateRequest.aGoodCode := cells[12,Row];
      fmProductCreateRequest.ed_Count.Text := cells[5,Row];
      fmProductCreateRequest.mem_Bigo.text := cells[7,Row];
    end;
    fmProductCreateRequest.SHowmodal;
  Finally
    fmProductCreateRequest.Free;
  End;
  SearchList(stDate + stSeq,sg_List.TopRow);
end;

procedure TfmProductList.mn_03Click(Sender: TObject);
var
  stDate : string;
  stSeq : string;
begin
  inherited;
  with sg_List do
  begin
    stDate := cells[0,Row];
    stDate := StringReplace(stDate,'-','',[rfReplaceAll]);
    stDate := StringReplace(stDate,' ','',[rfReplaceAll]);
    stDate := StringReplace(stDate,':','',[rfReplaceAll]);
    stSeq := cells[8,Row];

    UpdateTB_PRODUCTLIST_RequestConfirm(stDate,stSeq,'2',MASTER_ID);
    dmDB.UpdateTB_CONFIG('PRODUCTSUM','N');
  end;
  SearchList(stDate + stSeq,sg_List.TopRow);

end;

function TfmProductList.UpdateTB_PRODUCTLIST_RequestConfirm(aDate, aSeq,
  aValue,aConfirmID: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_PRODUCTLIST set PL_REQUEST = ''' + aValue + ''', ';
  stSql := stSql + ' PL_CONFIRMID = ''' + aConfirmID + ''' ';
  stSql := stSql + ' Where PL_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND PL_SEQ = ' + aSeq + ' ';
   
  result := dmDB.ProcessExecSQL(stSql);
end;

procedure TfmProductList.mn_04Click(Sender: TObject);
var
  stDate : string;
  stSeq : string;
begin
  inherited;
  with sg_List do
  begin
    stDate := cells[0,Row];
    stDate := StringReplace(stDate,'-','',[rfReplaceAll]);
    stDate := StringReplace(stDate,' ','',[rfReplaceAll]);
    stDate := StringReplace(stDate,':','',[rfReplaceAll]);
    stSeq := cells[8,Row];

    UpdateTB_PRODUCTLIST_RequestConfirm(stDate,stSeq,'1','');
    dmDB.UpdateTB_CONFIG('PRODUCTSUM','N');
  end;
  SearchList(stDate + stSeq,sg_List.TopRow);

end;

procedure TfmProductList.mn_12Click(Sender: TObject);
var
  stDate : string;
  stSeq : string;
begin
  inherited;
{날짜  : 0
구분   : 1
요청상태 : 2
실행상태 : 3
물품명   : 4
갯수     : 5
고객사   : 6
비고     : 7
순번     : 8
구분코드   : 9
요청상태코드  : 10
실행상태코드  : 11
물품코드      : 12
요청자아이디  : 13
확인자아이디  : 14
요청시간      : 15
확인시간      : 16
주소          : 17
전화번호      : 18
담당자        : 19
요청일        : 20
요청순번      : 21
완료유무      : 22
}
  fmProductCreateRequest:= TfmProductCreateRequest.Create(Self);
  Try
    with sg_List do
    begin
      stDate := cells[0,Row];
      stDate := StringReplace(stDate,'-','',[rfReplaceAll]);
      stDate := StringReplace(stDate,' ','',[rfReplaceAll]);
      stDate := StringReplace(stDate,':','',[rfReplaceAll]);
      stSeq := cells[8,Row];

      fmProductCreateRequest.InPutType := 'DeliveryUpdate';
      fmProductCreateRequest.KeyDate := stDate;
      fmProductCreateRequest.KeySeq := stSeq;
      fmProductCreateRequest.aGubun := cells[9,Row];
      fmProductCreateRequest.aRequest := cells[10,Row];
      fmProductCreateRequest.aGoodCode := cells[12,Row];
      fmProductCreateRequest.ed_Count.Text := cells[5,Row];
      fmProductCreateRequest.ed_CustomerName.Text := cells[6,Row];
      fmProductCreateRequest.ed_Addr.Text := cells[17,Row];
      fmProductCreateRequest.ed_TelNumber.Text := cells[18,Row];
      fmProductCreateRequest.ed_CustomerManager.Text := cells[19,Row];
      fmProductCreateRequest.mem_Bigo.text := cells[7,Row];
    end;
    fmProductCreateRequest.SHowmodal;
  Finally
    fmProductCreateRequest.Free;
  End;
  SearchList(stDate + stSeq,sg_List.TopRow);
end;

procedure TfmProductList.mn_41Click(Sender: TObject);
var
  stDate : string;
  stSeq : string;
begin
  inherited;
  fmProductCreateRequest:= TfmProductCreateRequest.Create(Self);
  Try
    with sg_List do
    begin
      stDate := cells[0,Row];
      stDate := StringReplace(stDate,'-','',[rfReplaceAll]);
      stDate := StringReplace(stDate,' ','',[rfReplaceAll]);
      stDate := StringReplace(stDate,':','',[rfReplaceAll]);
      stSeq := cells[8,Row];

      fmProductCreateRequest.InPutType := 'ProductComplete';
      fmProductCreateRequest.KeyDate := stDate;
      fmProductCreateRequest.KeySeq := stSeq;
      fmProductCreateRequest.aGubun := cells[9,Row];
      fmProductCreateRequest.aRequest := cells[10,Row];
      fmProductCreateRequest.aGoodCode := cells[12,Row];
      fmProductCreateRequest.aRequestDate := stDate;
      fmProductCreateRequest.aRequestSeq := stSeq;
      fmProductCreateRequest.aRequestCount := cells[5,Row];
      fmProductCreateRequest.mem_Bigo.text := cells[7,Row];
    end;
    fmProductCreateRequest.SHowmodal;
  Finally
    fmProductCreateRequest.Free;
  End;
  SearchList(stDate + stSeq,sg_List.TopRow);
end;

function TfmProductList.GetProductCount(aDate, aSeq: string): integer;
var
  stSql : string;
begin
  result := 0;
  stSql := ' Select * from TB_PRODUCTLIST ';
  stSql := stSql + ' Where PL_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND PL_SEQ = ' + aSeq + ' ';

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
    result := FindField('PL_COUNT').AsInteger;
  end;
end;

function TfmProductList.GetCompleteProductCount(aDate,
  aSeq: string): integer;
var
  stSql : string;
begin
  result := 0;
  stSql := ' Select SUM(PL_COUNT) as COUNT from TB_PRODUCTLIST ';
  stSql := stSql + ' Where PL_REQUESTDATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND PL_REQUESTSEQ = ' + aSeq + ' ';

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
    result := FindField('COUNT').AsInteger;
  end;
end;

function TfmProductList.UpdateTB_PRODUCTLIST_Complete(aDate, aSeq,
  aValue: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_PRODUCTLIST Set ';
  stSql := stSql + ' PL_COMPLETE = ''' + aValue + ''' ';
  stSql := stSql + ' Where PL_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND PL_SEQ = ' + aSeq + ' ';

  result := dmDB.ProcessExecSQL(stSql);
end;

procedure TfmProductList.mn_22Click(Sender: TObject);
var
  stDate : string;
  stSeq : string;
begin
  inherited;
  fmProductCreateRequest:= TfmProductCreateRequest.Create(Self);
  Try
    with sg_List do
    begin
      stDate := cells[0,Row];
      stDate := StringReplace(stDate,'-','',[rfReplaceAll]);
      stDate := StringReplace(stDate,' ','',[rfReplaceAll]);
      stDate := StringReplace(stDate,':','',[rfReplaceAll]);
      stSeq := cells[8,Row];

      fmProductCreateRequest.InPutType := 'ProductCompleteUpdate';
      fmProductCreateRequest.KeyDate := stDate;
      fmProductCreateRequest.KeySeq := stSeq;
      fmProductCreateRequest.aGubun := cells[9,Row];
      fmProductCreateRequest.aRequest := cells[10,Row];
      fmProductCreateRequest.aAction := cells[11,Row];
      fmProductCreateRequest.aGoodCode := cells[12,Row];
      fmProductCreateRequest.aRequestDate := cells[20,Row];
      fmProductCreateRequest.aRequestSeq := cells[21,Row];
      fmProductCreateRequest.ed_Count.Text := cells[5,Row];
      fmProductCreateRequest.mem_Bigo.text := cells[7,Row];
    end;
    fmProductCreateRequest.SHowmodal;
  Finally
    fmProductCreateRequest.Free;
  End;
  SearchList(stDate + stSeq,sg_List.TopRow);
end;

procedure TfmProductList.mn_42Click(Sender: TObject);
var
  stDate : string;
  stSeq : string;
begin
  inherited;
  fmProductCreateRequest:= TfmProductCreateRequest.Create(Self);
  Try
    with sg_List do
    begin
      stDate := cells[0,Row];
      stDate := StringReplace(stDate,'-','',[rfReplaceAll]);
      stDate := StringReplace(stDate,' ','',[rfReplaceAll]);
      stDate := StringReplace(stDate,':','',[rfReplaceAll]);
      stSeq := cells[8,Row];

      fmProductCreateRequest.InPutType := 'DeliveryComplete';
      fmProductCreateRequest.KeyDate := stDate;
      fmProductCreateRequest.KeySeq := stSeq;
      fmProductCreateRequest.aGubun := cells[9,Row];
      fmProductCreateRequest.aRequest := cells[10,Row];
      fmProductCreateRequest.aGoodCode := cells[12,Row];
      fmProductCreateRequest.aRequestDate := stDate;
      fmProductCreateRequest.aRequestSeq := stSeq;
      fmProductCreateRequest.aRequestCount := cells[5,Row];
      fmProductCreateRequest.ed_CustomerName.Text := cells[6,Row];
      fmProductCreateRequest.ed_Addr.Text := cells[17,Row];
      fmProductCreateRequest.ed_TelNumber.Text := cells[18,Row];
      fmProductCreateRequest.ed_CustomerManager.Text := cells[19,Row];
      fmProductCreateRequest.mem_Bigo.text := cells[7,Row];
    end;
    fmProductCreateRequest.SHowmodal;
  Finally
    fmProductCreateRequest.Free;
  End;
  SearchList(stDate + stSeq,sg_List.TopRow);
end;

procedure TfmProductList.mn_32Click(Sender: TObject);
var
  stDate : string;
  stSeq : string;
begin
  inherited;
  fmProductCreateRequest:= TfmProductCreateRequest.Create(Self);
  Try
    with sg_List do
    begin
      stDate := cells[0,Row];
      stDate := StringReplace(stDate,'-','',[rfReplaceAll]);
      stDate := StringReplace(stDate,' ','',[rfReplaceAll]);
      stDate := StringReplace(stDate,':','',[rfReplaceAll]);
      stSeq := cells[8,Row];

      fmProductCreateRequest.InPutType := 'DeliveryCompleteUpdate';
      fmProductCreateRequest.KeyDate := stDate;
      fmProductCreateRequest.KeySeq := stSeq;
      fmProductCreateRequest.aGubun := cells[9,Row];
      fmProductCreateRequest.aRequest := cells[10,Row];
      fmProductCreateRequest.aAction := cells[11,Row];
      fmProductCreateRequest.aGoodCode := cells[12,Row];
      fmProductCreateRequest.aRequestDate := cells[20,Row];
      fmProductCreateRequest.aRequestSeq := cells[21,Row];
      fmProductCreateRequest.ed_Count.Text := cells[5,Row];
      fmProductCreateRequest.ed_CustomerName.Text := cells[6,Row];
      fmProductCreateRequest.ed_Addr.Text := cells[17,Row];
      fmProductCreateRequest.ed_TelNumber.Text := cells[18,Row];
      fmProductCreateRequest.ed_CustomerManager.Text := cells[19,Row];
      fmProductCreateRequest.mem_Bigo.text := cells[7,Row];
    end;
    fmProductCreateRequest.SHowmodal;
  Finally
    fmProductCreateRequest.Free;
  End;
  SearchList(stDate + stSeq,sg_List.TopRow);
end;

procedure TfmProductList.mn_23Click(Sender: TObject);
var
  stDate : string;
  stSeq : string;
begin
  inherited;
  with sg_List do
  begin
    stDate := cells[0,Row];
    stDate := StringReplace(stDate,'-','',[rfReplaceAll]);
    stDate := StringReplace(stDate,' ','',[rfReplaceAll]);
    stDate := StringReplace(stDate,':','',[rfReplaceAll]);
    stSeq := cells[8,Row];

    UpdateTB_PRODUCTLIST_ActionConfirm(stDate,stSeq,'2','Y',MASTER_ID);
    dmDB.UpdateTB_CONFIG('PRODUCTSUM','N');
  end;
  SearchList(stDate + stSeq,sg_List.TopRow);
end;

function TfmProductList.UpdateTB_PRODUCTLIST_ActionConfirm(aDate, aSeq,
  aValue, aComplete, aConfirmID: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_PRODUCTLIST set PL_ACTION = ''' + aValue + ''', ';
  stSql := stSql + ' PL_COMPLETE = ''' + aComplete + ''', ';
  stSql := stSql + ' PL_CONFIRMID = ''' + aConfirmID + ''' ';
  stSql := stSql + ' Where PL_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND PL_SEQ = ' + aSeq + ' ';
   
  result := dmDB.ProcessExecSQL(stSql);

end;

procedure TfmProductList.mn_24Click(Sender: TObject);
var
  stDate : string;
  stSeq : string;
begin
  inherited;
  with sg_List do
  begin
    stDate := cells[0,Row];
    stDate := StringReplace(stDate,'-','',[rfReplaceAll]);
    stDate := StringReplace(stDate,' ','',[rfReplaceAll]);
    stDate := StringReplace(stDate,':','',[rfReplaceAll]);
    stSeq := cells[8,Row];

    UpdateTB_PRODUCTLIST_ActionConfirm(stDate,stSeq,'1','N',MASTER_ID);
    dmDB.UpdateTB_CONFIG('PRODUCTSUM','N');
  end;
  SearchList(stDate + stSeq,sg_List.TopRow);

end;


procedure TfmProductList.btn_ProductSummaryClick(Sender: TObject);
begin
  inherited;
  if CheckTB_CONFIG_Value('PRODUCTSUM') <> 'Y' then
  begin
    ProductSummary;  
  end;
  fmProductSummary:= TfmProductSummary.Create(Self);
  fmProductSummary.SHowmodal;
  fmProductSummary.Free;
end;

function TfmProductList.CheckTB_CONFIG_Value(aCode: string): string;
var
  stSql : string;
begin
  result := '';
  stSql := ' Select * from TB_CONFIG ';
  stSql := stSql + ' Where CO_CODE = ''' + aCode + ''' ';

  with TempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordcount < 1 then Exit;
    result := FindField('CO_VALUE').AsString;
  end;
end;

function TfmProductList.ProductSummary: Boolean;
var
  stSql : string;
begin
  DeleteTB_PRODUCTSUM_All;
  Try
    lb_Message.Caption := '데이터 집계 작업 중입니다.';
    pan_gauge.Visible := True;
    Gauge1.Progress := 0;
    stSql := 'Select GL_CODE from TB_PRODUCTLIST ';
    stSql := stSql + ' Group by GL_CODE';
    with SummaryQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      except
        Exit;
      End;
      if recordcount < 1 then Exit;
      Gauge1.MaxValue := recordcount;
      while Not Eof do
      begin
        ProductCodeSummary(FindField('GL_CODE').AsString);
        Gauge1.Progress := Gauge1.Progress + 1;
        Next;
      end;
    end;
  Finally
    pan_gauge.Visible := False;
  End;
  dmDB.UpdateTB_CONFIG('PRODUCTSUM','Y');
end;

function TfmProductList.InsertIntoTB_PRODUCTSUM(aCode,aProductCreate,
  aProductComplete, aDeliveryCreate, aDeliveryComplete,
  aProductStoreCount: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_PRODUCTSUM( ';
  stSql := stSql + 'GL_CODE,';
  stSql := stSql + 'PS_PRODUCTCREATE,';
  stSql := stSql + 'PS_PRODUCTCOMPLETE,';
  stSql := stSql + 'PS_DELIVERYCREATE,';
  stSql := stSql + 'PS_DELIVERYCOMPLETE,';
  stSql := stSql + 'PS_PRODUCTSTORECOUNT)';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + aCode + ''',';
  stSql := stSql + '' + aProductCreate + ',';
  stSql := stSql + '' + aProductComplete + ',';
  stSql := stSql + '' + aDeliveryCreate + ',';
  stSql := stSql + '' + aDeliveryComplete + ',';
  stSql := stSql + '' + aProductStoreCount + ')';

  result := dmDB.ProcessExecSQL(stSql);
end;

function TfmProductList.DeleteTB_PRODUCTSUM_All: Boolean;
var
  stSql : string;
begin
  stSql := ' Delete From TB_PRODUCTSUM ';
  dmDB.ProcessExecSQL(stSql);
end;

function TfmProductList.ProductCodeSummary(aCode: string): Boolean;
var
  nProductCreate : integer;
  nProductComplete : integer;
  nDeliveryCreate : integer;
  nDeliveryComplete : integer;
  nProductStoreCount : integer;
begin
  nProductCreate := GetTB_PRODUCTLIST_ProductCreateCount(aCode);
  nProductComplete := GetTB_PRODUCTLIST_ProductCompleteCount(aCode);
  nDeliveryCreate := GetTB_PRODUCTLIST_DeliveryCreateCount(aCode);
  nDeliveryComplete := GetTB_PRODUCTLIST_DeliveryCompleteCount(aCode);
  nProductStoreCount := nProductComplete - nDeliveryComplete;

  InsertIntoTB_PRODUCTSUM(aCode,inttostr(nProductCreate),inttostr(nProductComplete),inttostr(nDeliveryCreate),inttostr(nDeliveryComplete),inttostr(nProductStoreCount));
end;

function TfmProductList.GetTB_PRODUCTLIST_DeliveryCompleteCount(
  aCode: string): integer;
var
  stSql : string;
begin
  result := 0;
  stSql := 'Select Sum(PL_COUNT) as COUNT from TB_PRODUCTLIST ';
  stSql := stSql + ' Where GL_CODE = ''' + aCode + ''' ';
  stSql := stSql + ' AND PL_GUBUN = ''2'' ';
  stSql := stSql + ' AND (PL_ACTION = ''1'' OR PL_ACTION = ''2'') ';

  with TempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordcount < 1 then Exit;
    result := FindField('COUNT').AsInteger;
  end;

end;

function TfmProductList.GetTB_PRODUCTLIST_DeliveryCreateCount(
  aCode: string): integer;
var
  stSql : string;
begin
  result := 0;
  stSql := 'Select Sum(PL_COUNT) as COUNT from TB_PRODUCTLIST ';
  stSql := stSql + ' Where GL_CODE = ''' + aCode + ''' ';
  stSql := stSql + ' AND PL_GUBUN = ''2'' ';
  stSql := stSql + ' AND (PL_REQUEST = ''1'' OR PL_REQUEST = ''2'') ';

  with TempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordcount < 1 then Exit;
    result := FindField('COUNT').AsInteger;
  end;

end;

function TfmProductList.GetTB_PRODUCTLIST_ProductCompleteCount(
  aCode: string): integer;
var
  stSql : string;
begin
  result := 0;
  stSql := 'Select Sum(PL_COUNT) as COUNT from TB_PRODUCTLIST ';
  stSql := stSql + ' Where GL_CODE = ''' + aCode + ''' ';
  stSql := stSql + ' AND PL_GUBUN = ''1'' ';
  stSql := stSql + ' AND (PL_ACTION = ''1'' OR PL_ACTION = ''2'') ';

  with TempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordcount < 1 then Exit;
    result := FindField('COUNT').AsInteger;
  end;

end;

function TfmProductList.GetTB_PRODUCTLIST_ProductCreateCount(
  aCode: string): integer;
var
  stSql : string;
begin
  result := 0;
  stSql := 'Select Sum(PL_COUNT) as COUNT from TB_PRODUCTLIST ';
  stSql := stSql + ' Where GL_CODE = ''' + aCode + ''' ';
  stSql := stSql + ' AND PL_GUBUN = ''1'' ';
  stSql := stSql + ' AND (PL_REQUEST = ''1'' OR PL_REQUEST = ''2'') ';

  with TempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordcount < 1 then Exit;
    result := FindField('COUNT').AsInteger;
  end;

end;

procedure TfmProductList.sg_ListDblClick(Sender: TObject);
var
  stDate : string;
  stSeq : string;
begin
  inherited;
{날짜     0
구분      1
요청상태  2
실행상태  3
물품명    4
갯수      5
고객사    6
비고      7
순번      8
구분코드  9
요청상태코드 10
실행상태코드 11
물품코드     12
요청자아이디 13
확인자아이디 14
요청시간     15
확인시간     16
주소         17
전화번호     18
담당자       19
요청일       20
요청순번     21
완료유무     22
}
  fmProductCreateRequest:= TfmProductCreateRequest.Create(Self);
  Try
    with sg_List do
    begin
      stDate := cells[0,Row];
      stDate := StringReplace(stDate,'-','',[rfReplaceAll]);
      stDate := StringReplace(stDate,' ','',[rfReplaceAll]);
      stDate := StringReplace(stDate,':','',[rfReplaceAll]);
      stSeq := cells[8,Row];

      fmProductCreateRequest.InPutType := 'Search';
      fmProductCreateRequest.KeyDate := stDate;
      fmProductCreateRequest.KeySeq := stSeq;
      fmProductCreateRequest.aGubun := cells[9,Row];
      fmProductCreateRequest.aRequest := cells[10,Row];
      fmProductCreateRequest.aGoodCode := cells[12,Row];
      fmProductCreateRequest.aRequestDate := cells[20,Row];
      fmProductCreateRequest.aRequestSeq := cells[21,Row];
      fmProductCreateRequest.ed_Count.Text := cells[5,Row];
      fmProductCreateRequest.ed_CustomerName.Text := cells[6,Row];
      fmProductCreateRequest.ed_Addr.Text := cells[17,Row];
      fmProductCreateRequest.ed_TelNumber.Text := cells[18,Row];
      fmProductCreateRequest.ed_CustomerManager.Text := cells[19,Row];
      fmProductCreateRequest.mem_Bigo.text := cells[7,Row];
    end;
    fmProductCreateRequest.SHowmodal;
  Finally
    fmProductCreateRequest.Free;
  End;
end;

initialization
  RegisterClass(TfmProductList);
Finalization
  UnRegisterClass(TfmProductList);

end.
