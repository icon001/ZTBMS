unit uGOODSCATALOG;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, DB, ADODB, Grids, BaseGrid, AdvGrid,
  Gauges, ExtCtrls,iniFiles,ComObj;

type
  TfmGOODSCATALOG = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label9: TLabel;
    btn_Search: TBitBtn;
    cmb_GoodsList: TComboBox;
    cmb_inOut: TComboBox;
    Label2: TLabel;
    cmb_OutType: TComboBox;
    Label3: TLabel;
    cmb_ProcessState: TComboBox;
    Label4: TLabel;
    dt_FromDate: TDateTimePicker;
    dt_toDate: TDateTimePicker;
    btn_Close: TSpeedButton;
    GroupBox2: TGroupBox;
    btn_Insert: TSpeedButton;
    btn_Out: TSpeedButton;
    btn_static: TSpeedButton;
    TempQuery: TADOQuery;
    sg_GoodsInoutList: TAdvStringGrid;
    btn_Excel: TSpeedButton;
    pan_gauge: TPanel;
    Label23: TLabel;
    Gauge1: TGauge;
    SaveDialog1: TSaveDialog;
    Label5: TLabel;
    ed_CustomerName: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_CloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure btn_ExcelClick(Sender: TObject);
    procedure btn_InsertClick(Sender: TObject);
    procedure sg_GoodsInoutListDblClick(Sender: TObject);
    procedure btn_OutClick(Sender: TObject);
    procedure btn_staticClick(Sender: TObject);
  private
    { Private declarations }
    procedure LoadGoodsList;
    procedure ShowInOutGoodsList(aSeq:string;aTopRow:integer=0);
    procedure sg_GoodsInoutListInitialize;
    Function ExcelPrintOut(StringGrid:TAdvStringGrid;refFileName,SaveFileName:String;FileOut:Boolean;ExcelRowStart:integer;stTitle:string;bRowHeader,bColHeader:Boolean):Boolean;
  public
    { Public declarations }
  end;

var
  fmGOODSCATALOG: TfmGOODSCATALOG;

implementation
uses
  uDataModule,
  uLomosUtil, uInGoods, uOutGoods, uGoodsInventory;

{$R *.dfm}

procedure TfmGOODSCATALOG.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfmGOODSCATALOG.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmGOODSCATALOG.FormShow(Sender: TObject);
begin
  LoadGoodsList;
  sg_GoodsInoutListInitialize;
  dt_toDate.Date := now;
end;

procedure TfmGOODSCATALOG.LoadGoodsList;
var
  stSql : string;
begin
  cmb_GoodsList.Clear;
  cmb_GoodsList.Items.Add('000.��ü');
  cmb_GoodsList.ItemIndex := 0;
  stSql := 'select * from TB_GOODSCATALOG ';

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
      cmb_GoodsList.Items.Add(FindField('GC_CODE').AsString + '.' + FindField('GC_NAME').AsString);
      Next;
    end;
  end;


end;

procedure TfmGOODSCATALOG.btn_SearchClick(Sender: TObject);
begin
  ShowInOutGoodsList('');
end;

procedure TfmGOODSCATALOG.ShowInOutGoodsList(aSeq:string;aTopRow: integer = 0);
var
  stSql : string;
  nRow : integer;
  nIncount : integer;
  nOutCount : integer;
begin
  sg_GoodsInoutListInitialize;

  nIncount := 0;
  nOutCount := 0;
  
  stSql := ' select a.GL_SEQ,a.GL_DATE,a.GC_CODE,b.GC_NAME,a.GL_INOUTGUBUN, ';
  stSql := stSql + ' CASE ';
  stSql := stSql + ' WHEN a.GL_INOUTGUBUN = ''1'' THEN ''�԰�'' ';
  stSql := stSql + ' WHEN a.GL_INOUTGUBUN = ''2'' THEN ''���'' ';
  stSql := stSql + ' ELSE '' '' ';
  stSql := stSql + ' END as INOUTGUBUN, ';
  stSql := stSql + ' a.GL_COUNT,b.GC_UNIT,a.GL_CUSTOMERNAME,';
  stSql := stSql + ' a.GL_CUSTOMERPHONE,a.GL_CUSTOMERADDR,a.GL_CUSTOMERPERSON,';
  stSql := stSql + ' a.GL_DELIVERYCOMPANY,a.GL_DELIVERYNUM,a.GL_DELIVERYGUBUN,';
  stSql := stSql + ' CASE ';
  stSql := stSql + ' WHEN a.GL_DELIVERYGUBUN = ''1'' THEN ''�ű��Ǹ�'' ';
  stSql := stSql + ' WHEN a.GL_DELIVERYGUBUN = ''2'' THEN ''��ⱳü'' ';
  stSql := stSql + ' ELSE '' '' ';
  stSql := stSql + ' END as DELIVERYGUBUN, ';
  stSql := stSql + ' a.GL_DELIVERYSTATE,';
  stSql := stSql + ' CASE ';
  stSql := stSql + ' WHEN a.GL_DELIVERYSTATE = ''1'' THEN ''�߼ۿ�û'' ';
  stSql := stSql + ' WHEN a.GL_DELIVERYSTATE = ''2'' THEN ''����'' ';
  stSql := stSql + ' WHEN a.GL_DELIVERYSTATE = ''3'' THEN ''�߼���'' ';
  stSql := stSql + ' WHEN a.GL_DELIVERYSTATE = ''4'' THEN ''�߼ۿϷ�'' ';
  stSql := stSql + ' WHEN a.GL_DELIVERYSTATE = ''5'' THEN ''���ſϷ�'' ';
  stSql := stSql + ' ELSE '' '' ';
  stSql := stSql + ' END as DELIVERYSTATE,a.GC_CERTICODE,c.GC_CERTINAME ';
  stSql := stSql + ' from TB_GOODSINOUTLIST a ';
  stSql := stSql + ' Left Join TB_GOODSCATALOG b ';
  stSql := stSql + ' ON ( a.GC_CODE = b.GC_CODE ) ';
  stSql := stSql + ' Left Join TB_GOODSCERTIFICATE c ';
  stSql := stSql + ' ON ( a.GC_CERTICODE = c.GC_CERTICODE ) ';
  stSql := stSql + ' Where a.GL_DATE Between ''' + FormatDateTime('yyyymmdd',dt_FromDate.date) + ''' ';
  stSql := stSql + ' AND ''' + FormatDateTime('yyyymmdd',dt_toDate.date) + ''' ';
  if cmb_GoodsList.ItemIndex > 0 then
  begin
    stSql := stSql + ' AND a.GC_CODE = ''' + copy(cmb_GoodsList.Text,1,3) + ''' ';
  end;
  if cmb_inOut.ItemIndex > 0 then
  begin
    stSql := stSql + ' AND a.GL_INOUTGUBUN = ''' + copy(cmb_inOut.Text,1,1) + ''' ';
  end;
  if cmb_OutType.ItemIndex > 0 then
  begin
    stSql := stSql + ' AND a.GL_DELIVERYGUBUN = ''' + copy(cmb_OutType.Text,1,1) + ''' ';
  end;
  if cmb_ProcessState.ItemIndex > 0 then
  begin
    stSql := stSql + ' AND a.GL_DELIVERYSTATE = ''' + copy(cmb_ProcessState.Text,1,1) + ''' ';
  end;
  if Trim(ed_CustomerName.Text) <> '' then
  begin
    stSql := stSql + ' AND a.GL_CUSTOMERNAME Like ''%' + Trim(ed_CustomerName.Text) + '%'' ';
  end;
  stSql := stSql + ' order by a.GL_DATE DESC';

  with sg_GoodsInoutList do
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
        cells[0,nRow] := inttostr(FindField('GL_SEQ').asinteger);
        cells[1,nRow] := FindField('GL_DATE').AsString;
        cells[2,nRow] := FindField('GC_NAME').AsString;
        cells[3,nRow] := FindField('INOUTGUBUN').AsString;
        cells[4,nRow] := inttostr(FindField('GL_COUNT').asinteger);
        if cells[3,nRow] = '�԰�' then nIncount := nIncount + FindField('GL_COUNT').asinteger
        else nOutCount := nOutCount + FindField('GL_COUNT').asinteger;
        cells[5,nRow] := FindField('GC_UNIT').AsString;
        cells[6,nRow] := FindField('GL_CUSTOMERNAME').AsString;
        cells[7,nRow] := FindField('GL_CUSTOMERPHONE').AsString;
        cells[8,nRow] := FindField('GL_CUSTOMERADDR').AsString;
        cells[9,nRow] := FindField('GL_CUSTOMERPERSON').AsString;
        cells[10,nRow] := FindField('GL_DELIVERYCOMPANY').AsString;
        cells[11,nRow] := FindField('GL_DELIVERYNUM').AsString;
        cells[12,nRow] := FindField('DELIVERYGUBUN').AsString;
        cells[13,nRow] := FindField('DELIVERYSTATE').AsString;
        cells[14,nRow] := FindField('GC_CODE').AsString;
        cells[15,nRow] := FindField('GL_INOUTGUBUN').AsString;
        cells[16,nRow] := FindField('GL_DELIVERYGUBUN').AsString;
        cells[17,nRow] := FindField('GL_DELIVERYSTATE').AsString;
        cells[18,nRow] := FindField('GC_CERTINAME').AsString;
        cells[19,nRow] := FindField('GC_CERTICODE').AsString;

        if cells[15,nRow] = '1' then
        begin
          RowColor[nRow] := clYellow;
        end else
        begin
          if cells[16,nRow] = '1' then
          begin
            if cells[17,nRow] = '1' then RowColor[nRow] := clBlue;
          end else if cells[16,nRow] = '2' then
          begin
            if cells[17,nRow] = '1' then RowColor[nRow] := clBlue
            else if cells[17,nRow] = '4' then RowColor[nRow] := clRed;
          end;
        end;
        if aSeq = cells[0,nRow] then
        begin
          SelectRows(nRow,1);
        end;
        inc(nRow);
        Next;
      end;
      if aTopRow <> 0 then TopRow := aTopRow;
    end;

    if nIncount <> 0 then
    begin
      rowcount := rowcount + 1;
      cells[3,rowcount-1] := '�԰��հ�';
      cells[4,rowcount-1] := inttostr(nIncount);
    end;
    if nOutcount <> 0 then
    begin
      rowcount := rowcount + 1;
      cells[3,rowcount-1] := '����հ�';
      cells[4,rowcount-1] := inttostr(nOutcount);
    end;
  end;

end;

procedure TfmGOODSCATALOG.sg_GoodsInoutListInitialize;
begin
  with sg_GoodsInoutList do
  begin
    Clear;
    Rowcount := 2;
    cells[0,0] := '����';
    cells[1,0] := '��¥';
    cells[2,0] := '��ǰ��';
    cells[3,0] := '��/�����';
    cells[4,0] := '����';
    cells[5,0] := '����';
    cells[6,0] := '�ŷ�ó��';
    cells[7,0] := '�ŷ�ó��ȭ��ȣ';
    cells[8,0] := '�ŷ�ó�ּ�';
    cells[9,0] := '�ŷ�ó�����';
    cells[10,0] := '�ù���';
    cells[11,0] := '�ù��ȣ';
    cells[12,0] := '���Ÿ��';
    cells[13,0] := 'ó������';
    cells[14,0] := '��ǰ�ڵ�';
    cells[15,0] := '��/������ڵ�';
    cells[16,0] := '���Ÿ���ڵ�';
    cells[17,0] := 'ó�������ڵ�';
    cells[18,0] := '�μ�������';
    cells[19,0] := '�μ����ڵ�';
    ColWidths[0] := 0;
    ColWidths[14] := 0;
    ColWidths[15] := 0;
    ColWidths[16] := 0;
    ColWidths[17] := 0;
    ColWidths[19] := 0;
  end;
end;

procedure TfmGOODSCATALOG.btn_ExcelClick(Sender: TObject);
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
  stRefFileName  := ini_fun.ReadString('��ǰ����','��������','GoodsReport.xls');
  stRefFileName := stPrintRefPath + stRefFileName;
  nExcelRowStart := ini_fun.ReadInteger('��ǰ����','������ġ',6);
  ini_fun.Free;

  aFileName:='��ǰ����';
  SaveDialog1.FileName := aFileName;
  if SaveDialog1.Execute then
  begin
    stSaveFileName := SaveDialog1.FileName;
    if SaveDialog1.FileName <> '' then
      if Not ExcelPrintOut(sg_GoodsInoutList,stRefFileName,stSaveFileName,True,nExcelRowStart,stTitle,False,False) then
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

function TfmGOODSCATALOG.ExcelPrintOut(StringGrid: TAdvStringGrid;
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

procedure TfmGOODSCATALOG.btn_InsertClick(Sender: TObject);
begin
  fmInGoods:= TfmInGoods.Create(Self);
  fmInGoods.L_stType := 'INSERT';
  fmInGoods.SHowmodal;
  fmInGoods.Free;
  ShowInOutGoodsList('',sg_GoodsInoutList.TopRow);

end;

procedure TfmGOODSCATALOG.sg_GoodsInoutListDblClick(Sender: TObject);
begin
  with sg_GoodsInoutList do
  begin
    if cells[15,Row] = '1' then //
    begin
      fmInGoods:= TfmInGoods.Create(Self);
      fmInGoods.L_stType := 'UPDATE';
      fmInGoods.L_stGoodsSeq := cells[0,Row];
      fmInGoods.L_stGoodsCode := cells[14,Row];
      fmInGoods.dt_Date.Date := strtoDate(copy(Cells[1,Row],1,4) + '-' + copy(Cells[1,Row],5,2) + '-' + copy(Cells[1,Row],7,2) );
      fmInGoods.ed_GoodsCount.Text := cells[4,Row];
      fmInGoods.ed_customername.Text := cells[6,Row];
      fmInGoods.ed_customerphone.Text := cells[7,Row];
      fmInGoods.ed_customeraddr.Text := cells[8,Row];
      fmInGoods.ed_customerperson.Text := cells[9,Row];
      fmInGoods.SHowmodal;
      fmInGoods.Free;
      ShowInOutGoodsList(cells[0,Row],sg_GoodsInoutList.TopRow);
    end else
    begin
      fmOutGoods:= TfmOutGoods.Create(Self);
      fmOutGoods.L_stType := 'UPDATE';
      fmOutGoods.L_stGoodsSeq := cells[0,Row];
      fmOutGoods.L_stGoodsCode := cells[14,Row];
      fmOutGoods.L_stCERTICode := cells[19,Row];
      fmOutGoods.dt_Date.Date := strtoDate(copy(Cells[1,Row],1,4) + '-' + copy(Cells[1,Row],5,2) + '-' + copy(Cells[1,Row],7,2) );
      fmOutGoods.ed_GoodsCount.Text := cells[4,Row];
      fmOutGoods.ed_customername.Text := cells[6,Row];
      fmOutGoods.ed_customerphone.Text := cells[7,Row];
      fmOutGoods.ed_customeraddr.Text := cells[8,Row];
      fmOutGoods.ed_customerperson.Text := cells[9,Row];
      if IsDigit(cells[16,Row]) then
        fmOutGoods.cmb_DELIVERYGUBUN.ItemIndex := strtoint(cells[16,Row]);
      if IsDigit(cells[17,Row]) then
        fmOutGoods.cmb_ProcessState.ItemIndex := strtoint(cells[17,Row]);
      fmOutGoods.ed_DELIVERYCOMPANY.Text := cells[10,Row];
      fmOutGoods.ed_DELIVERYNUM.Text := cells[11,Row];
      fmOutGoods.SHowmodal;
      fmOutGoods.Free;
      ShowInOutGoodsList(cells[0,Row],sg_GoodsInoutList.TopRow);
    end;
  end;
end;

procedure TfmGOODSCATALOG.btn_OutClick(Sender: TObject);
begin
  fmOutGoods:= TfmOutGoods.Create(Self);
  fmOutGoods.L_stType := 'INSERT';
  fmOutGoods.SHowmodal;
  fmOutGoods.Free;
  ShowInOutGoodsList('',sg_GoodsInoutList.TopRow);
end;

procedure TfmGOODSCATALOG.btn_staticClick(Sender: TObject);
begin
  fmGoodsInventory:= TfmGoodsInventory.Create(Self);
  fmGoodsInventory.SHowmodal;
  fmGoodsInventory.Free;

end;

initialization
  RegisterClass(TfmGOODSCATALOG);
Finalization
  UnRegisterClass(TfmGOODSCATALOG);

end.
