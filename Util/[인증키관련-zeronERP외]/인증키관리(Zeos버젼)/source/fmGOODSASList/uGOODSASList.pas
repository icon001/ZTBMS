unit uGOODSASList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Gauges,
  ExtCtrls, Grids, BaseGrid, AdvGrid, StdCtrls, ComCtrls, Buttons,
  uSubForm, CommandArray, Menus, FR_DSet, FR_DBSet, FR_Class,iniFiles,
  ComObj, AdvObj;

type
  TfmGOODSASList = class(TfmASubForm)
    GroupBox1: TGroupBox;
    Label9: TLabel;
    Label4: TLabel;
    btn_Close: TSpeedButton;
    btn_Excel: TSpeedButton;
    Label5: TLabel;
    Label7: TLabel;
    btn_Search: TBitBtn;
    cmb_state: TComboBox;
    dt_FromDate: TDateTimePicker;
    dt_toDate: TDateTimePicker;
    GroupBox2: TGroupBox;
    btn_Insert: TSpeedButton;
    ed_CustomerName: TEdit;
    cmb_Company: TComboBox;
    sg_List: TAdvStringGrid;
    pan_gauge: TPanel;
    Label23: TLabel;
    Gauge1: TGauge;
    TempQuery: TZQuery;
    ed_customer: TEdit;
    Label1: TLabel;
    chk_user: TCheckBox;
    PopupMenu2: TPopupMenu;
    MenuItem1: TMenuItem;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    AS1: TMenuItem;
    ZPrintQuery: TZQuery;
    SaveDialog1: TSaveDialog;
    frReport2: TfrReport;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_CloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure btn_InsertClick(Sender: TObject);
    procedure cmb_CompanyChange(Sender: TObject);
    procedure cmb_stateChange(Sender: TObject);
    procedure sg_ListDblClick(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure AS1Click(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure btn_ExcelClick(Sender: TObject);
    procedure CommandArrayCommandsTASExecute(Command: TCommand;
      Params: TStringList);
    procedure N1Click(Sender: TObject);
    procedure frReport2GetValue(const ParName: String;
      var ParValue: Variant);
  private
    sCompanyCodeList :TStringList;
    { Private declarations }
    procedure LoadCompanyCode(cmb_Box:TComboBox;aCompanyGubunCode:string;TempList:TStringList;bAll:Boolean = True);
    procedure ShowASList(aCode:string;aTopRow:integer=0);
    Function ExcelPrintOut(StringGrid:TAdvStringGrid;refFileName,SaveFileName:String;FileOut:Boolean;ExcelRowStart:integer;stTitle:string;bRowHeader,bColHeader:Boolean):Boolean;
    function UpdateTB_ASLIST_USERCONFIRM : Boolean;
  public
    { Public declarations }
  end;

var
  fmGOODSASList: TfmGOODSASList;

implementation
uses
  uDataModule,
  uLomosUtil, uInASList, uUpdateASList;

{$R *.dfm}

procedure TfmGOODSASList.FormCreate(Sender: TObject);
begin
  sCompanyCodeList := TStringList.Create;
end;

procedure TfmGOODSASList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  sCompanyCodeList.Free;
  Action := caFree;
end;

procedure TfmGOODSASList.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmGOODSASList.FormShow(Sender: TObject);
begin
  LoadCompanyCode(cmb_Company,'000',sCompanyCodeList);
  dt_FromDate.Date := now - 30;
  dt_toDate.Date := now;

  ShowASList('');
end;

procedure TfmGOODSASList.LoadCompanyCode(cmb_Box: TComboBox;
  aCompanyGubunCode: string; TempList: TStringList; bAll: Boolean);
var
  stSql : string;
begin
  cmb_Box.Clear;
  TempList.Clear;
  stSql := 'select a.* from TB_COMPANY a ';
  stSql := stSql + ' Inner Join (select CO_COMPANYCODE from TB_ASLIST GROUP BY CO_COMPANYCODE) b ';
  stSql := stSql + ' ON(a.CO_COMPANYCODE = b.CO_COMPANYCODE) ';
  stSql := stSql + ' order by a.CO_COMPANYCODE ';

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
    if recordCount < 0 then Exit;
    While Not Eof do
    begin
      cmb_Box.Items.Add(FindField('CO_NAME').AsString );
      TempList.Add(FindField('CO_COMPANYCODE').AsString);
      Next;
    end;
  end;
  cmb_Box.ItemIndex := 0;
end;

procedure TfmGOODSASList.btn_SearchClick(Sender: TObject);
begin
  ShowASList('');
end;

procedure TfmGOODSASList.ShowASList(aCode: string;aTopRow:integer=0);
var
  stSql : string;
  nRow : integer;
  stTemp : string;
begin

  GridInit(sg_List,13);
  if sCompanyCodeList.Count < 1 then Exit;
  if cmb_Company.ItemIndex < 0 then Exit;

  stSql := ' select a.*, ';
  stSql := stSql + ' CASE ';
  stSql := stSql + ' WHEN a.AL_STATE = ''1'' THEN ''�԰�'' ';
  stSql := stSql + ' WHEN a.AL_STATE = ''2'' THEN ''��������'' ';
  stSql := stSql + ' WHEN a.AL_STATE = ''3'' THEN ''������'' ';
  stSql := stSql + ' WHEN a.AL_STATE = ''4'' THEN ''�����԰�'' ';
  stSql := stSql + ' WHEN a.AL_STATE = ''8'' THEN ''�����Ϸ�'' ';
  stSql := stSql + ' WHEN a.AL_STATE = ''9'' THEN ''�߼ۿϷ�'' ';
  stSql := stSql + ' ELSE '' '' ';
  stSql := stSql + ' END as STATE ';
  stSql := stSql + ' from TB_ASLIST a ';
  stSql := stSql + ' Where a.AL_DATE Between ''' + FormatDateTime('yyyymmdd',dt_FromDate.date) + ''' ';
  stSql := stSql + ' AND ''' + FormatDateTime('yyyymmdd',dt_toDate.date) + ''' ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + sCompanyCodeList.Strings[cmb_Company.itemIndex] + ''' ';
  if cmb_state.ItemIndex > 0 then
  begin
    stSql := stSql + ' AND a.AL_STATE = ''' + copy(cmb_state.Text,1,1) + ''' ';
  end;
  if Trim(ed_customer.Text) <> '' then
  begin
    stSql := stSql + ' AND a.AL_NAME Like ''%' + Trim(ed_customer.Text) + '%'' ';
  end;

  if Trim(ed_CustomerName.Text) <> '' then
  begin
    stSql := stSql + ' AND a.AL_USERNAME Like ''%' + Trim(ed_CustomerName.Text) + '%'' ';
  end;
  if chk_user.Checked then
  begin
    stSql := stSql + ' AND a.AL_NEXTID = ''' + Master_ID + ''' ';
  end;
  stSql := stSql + ' order by a.AL_DATE DESC';

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
        cells[0,nRow] := FindField('AL_DATE').AsString;
        cells[1,nRow] := inttostr(FindField('AL_CODE').AsInteger);
        cells[2,nRow] := FindField('AL_NAME').AsString;
        cells[3,nRow] := FindField('STATE').AsString;
        cells[4,nRow] := FindField('AL_USERNAME').AsString;
        cells[5,nRow] := FindField('AL_ZIPCODE').AsString;
        cells[6,nRow] := FindField('AL_ADDR').AsString;
        cells[7,nRow] := FindField('AL_LASTDATE').AsString;
        cells[8,nRow] := FindField('AL_DELIVERYCOMPANY').AsString;
        cells[9,nRow] := FindField('AL_DELIVERYNUM').AsString;
        cells[10,nRow] := FindField('AL_INSERTID').AsString;
        cells[11,nRow] := FindField('AL_NEXTID').AsString;
        cells[12,nRow] := FindField('MA_USERID').AsString;
        cells[13,nRow] := FindField('AL_STATE').AsString;
        cells[14,nRow] := FindField('CO_COMPANYCODE').AsString;
        cells[15,nRow] := FindField('AL_TELNUM').AsString;

        if (cells[13,nRow] <> '8') and (cells[13,nRow] <> '9') then
        begin
          RowColor[nRow] := clYellow;
        end else
        begin
          RowColor[nRow] := clWhite;
        end;
        
        if aCode = cells[0,nRow] + cells[1,nRow] then
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

procedure TfmGOODSASList.btn_InsertClick(Sender: TObject);
var
  stDate : string;
  stCode : string;
begin
  inherited;
  fmInASList:= TfmInASList.Create(Self);
  fmInASList.L_stType := 'INSERT';
  if cmb_Company.itemIndex > -1 then
    fmInASList.L_stCompanyCode := sCompanyCodeList.Strings[cmb_Company.itemIndex];
  fmInASList.SHowmodal;
  stDate := FormatDateTime('yyyymmdd',fmInASList.dt_Date.DateTime);
  stCode := inttostr(fmInASList.L_nCode);
  fmInASList.Free;
  ShowASList(stDate+stCode);
//  ShowInOutGoodsList('',sg_GoodsInoutList.TopRow);

end;

procedure TfmGOODSASList.cmb_CompanyChange(Sender: TObject);
begin
  inherited;
  ShowASList('');
end;

procedure TfmGOODSASList.cmb_stateChange(Sender: TObject);
begin
  inherited;
  ShowASList('');

end;

procedure TfmGOODSASList.sg_ListDblClick(Sender: TObject);
begin
  inherited;
  MenuItem1Click(self);
end;

procedure TfmGOODSASList.MenuItem1Click(Sender: TObject);
begin
  with sg_List do
  begin
    if Cells[0,Row] = '' then Exit;
    fmUpdateASList:= TfmUpdateASList.Create(Self);
    fmUpdateASList.L_stDate := cells[0,Row];
    fmUpdateASList.L_stCode := cells[1,Row];
    fmUpdateASList.L_stCompanyCode := cells[14,Row];
    fmUpdateASList.L_stNextID := cells[11,Row];
    fmUpdateASList.L_stState := cells[13,Row];
    fmUpdateASList.ed_customername.Text := cells[2,Row];
    fmUpdateASList.ed_customerphone.Text := cells[15,Row];
    fmUpdateASList.ed_zip.Text := cells[5,Row];
    fmUpdateASList.ed_customeraddr.Text := cells[6,Row];
    fmUpdateASList.ed_customerperson.Text := cells[4,Row];
    fmUpdateASList.ed_deliveryCompany.Text := cells[8,Row];
    fmUpdateASList.ed_deliveryNum.Text := cells[9,Row];
    fmUpdateASList.ShowModal;
    fmUpdateASList.free;
  end;
  btn_SearchClick(self);
end;

procedure TfmGOODSASList.AS1Click(Sender: TObject);
var
  stSql : string;
  stDate : string;
begin
  inherited;
  with sg_List do
  begin
    if Cells[0,Row] = '' then Exit;
    stDate := StringReplace(Cells[0,Row],'-','',[rfReplaceAll]);
    stDate := StringReplace(Cells[0,Row],':','',[rfReplaceAll]);
    stDate := StringReplace(Cells[0,Row],' ','',[rfReplaceAll]);

    stSql := 'select a.*,b.GL_NAME from TB_ASGOODSLIST a ';
    stSql := stSql + ' Left Join TB_GOODSLIST b ';
    stSql := stSql + ' ON ( a.CO_COMPANYCODE = b.CO_COMPANYCODE  ';
    stSql := stSql + ' AND a.GL_CODE = b.GL_CODE)  ';
    stSql := stSql + ' Where a.AL_DATE = ''' + stDate + ''' ';
    stSql := stSql + ' AND a.AL_CODE = ' + Cells[1,Row] + ' ';
  end;
  with ZPrintQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
  end;
  frReport1.ShowReport;

end;

procedure TfmGOODSASList.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
  inherited;
  with sg_List do
  begin
    if AnsiCompareText(ParName, 'aDAY') = 0 then
      ParValue := Cells[0,Row];
    if AnsiCompareText(ParName, 'aNO') = 0 then
      ParValue := Cells[1,Row];
    if AnsiCompareText(ParName, 'aCustomerName') = 0 then
      ParValue := Cells[2,Row];
    if AnsiCompareText(ParName, 'aCustomerPhone') = 0 then
      ParValue := Cells[15,Row];
    if AnsiCompareText(ParName, 'aName') = 0 then
      ParValue := Cells[4,Row];
    if AnsiCompareText(ParName, 'aZip') = 0 then
      ParValue := Cells[5,Row];
    if AnsiCompareText(ParName, 'aAddr') = 0 then
      ParValue := Cells[6,Row];
  end;


end;

procedure TfmGOODSASList.btn_ExcelClick(Sender: TObject);
var
  stRefFileName,stSaveFileName:String;
  stPrintRefPath : string;
  nExcelRowStart:integer;
  ini_fun : TiniFile;
  aFileName : string;
  stTitle : string;
begin
  btn_Excel.Enabled := False;
  Screen.Cursor:= crHourGlass;
  stTitle := '';
  ini_fun := TiniFile.Create(ExeFolder + '\print.ini');
  stPrintRefPath := ExeFolder + '\' ;
  stPrintRefPath := ini_fun.ReadString('ȯ�漳��','PrintRefPath',stPrintRefPath);
  stRefFileName  := ini_fun.ReadString('AS����','��������','ASListReport.xls');
  stRefFileName := stPrintRefPath + stRefFileName;
  nExcelRowStart := ini_fun.ReadInteger('AS����','������ġ',6);
  ini_fun.Free;

  aFileName:='AS����';
  SaveDialog1.FileName := aFileName;
  if SaveDialog1.Execute then
  begin
    stSaveFileName := SaveDialog1.FileName;
    if SaveDialog1.FileName <> '' then
      if Not ExcelPrintOut(sg_List,stRefFileName,stSaveFileName,True,nExcelRowStart,stTitle,False,False) then
      begin
        Screen.Cursor:= crDefault;
        btn_Excel.Enabled := True;
        Exit;
      end;
      //showmessage('���ϻ��� �Ϸ�');
  end;
  Screen.Cursor:= crDefault;
  btn_Excel.Enabled := True;
end;

function TfmGOODSASList.ExcelPrintOut(StringGrid: TAdvStringGrid;
  refFileName, SaveFileName: String; FileOut: Boolean;
  ExcelRowStart: integer; stTitle: string; bRowHeader,
  bColHeader: Boolean): Boolean;
var
  oXL, oWB, oSheet, oRng, VArray : Variant;
  nCol1,nCol2 : Integer;
  Loop : Integer;
  sCurDay,sPreDay : String;
  curDate : TDateTime;
  mergeStart :char;
  i,j,k : Integer;
  st : String;
  nColChar : integer;
  nFixCol,nFixRow : integer;

begin
  pan_gauge.Visible := True;
  Result := False;

  Try
    oXL := CreateOleObject('Excel.Application');
  Except
    showmessage('����� ������ ��ġ�� ��ǻ�Ϳ����� �����մϴ�.');
    exit;
  End;

  if FileExists(refFileName) = False then
  begin
    Showmessage(refFileName + ' ������ �����ϴ�.');
    exit;
  end;


  oXL.Workbooks.Open(refFileName);
  oXL.DisplayAlerts := False;
//  oXL.Visible := True;
  oSheet := oXL.ActiveSheet;


  with StringGrid do
  begin

    //Ÿ��Ʋ�� ����
    nCol1 := ColCount div 26;
    nCol2 := ColCount mod 26;
    if bRowHeader then
    begin
      oSheet.Range['A' + inttostr(ExcelRowStart - 1)].Value := stTitle;
      if bColHeader then nFixCol := 0
      else nFixCol := FixedCols ;
      for i:= 0 to FixedRows - 1 do
      begin
        for j:= nFixCol to ColCount - 1 do
        begin
          nColChar := j div 26;
          if j < 26 then
            oXL.Range[Chr(Ord('A') + j ) + inttostr(i+ ExcelRowStart)].Value := Cells[j,i]
          else
            oXL.Range[Chr(Ord('A') + nColChar - 1 ) + Chr(Ord('A') + j - (26 * nColChar) ) + inttostr(i+ ExcelRowStart)].Value := Cells[j,i];
        end;
      end;
      ExcelRowStart := ExcelRowStart + FixedRows ;
    end
    else    oSheet.Range['A' + inttostr(ExcelRowStart - FixedRows - 1)].Value := stTitle;

    Gauge1.MaxValue := ( RowCount - FixedRows );
    Gauge1.Progress := 0;
    for i := FixedRows to RowCount - 1 do
    begin

      if i <  RowCount - 2 then    //��ĭ�� ����
      begin
        oSheet.Range['A' + inttostr(i+ ExcelRowStart - FixedRows + 1) + ':' + Chr(Ord('A') + nCol1 ) + Chr(Ord('A') + nCol2 - 1 ) +  inttostr(i+ ExcelRowStart - FixedRows + 1)].Insert;
      end;
      Gauge1.Progress := Gauge1.Progress + 1;
      Application.ProcessMessages;
     {
      for j := 0 to ColCount - 1 do
      begin
        nColChar := j div 26;
        if j < 26 then
          oXL.Range[Chr(Ord('A') + j ) + inttostr(i+ ExcelRowStart - FixedRows)].Value := Cells[j,i]
        else
          oXL.Range[Chr(Ord('A') + nColChar - 1 ) + Chr(Ord('A') + j - (26 * nColChar) ) + inttostr(i+ ExcelRowStart - FixedRows)].Value := Cells[j,i];
        Gauge1.Progress := Gauge1.Progress + 1;
        Application.ProcessMessages;
      end;
      }
    end;
    StringGrid.CopyToClipBoard;
    oSheet.Range['A' + inttostr(ExcelRowStart - 1), 'A' + inttostr(ExcelRowStart - 1)].Select;
    oSheet.Paste;
  end;//With

  //oXL.Visible := False;
  if FileOut then  oSheet.SaveAs(SaveFileName)
  else  oSheet.PrintOut;
  //oSheet.SaveAs(ExtractFileDir(Application.ExeName) + '\WorkSch2.xls');
  oXL.ActiveWorkbook.Close(False);
  oXL.Quit;
  pan_gauge.Visible := False;
  Result := True;
end;

procedure TfmGOODSASList.CommandArrayCommandsTASExecute(Command: TCommand;
  Params: TStringList);
begin
  inherited;
  chk_user.Checked := True;
  UpdateTB_ASLIST_USERCONFIRM;
  ShowASList('');
end;

function TfmGOODSASList.UpdateTB_ASLIST_USERCONFIRM: Boolean;
var
  stSql : string;
begin
  stSql := 'update TB_ASLIST set AL_CONFIRM = ''Y'' where AL_NEXTID = ''' + Master_ID + ''' ';

  result := dmDB.ProcessExecSQL(stSql);

end;

procedure TfmGOODSASList.N1Click(Sender: TObject);
var
  stSql : string;
  stDate : string;
begin
  inherited;
  with sg_List do
  begin
    if Cells[0,Row] = '' then Exit;
    stDate := StringReplace(Cells[0,Row],'-','',[rfReplaceAll]);
    stDate := StringReplace(Cells[0,Row],':','',[rfReplaceAll]);
    stDate := StringReplace(Cells[0,Row],' ','',[rfReplaceAll]);

    stSql := 'select a.*,b.GL_NAME from TB_ASGOODSLIST a ';
    stSql := stSql + ' Left Join TB_GOODSLIST b ';
    stSql := stSql + ' ON ( a.CO_COMPANYCODE = b.CO_COMPANYCODE  ';
    stSql := stSql + ' AND a.GL_CODE = b.GL_CODE)  ';
    stSql := stSql + ' Where a.AL_DATE = ''' + stDate + ''' ';
    stSql := stSql + ' AND a.AL_CODE = ' + Cells[1,Row] + ' ';
  end;
  with ZPrintQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
  end;
  frReport2.ShowReport;
end;

procedure TfmGOODSASList.frReport2GetValue(const ParName: String;
  var ParValue: Variant);
begin
  inherited;
  with sg_List do
  begin
    if AnsiCompareText(ParName, 'aDAY') = 0 then
      ParValue := Cells[0,Row];
    if AnsiCompareText(ParName, 'aNO') = 0 then
      ParValue := Cells[1,Row];
    if AnsiCompareText(ParName, 'aCustomerName') = 0 then
      ParValue := Cells[2,Row];
    if AnsiCompareText(ParName, 'aCustomerPhone') = 0 then
      ParValue := Cells[15,Row];
    if AnsiCompareText(ParName, 'aName') = 0 then
      ParValue := Cells[4,Row];
    if AnsiCompareText(ParName, 'aZip') = 0 then
      ParValue := Cells[5,Row];
    if AnsiCompareText(ParName, 'aAddr') = 0 then
      ParValue := Cells[6,Row];
  end;

end;

initialization
  RegisterClass(TfmGOODSASList);
Finalization
  UnRegisterClass(TfmGOODSASList);

end.
