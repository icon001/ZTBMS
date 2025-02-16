unit uProductCreateRequest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ExtCtrls, Buttons;

type
  TfmProductCreateRequest = class(TForm)
    TempQuery: TZQuery;
    Panel1: TPanel;
    Label2: TLabel;
    ed_Count: TEdit;
    cmb_GoodsList: TComboBox;
    Label1: TLabel;
    Panel2: TPanel;
    btn_save: TSpeedButton;
    btn_close: TSpeedButton;
    pan_Delivery: TPanel;
    Label3: TLabel;
    ed_CustomerName: TEdit;
    Label4: TLabel;
    ed_Addr: TEdit;
    Label5: TLabel;
    ed_TelNumber: TEdit;
    Label6: TLabel;
    ed_CustomerManager: TEdit;
    Panel4: TPanel;
    Label7: TLabel;
    mem_Bigo: TMemo;
    procedure btn_closeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Panel4Resize(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btn_saveClick(Sender: TObject);
  private
    GoodsList : TStringList;
    { Private declarations }
    procedure LoadGoodsList;
    function GetProductNextSeq(aDate:string):string;
    Function GetProductCount(aDate,aSeq:string):integer;
    Function GetCompleteProductCount(aDate,aSeq:string):integer;
    function InsertIntoTB_PRODUCTLIST(aDate,aSeq,aGubun,aRequest,aAction,aCompanyCode,aCode,aCount,aCustomerName,aAddress,aTelNumber,aCustomerManager,
                             aBigo,aRequestId,aConfirmId,aRequestTime,aConfirmTime,aRequestDate,aRequestSeq,aComplete:string):boolean;
    function UpdateTB_PRODUCTLIST(aDate,aSeq,aGubun,aRequest,aAction,aCompanyCode,aCode,aCount,aCustomerName,aAddress,aTelNumber,aCustomerManager,
                             aBigo,aRequestId,aConfirmId,aRequestTime,aConfirmTime,aRequestDate,aRequestSeq,aComplete:string):boolean;
    function UpdateTB_PRODUCTLIST_Complete(aDate,aSeq,aValue:string):Boolean;
  private
    procedure ProductCreate_Save;
    procedure ProductUpdate_Save;
    procedure ProductComplete_Save;
    procedure ProductCompleteUpdate_Save;
    procedure DeliveryCreate_Save;
    procedure DeliveryUpdate_Save;
    procedure DeliveryComplete_Save;
    procedure DeliveryCompleteUpdate_Save;
  public
    { Public declarations }
    InPutType : string;
    KeyDate : string;
    KeySeq : string;
    aGubun : string;
    aRequest : string;
    aAction : string;
    aCompanyCode : string;
    aGoodCode : string;
    aRequestDate : string;
    aRequestSeq : string;
    aRequestCount : string; //요청 갯수 - 완료 시점에 계산
  end;

var
  fmProductCreateRequest: TfmProductCreateRequest;

implementation
uses
  uDataModule,
  uLomosUtil;

{$R *.dfm}

procedure TfmProductCreateRequest.btn_closeClick(Sender: TObject);
begin
  Close;
end;

procedure TfmProductCreateRequest.FormCreate(Sender: TObject);
begin
  GoodsList := TStringList.Create;
  LoadGoodsList;

end;

procedure TfmProductCreateRequest.LoadGoodsList;
var
  stSql : string;
  stGroupCode : string;
begin
  cmb_GoodsList.Clear;
  GoodsList.Clear;
  
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
  if GoodsList.Count > 0 then cmb_GoodsList.ItemIndex := 0;

end;

procedure TfmProductCreateRequest.Panel4Resize(Sender: TObject);
begin
  mem_Bigo.Height := Panel4.Height - mem_Bigo.Top - 20;
end;

procedure TfmProductCreateRequest.FormActivate(Sender: TObject);
var
  nIndex : integer;
begin
  if InPutType = 'ProductCreate' then
  begin
    pan_Delivery.Visible := False;
    ed_Count.SetFocus;
  end else if InPutType = 'ProductUpdate' then
  begin
    pan_Delivery.Visible := False;
    ed_Count.SetFocus;
    nIndex := GoodsList.IndexOf(aGoodCode);
    cmb_GoodsList.ItemIndex := nIndex;
  end else if InPutType = 'ProductComplete' then
  begin
    pan_Delivery.Visible := False;
    ed_Count.Text := inttostr(strtoint(aRequestCount) - GetCompleteProductCount(aRequestDate,aRequestSeq));
    ed_Count.SetFocus;
    nIndex := GoodsList.IndexOf(aGoodCode);
    cmb_GoodsList.ItemIndex := nIndex;
    cmb_GoodsList.Enabled := False;
  end else if InPutType = 'ProductCompleteUpdate' then
  begin
    pan_Delivery.Visible := False;
    ed_Count.SetFocus;
    nIndex := GoodsList.IndexOf(aGoodCode);
    cmb_GoodsList.ItemIndex := nIndex;
    cmb_GoodsList.Enabled := False;
  end else if InPutType = 'DeliveryCreate' then
  begin
    pan_Delivery.Visible := True;
    ed_Count.SetFocus;
  end else if InPutType = 'DeliveryUpdate' then
  begin
    pan_Delivery.Visible := True;
    ed_Count.SetFocus;
    nIndex := GoodsList.IndexOf(aGoodCode);
    cmb_GoodsList.ItemIndex := nIndex;
  end else if InPutType = 'DeliveryComplete' then
  begin
    pan_Delivery.Visible := True;
    ed_Count.Text := inttostr(strtoint(aRequestCount) - GetCompleteProductCount(aRequestDate,aRequestSeq));
    ed_Count.SetFocus;
    nIndex := GoodsList.IndexOf(aGoodCode);
    cmb_GoodsList.ItemIndex := nIndex;
    cmb_GoodsList.Enabled := False;
  end else if InPutType = 'DeliveryCompleteUpdate' then
  begin
    pan_Delivery.Visible := True;
    ed_Count.SetFocus;
    nIndex := GoodsList.IndexOf(aGoodCode);
    cmb_GoodsList.ItemIndex := nIndex;
    cmb_GoodsList.Enabled := False;
  end else if InPutType = 'Search' then
  begin
    if aGubun = '1' then pan_Delivery.Visible := False
    else pan_Delivery.Visible := True;
    nIndex := GoodsList.IndexOf(aGoodCode);
    cmb_GoodsList.ItemIndex := nIndex;
    cmb_GoodsList.Enabled := False;
    ed_Count.Enabled := False;
    ed_CustomerName.Enabled := False;
    ed_Addr.Enabled := False;
    ed_TelNumber.Enabled := False;
    ed_CustomerManager.Enabled := False;
    mem_Bigo.Enabled := False;
    btn_save.Enabled := False;
  end;
end;

procedure TfmProductCreateRequest.btn_saveClick(Sender: TObject);
begin
  if cmb_GoodsList.ItemIndex < 0 then
  begin
    showmessage('물품명을 선택해 주세요.');
    Exit;
  end;
  if Not isDigit(ed_Count.Text) then
  begin
    showmessage(Label2.Caption + '는 숫자만 입력 가능합니다.');
    Exit;
  end;
  if InPutType = 'ProductCreate' then
  begin
    ProductCreate_Save;
  end else if InPutType = 'ProductUpdate' then
  begin
    ProductUpdate_Save;
  end else if InPutType = 'ProductComplete' then
  begin
    ProductComplete_Save;
  end else if InPutType = 'ProductCompleteUpdate' then
  begin
    ProductCompleteUpdate_Save;
  end else if InPutType = 'DeliveryCreate' then
  begin
    DeliveryCreate_Save;
  end else if InPutType = 'DeliveryUpdate' then
  begin
    DeliveryUpdate_Save;
  end else if InPutType = 'DeliveryComplete' then
  begin
    DeliveryComplete_Save;
  end else if InPutType = 'DeliveryCompleteUpdate' then
  begin
    DeliveryCompleteUpdate_Save;
  end;
  dmDB.UpdateTB_CONFIG('PRODUCTSUM','N');

end;

function TfmProductCreateRequest.GetProductNextSeq(aDate: string): string;
var
  stSql : string;
begin
  result := '1';

  stSql := 'select Max(PL_SEQ) as Seq from TB_PRODUCTLIST ';
  stSql := stSql + ' Where PL_DATE = ''' + aDate + ''' ';
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
    result := inttostr(FindField('Seq').AsInteger + 1);
  end;
end;

function TfmProductCreateRequest.InsertIntoTB_PRODUCTLIST(aDate, aSeq,
  aGubun, aRequest, aAction, aCompanyCode, aCode, aCount, aCustomerName,
  aAddress, aTelNumber, aCustomerManager, aBigo, aRequestId, aConfirmId,
  aRequestTime, aConfirmTime, aRequestDate, aRequestSeq,
  aComplete: string): boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_PRODUCTLIST ( ';
  stSql := stSql + ' PL_DATE,';
  stSql := stSql + ' PL_SEQ,';
  stSql := stSql + ' PL_GUBUN,';
  stSql := stSql + ' PL_REQUEST,';
  stSql := stSql + ' PL_ACTION,';
  stSql := stSql + ' CO_COMPANYCODE,';
  stSql := stSql + ' GL_CODE,';
  stSql := stSql + ' PL_COUNT,';
  stSql := stSql + ' PL_CUSTOMERNAME,';
  stSql := stSql + ' PL_ADDRESS,';
  stSql := stSql + ' PL_TELNUMBER,';
  stSql := stSql + ' PL_MANAGER,';
  stSql := stSql + ' PL_BIGO,';
  stSql := stSql + ' PL_REQUESTID,';
  stSql := stSql + ' PL_CONFIRMID,';
  stSql := stSql + ' PL_REQUESTTIME,';
  stSql := stSql + ' PL_CONFIRMTIME,';
  stSql := stSql + ' PL_REQUESTDATE,';
  stSql := stSql + ' PL_REQUESTSEQ,';
  stSql := stSql + ' PL_COMPLETE )';
  stSql := stSql + ' Values(';
  stSql := stSql + '''' + aDate + ''',';
  stSql := stSql + '' + aSeq + ',';
  stSql := stSql + '''' + aGubun + ''',';
  stSql := stSql + '''' + aRequest + ''',';
  stSql := stSql + '''' + aAction + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aCode + ''',';
  stSql := stSql + '' + aCount + ',';
  stSql := stSql + '''' + aCustomerName + ''',';
  stSql := stSql + '''' + aAddress + ''',';
  stSql := stSql + '''' + aTelNumber + ''',';
  stSql := stSql + '''' + aCustomerManager + ''',';
  stSql := stSql + '''' + aBigo + ''',';
  stSql := stSql + '''' + aRequestId + ''',';
  stSql := stSql + '''' + aConfirmId + ''',';
  stSql := stSql + '''' + aRequestTime + ''',';
  stSql := stSql + '''' + aConfirmTime + ''',';
  stSql := stSql + '''' + aRequestDate + ''',';
  stSql := stSql + '''' + aRequestSeq + ''',';
  stSql := stSql + '''' + aComplete + ''')';

  result := dmDB.ProcessExecSQL(stSql);
end;

procedure TfmProductCreateRequest.ProductCreate_Save;
var
  stDate : string;
  stSeq : string;
  stGubun : string;
  stRequest : string;
  stAction : string;
  stCompanyCode : string;
  stCode : string;
  stCount : string;
  stCustomerName : string;
  stAddress : string;
  stTelNumber : string;
  stCustomerManager : string;
  stBigo : string;
  stRequestId : string;
  stConfirmId : string;
  stRequestTime : string;
  stConfirmTime : string;
  stRequestDate : string;
  stRequestSeq : string;
  stComplete : string;
begin
  stCompanyCode := '001';

  stDate := FormatDateTime('yyyymmdd',now);
  stSeq := GetProductNextSeq(stDate);
  stGubun := '1';  //생산
  stRequest := '1'; //요청
  stAction := '';
  stCode := GoodsList.Strings[cmb_GoodsList.ItemIndex];
  stCount := ed_Count.Text;
  stCustomerName := '';
  stAddress := '';
  stTelNumber := '';
  stCustomerManager := '';
  stBigo := mem_Bigo.Text;
  stRequestId := Master_ID;
  stConfirmId := '';
  stRequestTime := FormatDateTime('yyyymmddhhnnss',now);
  stConfirmTime := '';
  stRequestDate := '';
  stRequestSeq := '0';
  stComplete := 'N';
  if InsertIntoTB_PRODUCTLIST(stDate,stSeq,stGubun,stRequest,stAction,stCompanyCode,
                           stCode,stCount,stCustomerName,stAddress,stTelNumber,stCustomerManager,
                           stBigo,stRequestId,stConfirmId,stRequestTime,stConfirmTime,
                           stRequestDate,stRequestSeq,stComplete) then
  begin
    close;
    Exit;
  end else
    showmessage('저장에 실패하였습니다.');

end;

procedure TfmProductCreateRequest.DeliveryCreate_Save;
var
  stDate : string;
  stSeq : string;
  stGubun : string;
  stRequest : string;
  stAction : string;
  stCompanyCode : string;
  stCode : string;
  stCount : string;
  stCustomerName : string;
  stAddress : string;
  stTelNumber : string;
  stCustomerManager : string;
  stBigo : string;
  stRequestId : string;
  stConfirmId : string;
  stRequestTime : string;
  stConfirmTime : string;
  stRequestDate : string;
  stRequestSeq : string;
  stComplete : string;
begin
  stCompanyCode := '001';
  stDate := FormatDateTime('yyyymmdd',now);
  stSeq := GetProductNextSeq(stDate);
  stGubun := '2';  //출고
  stRequest := '1'; //요청
  stAction := '';
  stCode := GoodsList.Strings[cmb_GoodsList.ItemIndex];
  stCount := ed_Count.Text;
  stCustomerName := ed_CustomerName.Text;
  stAddress := ed_Addr.Text;
  stTelNumber := ed_TelNumber.Text;
  stCustomerManager := ed_CustomerManager.Text;
  stBigo := mem_Bigo.Text;
  stRequestId := Master_ID;
  stConfirmId := '';
  stRequestTime := FormatDateTime('yyyymmddhhnnss',now);
  stConfirmTime := '';
  stRequestDate := '';
  stRequestSeq := '0';
  stComplete := 'N';
  if InsertIntoTB_PRODUCTLIST(stDate,stSeq,stGubun,stRequest,stAction,stCompanyCode,
                           stCode,stCount,stCustomerName,stAddress,stTelNumber,stCustomerManager,
                           stBigo,stRequestId,stConfirmId,stRequestTime,stConfirmTime,
                           stRequestDate,stRequestSeq,stComplete) then
  begin
    close;
    Exit;
  end else
    showmessage('저장에 실패하였습니다.');

end;

procedure TfmProductCreateRequest.ProductUpdate_Save;
var
  stDate : string;
  stSeq : string;
  stGubun : string;
  stRequest : string;
  stAction : string;
  stCompanyCode : string;
  stCode : string;
  stCount : string;
  stCustomerName : string;
  stAddress : string;
  stTelNumber : string;
  stCustomerManager : string;
  stBigo : string;
  stRequestId : string;
  stConfirmId : string;
  stRequestTime : string;
  stConfirmTime : string;
  stRequestDate : string;
  stRequestSeq : string;
  stComplete : string;
begin
  stCompanyCode := '001';

  stDate := KeyDate;
  stSeq := KeySeq;
  stGubun := aGubun;  //생산
  stRequest := aRequest; //요청
  stAction := '';
  stCode := GoodsList.Strings[cmb_GoodsList.ItemIndex];
  stCount := ed_Count.Text;
  stCustomerName := '';
  stAddress := '';
  stTelNumber := '';
  stCustomerManager := '';
  stBigo := mem_Bigo.Text;
  stRequestId := Master_ID;
  stConfirmId := '';
  stRequestTime := FormatDateTime('yyyymmddhhnnss',now);
  stConfirmTime := '';
  stRequestDate := '';
  stRequestSeq := '0';
  stComplete := 'N';
  if UpdateTB_PRODUCTLIST(stDate,stSeq,stGubun,stRequest,stAction,stCompanyCode,
                           stCode,stCount,stCustomerName,stAddress,stTelNumber,stCustomerManager,
                           stBigo,stRequestId,stConfirmId,stRequestTime,stConfirmTime,
                           stRequestDate,stRequestSeq,stComplete) then
  begin
    close;
    Exit;
  end else
    showmessage('저장에 실패하였습니다.');

end;

function TfmProductCreateRequest.UpdateTB_PRODUCTLIST(aDate, aSeq, aGubun,
  aRequest, aAction, aCompanyCode, aCode, aCount, aCustomerName, aAddress,
  aTelNumber, aCustomerManager, aBigo, aRequestId, aConfirmId,
  aRequestTime, aConfirmTime, aRequestDate, aRequestSeq,
  aComplete: string): boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_PRODUCTLIST Set ';
  stSql := stSql + ' PL_GUBUN = ''' + aGubun + ''',';
  stSql := stSql + ' PL_REQUEST = ''' + aRequest + ''',';
  stSql := stSql + ' PL_ACTION = ''' + aAction + ''',';
  stSql := stSql + ' CO_COMPANYCODE = ''' + aCompanyCode + ''',';
  stSql := stSql + ' GL_CODE = ''' + aCode + ''',';
  stSql := stSql + ' PL_COUNT = ' + aCount + ',';
  stSql := stSql + ' PL_CUSTOMERNAME = ''' + aCustomerName + ''',';
  stSql := stSql + ' PL_ADDRESS = ''' + aAddress + ''',';
  stSql := stSql + ' PL_TELNUMBER = ''' + aTelNumber + ''',';
  stSql := stSql + ' PL_MANAGER = ''' + aCustomerManager + ''',';
  stSql := stSql + ' PL_BIGO = ''' + aBigo + ''',';
  stSql := stSql + ' PL_REQUESTID = ''' + aRequestId + ''',';
  stSql := stSql + ' PL_CONFIRMID =''' + aConfirmId + ''',';
  stSql := stSql + ' PL_REQUESTTIME = ''' + aRequestTime + ''',';
  stSql := stSql + ' PL_CONFIRMTIME = ''' + aConfirmTime + ''',';
  stSql := stSql + ' PL_REQUESTDATE = ''' + aRequestDate + ''',';
  stSql := stSql + ' PL_REQUESTSEQ = ''' + aRequestSeq + ''',';
  stSql := stSql + ' PL_COMPLETE = ''' + aComplete + ''' ';
  stSql := stSql + ' Where PL_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND PL_SEQ = ' + aSeq + ' ';

  result := dmDB.ProcessExecSQL(stSql);
end;

procedure TfmProductCreateRequest.DeliveryUpdate_Save;
var
  stDate : string;
  stSeq : string;
  stGubun : string;
  stRequest : string;
  stAction : string;
  stCompanyCode : string;
  stCode : string;
  stCount : string;
  stCustomerName : string;
  stAddress : string;
  stTelNumber : string;
  stCustomerManager : string;
  stBigo : string;
  stRequestId : string;
  stConfirmId : string;
  stRequestTime : string;
  stConfirmTime : string;
  stRequestDate : string;
  stRequestSeq : string;
  stComplete : string;
begin
  stCompanyCode := '001';
  stDate := KeyDate;
  stSeq := KeySeq;
  stGubun := aGubun;  //생산
  stRequest := aRequest; //요청
  stAction := '';
  stCode := GoodsList.Strings[cmb_GoodsList.ItemIndex];
  stCount := ed_Count.Text;
  stCustomerName := ed_CustomerName.Text;
  stAddress := ed_Addr.Text;
  stTelNumber := ed_TelNumber.Text;
  stCustomerManager := ed_CustomerManager.Text;
  stBigo := mem_Bigo.Text;
  stRequestId := Master_ID;
  stConfirmId := '';
  stRequestTime := FormatDateTime('yyyymmddhhnnss',now);
  stConfirmTime := '';
  stRequestDate := '';
  stRequestSeq := '0';
  stComplete := 'N';

  if UpdateTB_PRODUCTLIST(stDate,stSeq,stGubun,stRequest,stAction,stCompanyCode,
                           stCode,stCount,stCustomerName,stAddress,stTelNumber,stCustomerManager,
                           stBigo,stRequestId,stConfirmId,stRequestTime,stConfirmTime,
                           stRequestDate,stRequestSeq,stComplete) then
  begin
    close;
    Exit;
  end else
    showmessage('저장에 실패하였습니다.');

end;



procedure TfmProductCreateRequest.ProductComplete_Save;
var
  stDate : string;
  stSeq : string;
  stGubun : string;
  stRequest : string;
  stAction : string;
  stCompanyCode : string;
  stCode : string;
  stCount : string;
  stCustomerName : string;
  stAddress : string;
  stTelNumber : string;
  stCustomerManager : string;
  stBigo : string;
  stRequestId : string;
  stConfirmId : string;
  stRequestTime : string;
  stConfirmTime : string;
  stRequestDate : string;
  stRequestSeq : string;
  stComplete : string;
  nOrgCount : integer;
  nCompleteCount : integer;
begin
  stCompanyCode := '001';

  stDate := FormatDateTime('yyyymmdd',now);
  stSeq := GetProductNextSeq(stDate);
  stGubun := '1';  //생산
  stRequest := ''; //1.요청  2.확인
  stAction := '1'; //1.완료 2.확인
  stCode := GoodsList.Strings[cmb_GoodsList.ItemIndex];
  stCount := ed_Count.Text;
  stCustomerName := '';
  stAddress := '';
  stTelNumber := '';
  stCustomerManager := '';
  stBigo := mem_Bigo.Text;
  stRequestId := Master_ID;
  stConfirmId := '';
  stRequestTime := FormatDateTime('yyyymmddhhnnss',now);
  stConfirmTime := '';
  stRequestDate := aRequestDate;
  stRequestSeq := aRequestSeq;
  stComplete := 'N';
  if InsertIntoTB_PRODUCTLIST(stDate,stSeq,stGubun,stRequest,stAction,stCompanyCode,
                           stCode,stCount,stCustomerName,stAddress,stTelNumber,stCustomerManager,
                           stBigo,stRequestId,stConfirmId,stRequestTime,stConfirmTime,
                           stRequestDate,stRequestSeq,stComplete) then
  begin
    nOrgCount := GetProductCount(aRequestDate,aRequestSeq);
    nCompleteCount := GetCompleteProductCount(aRequestDate,aRequestSeq);
    if nOrgCount = nCompleteCount  then
    begin
      UpdateTB_PRODUCTLIST_Complete(aRequestDate,aRequestSeq,'Y');
    end else if nCompleteCount = 0 then
    begin
      UpdateTB_PRODUCTLIST_Complete(aRequestDate,aRequestSeq,'N');
    end else
    begin
      UpdateTB_PRODUCTLIST_Complete(aRequestDate,aRequestSeq,'R');
    end;
    close;
    Exit;
  end else
    showmessage('저장에 실패하였습니다.');

end;

function TfmProductCreateRequest.UpdateTB_PRODUCTLIST_Complete(aDate, aSeq,
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

procedure TfmProductCreateRequest.ProductCompleteUpdate_Save;
var
  stDate : string;
  stSeq : string;
  stGubun : string;
  stRequest : string;
  stAction : string;
  stCompanyCode : string;
  stCode : string;
  stCount : string;
  stCustomerName : string;
  stAddress : string;
  stTelNumber : string;
  stCustomerManager : string;
  stBigo : string;
  stRequestId : string;
  stConfirmId : string;
  stRequestTime : string;
  stConfirmTime : string;
  stRequestDate : string;
  stRequestSeq : string;
  stComplete : string;
  nOrgCount : integer;
  nCompleteCount : integer;
begin
  stCompanyCode := '001';

  stDate := KeyDate;
  stSeq := KeySeq;
  stGubun := aGubun;  //생산
  stRequest := aRequest; //요청
  stAction := aAction;
  stCode := GoodsList.Strings[cmb_GoodsList.ItemIndex];
  stCount := ed_Count.Text;
  stCustomerName := '';
  stAddress := '';
  stTelNumber := '';
  stCustomerManager := '';
  stBigo := mem_Bigo.Text;
  stRequestId := Master_ID;
  stConfirmId := '';
  stRequestTime := FormatDateTime('yyyymmddhhnnss',now);
  stConfirmTime := '';
  stRequestDate := aRequestDate;
  stRequestSeq := aRequestSeq;
  stComplete := 'N';
  if UpdateTB_PRODUCTLIST(stDate,stSeq,stGubun,stRequest,stAction,stCompanyCode,
                           stCode,stCount,stCustomerName,stAddress,stTelNumber,stCustomerManager,
                           stBigo,stRequestId,stConfirmId,stRequestTime,stConfirmTime,
                           stRequestDate,stRequestSeq,stComplete) then
  begin
    nOrgCount := GetProductCount(aRequestDate,aRequestSeq);
    nCompleteCount := GetCompleteProductCount(aRequestDate,aRequestSeq);
    if nOrgCount = nCompleteCount  then
    begin
      UpdateTB_PRODUCTLIST_Complete(aRequestDate,aRequestSeq,'Y');
    end else if nCompleteCount = 0 then
    begin
      UpdateTB_PRODUCTLIST_Complete(aRequestDate,aRequestSeq,'N');
    end else
    begin
      UpdateTB_PRODUCTLIST_Complete(aRequestDate,aRequestSeq,'R');
    end;
    close;
    Exit;
  end else
    showmessage('저장에 실패하였습니다.');

end;

function TfmProductCreateRequest.GetCompleteProductCount(aDate,
  aSeq: string): integer;
var
  stSql : string;
begin
  result := 0;
  stSql := ' Select sum(PL_COUNT) as COUNT from TB_PRODUCTLIST ';
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

function TfmProductCreateRequest.GetProductCount(aDate,
  aSeq: string): integer;
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

procedure TfmProductCreateRequest.DeliveryComplete_Save;
var
  stDate : string;
  stSeq : string;
  stGubun : string;
  stRequest : string;
  stAction : string;
  stCompanyCode : string;
  stCode : string;
  stCount : string;
  stCustomerName : string;
  stAddress : string;
  stTelNumber : string;
  stCustomerManager : string;
  stBigo : string;
  stRequestId : string;
  stConfirmId : string;
  stRequestTime : string;
  stConfirmTime : string;
  stRequestDate : string;
  stRequestSeq : string;
  stComplete : string;
  nOrgCount : integer;
  nCompleteCount : integer;
begin
  stCompanyCode := '001';
  stDate := FormatDateTime('yyyymmdd',now);
  stSeq := GetProductNextSeq(stDate);
  stGubun := '2';  //출고
  stRequest := ''; //1.요청  2.확인
  stAction := '1'; //1.완료 2.확인
  stCode := GoodsList.Strings[cmb_GoodsList.ItemIndex];
  stCount := ed_Count.Text;
  stCustomerName := ed_CustomerName.Text;
  stAddress := ed_Addr.Text;
  stTelNumber := ed_TelNumber.Text;
  stCustomerManager := ed_CustomerManager.Text;
  stBigo := mem_Bigo.Text;
  stRequestId := Master_ID;
  stConfirmId := '';
  stRequestTime := FormatDateTime('yyyymmddhhnnss',now);
  stConfirmTime := '';
  stRequestDate := aRequestDate;
  stRequestSeq := aRequestSeq;
  stComplete := 'N';

  if InsertIntoTB_PRODUCTLIST(stDate,stSeq,stGubun,stRequest,stAction,stCompanyCode,
                           stCode,stCount,stCustomerName,stAddress,stTelNumber,stCustomerManager,
                           stBigo,stRequestId,stConfirmId,stRequestTime,stConfirmTime,
                           stRequestDate,stRequestSeq,stComplete) then
  begin
    nOrgCount := GetProductCount(aRequestDate,aRequestSeq);
    nCompleteCount := GetCompleteProductCount(aRequestDate,aRequestSeq);
    if nOrgCount = nCompleteCount  then
    begin
      UpdateTB_PRODUCTLIST_Complete(aRequestDate,aRequestSeq,'Y');
    end else if nCompleteCount = 0 then
    begin
      UpdateTB_PRODUCTLIST_Complete(aRequestDate,aRequestSeq,'N');
    end else
    begin
      UpdateTB_PRODUCTLIST_Complete(aRequestDate,aRequestSeq,'R');
    end;
    close;
    Exit;
  end else
    showmessage('저장에 실패하였습니다.');

end;

procedure TfmProductCreateRequest.DeliveryCompleteUpdate_Save;
var
  stDate : string;
  stSeq : string;
  stGubun : string;
  stRequest : string;
  stAction : string;
  stCompanyCode : string;
  stCode : string;
  stCount : string;
  stCustomerName : string;
  stAddress : string;
  stTelNumber : string;
  stCustomerManager : string;
  stBigo : string;
  stRequestId : string;
  stConfirmId : string;
  stRequestTime : string;
  stConfirmTime : string;
  stRequestDate : string;
  stRequestSeq : string;
  stComplete : string;
  nOrgCount : integer;
  nCompleteCount : integer;
begin
  stCompanyCode := '001';

  stDate := KeyDate;
  stSeq := KeySeq;
  stGubun := aGubun;  //생산
  stRequest := aRequest; //요청
  stAction := aAction;
  stCode := GoodsList.Strings[cmb_GoodsList.ItemIndex];
  stCount := ed_Count.Text;
  stCustomerName := ed_CustomerName.Text;
  stAddress := ed_Addr.Text;
  stTelNumber := ed_TelNumber.Text;
  stCustomerManager := ed_CustomerManager.Text;
  stBigo := mem_Bigo.Text;
  stRequestId := Master_ID;
  stConfirmId := '';
  stRequestTime := FormatDateTime('yyyymmddhhnnss',now);
  stConfirmTime := '';
  stRequestDate := aRequestDate;
  stRequestSeq := aRequestSeq;
  stComplete := 'N';
  if UpdateTB_PRODUCTLIST(stDate,stSeq,stGubun,stRequest,stAction,stCompanyCode,
                           stCode,stCount,stCustomerName,stAddress,stTelNumber,stCustomerManager,
                           stBigo,stRequestId,stConfirmId,stRequestTime,stConfirmTime,
                           stRequestDate,stRequestSeq,stComplete) then
  begin
    nOrgCount := GetProductCount(aRequestDate,aRequestSeq);
    nCompleteCount := GetCompleteProductCount(aRequestDate,aRequestSeq);
    if nOrgCount = nCompleteCount  then
    begin
      UpdateTB_PRODUCTLIST_Complete(aRequestDate,aRequestSeq,'Y');
    end else if nCompleteCount = 0 then
    begin
      UpdateTB_PRODUCTLIST_Complete(aRequestDate,aRequestSeq,'N');
    end else
    begin
      UpdateTB_PRODUCTLIST_Complete(aRequestDate,aRequestSeq,'R');
    end;
    close;
    Exit;
  end else
    showmessage('저장에 실패하였습니다.');

end;

end.
