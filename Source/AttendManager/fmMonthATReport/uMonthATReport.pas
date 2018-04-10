unit uMonthATReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, Gauges, Grids, BaseGrid,
  AdvGrid, uSubForm, CommandArray, DB, ADODB,iniFiles,ComObj,ActiveX,
  AdvObj;

type
  TfmMonthATReport = class(TfmASubForm)
    Panel1: TPanel;
    GroupBox5: TGroupBox;
    btn_Excel: TSpeedButton;
    btn_Print: TSpeedButton;
    btn_Search: TSpeedButton;
    btn_Close: TSpeedButton;
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
    GroupBox2: TGroupBox;
    dt_Date: TDateTimePicker;
    Label1: TLabel;
    GroupBox3: TGroupBox;
    sg_report: TAdvStringGrid;
    pan_gauge: TPanel;
    Label2: TLabel;
    Gauge1: TGauge;
    SaveDialog1: TSaveDialog;
    ADOQuery: TADOQuery;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cmb_CompanyChange(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure cmb_JijumChange(Sender: TObject);
    procedure cmb_DepartChange(Sender: TObject);
    procedure cmb_PosiChange(Sender: TObject);
    procedure sg_reportColChanging(Sender: TObject; OldCol,
      NewCol: Integer; var Allow: Boolean);
    procedure sg_reportExit(Sender: TObject);
    procedure sg_reportKeyPress(Sender: TObject; var Key: Char);
    procedure sg_reportCellChanging(Sender: TObject; OldRow, OldCol,
      NewRow, NewCol: Integer; var Allow: Boolean);
    procedure btn_ExcelClick(Sender: TObject);
    procedure btn_PrintClick(Sender: TObject);
    procedure sg_reportResize(Sender: TObject);
  private
    CompanyCodeList : TStringList;
    JijumCodeList : TStringList;
    DepartCodeList : TStringList;
    PosiCodeList : TStringList;
    { Private declarations }
    procedure GridMerge;
    Function SearchMonthATReport(aCode:string):Boolean;
    Function CheckTB_ATMONTHEXTRA(aMonth,aCompanyCode,aEmCode,aExtraName:string):Boolean;
    Function UpdateTB_ATMONTHEXTRAName(aMonth,aCompanyCode,aEmCode,aOldExtraName,aNewExtraName:string):Boolean;
    Function UpdateTB_ATMONTHEXTRAAmt(aMonth,aCompanyCode,aEmCode,aExtraName,aExtraAmt:string):Boolean;
    Function DeleteTB_ATMONTHEXTRA(aMonth,aCompanyCode,aEmCode,aExtraName:string):Boolean;
    Function InsertIntoTB_ATMONTHEXTRA(aMonth,aCompanyCode,aEmCode,aExtraName,aExtraAmt:string):Boolean;

    procedure RefreshTotalAmt(aRow:integer);
    procedure GetExtraSearch(aMonth,aCompanyCode,aEmCode:string;aRow:integer);

    Function GetTitle:string;

  public
    { Public declarations }
  end;

var
  fmMonthATReport: TfmMonthATReport;

implementation
uses
     uDataModule1,
     uCompanyCodeLoad,
     uLomosUtil, uMssql, uPostGreSql, uMDBSql, uExcelSave;

{$R *.dfm}

procedure TfmMonthATReport.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmMonthATReport.FormShow(Sender: TObject);
begin
  GridInit(sg_Report,15,sg_Report.FixedRows + 1);
  GridMerge;
end;

procedure TfmMonthATReport.GridMerge;
begin
  with sg_report do
  begin
    MergeCells(0,1,1,4);
    MergeCells(1,1,1,4);
    MergeCells(2,1,1,4);
    MergeCells(3,1,1,4);
    MergeCells(4,1,1,4);
    MergeCells(5,1,1,4);
    MergeCells(9,1,1,4);
    MergeCells(12,1,1,4);
    MergeCells(13,1,1,4);
    MergeCells(14,1,1,4);

    MergeCells(0,0,6,1);
    MergeCells(10,0,2,1);
    MergeCells(12,0,2,1);

    Cells[0,0] := '�⺻����';
    Cells[0,1] := 'ȸ��';
    Cells[1,1] := '����';
    Cells[2,1] := '�μ�';
    Cells[3,1] := '����';
    Cells[4,1] := '���';
    Cells[5,1] := '�̸�';

    Cells[6,0] := '�Ⱓ';
    Cells[6,1] := '���ϼ�';
    Cells[6,2] := '�������ϼ�';
    Cells[6,3] := '��ٰ����ϼ�';

    Cells[7,0] := '�ٹ�';
    Cells[7,1] := '����ϼ�';
    Cells[7,2] := '�����ϼ�';
    Cells[7,3] := '�����ϼ�';
    Cells[7,4] := '����ϼ�';

    Cells[8,0] := '�ް�';
    Cells[8,1] := '�����ް�';
    MergeCells(8,1,1,2);
    Cells[8,3] := '�����ް�';
    MergeCells(8,3,1,2);

    Cells[9,0] := '�޿�';
    Cells[9,1] := '�⺻�޿�';

    Cells[10,0] := '�ð��ܱٹ�';
    Cells[10,1] := '����ٹ��ð�';
    Cells[10,2] := '����ٹ��ð�';
    Cells[10,3] := '�߰��ٹ��ð�';
    Cells[10,4] := '���ϱٹ��ð�';
    Cells[11,1] := '����ٹ�����';
    Cells[11,2] := '����ٹ�����';
    Cells[11,3] := '�߰��ٹ�����';
    Cells[11,4] := '���ϱٹ�����';

    Cells[12,0] := '��Ÿ';
    Cells[12,1] := '�����Ī';
    Cells[13,1] := '����ݾ�';
    Cells[14,0] := '�Ѿ�';
    Cells[14,1] := '�ѱ޿���';
//    Cells[16,1] := '�޿��Ѿ�';
//    MergeCells(16,1,1,4);
  end;
end;

procedure TfmMonthATReport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CompanyCodeList.Free;
  JijumCodeList.Free;
  DepartCodeList.Free;
  PosiCodeList.Free;
  Action := caFree;

end;

procedure TfmMonthATReport.FormActivate(Sender: TObject);
var
  nIndex : integer;
begin
  dt_Date.Date := Now;

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

  btn_SearchClick(btn_Search);

end;

procedure TfmMonthATReport.FormCreate(Sender: TObject);
begin
  CompanyCodeList := TStringList.Create;
  JijumCodeList := TStringList.Create;
  DepartCodeList := TStringList.Create;
  PosiCodeList := TStringList.Create;

end;

procedure TfmMonthATReport.cmb_CompanyChange(Sender: TObject);
begin
  LoadJijumCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],JijumCodeList,cmb_Jijum);
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
  LoadPosiCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],PosiCodeList,cmb_Posi);
  btn_SearchClick(btn_Search);

end;

procedure TfmMonthATReport.btn_SearchClick(Sender: TObject);
begin
  SearchMonthATReport('');

end;

function TfmMonthATReport.SearchMonthATReport(aCode: string): Boolean;
var
  stSql : string;
  i :integer;
  nRow : integer;
  nFirstRow : integer; //�����ϴ� ��
  stInTime,stOutTime : string;
  stLeaveTime,stBackTime : string;
  nInfromMM,nExtendMM,nNightMM,nRealMM:integer;
  nInfromAMT,nExtendAMT,nNightAMT:integer;
  nCount:integer;
begin
  result := False;
  nInfromMM := 0;
  nExtendMM := 0;
  nNightMM := 0;
  nRealMM := 0;
  nInfromAMT := 0;
  nExtendAMT := 0;
  nNightAMT := 0;
  nCount:= 0;

  RowGridInitialize(sg_Report,sg_Report.FixedRows + 1);

  if DBTYPE = 'MSSQL' then
    stSql := MSSQL.SelectTB_EMPLOYEEJoinATMONTHSUMMARY(FormatDateTime('yyyymm',dt_Date.Date))
  else if DBType = 'PG' then
    stSql := PostGreSql.SelectTB_EMPLOYEEJoinATMONTHSUMMARY(FormatDateTime('yyyymm',dt_Date.Date))
  else if DBType = 'MDB' then
    stSql := MDBSql.SelectTB_EMPLOYEEJoinATMONTHSUMMARY(FormatDateTime('yyyymm',dt_Date.Date))
  else Exit;
{
  stSql := 'Select a.EM_NAME,';
  stSql := stSql + ' c.CO_NAME as COMPANY_NAME,d.CO_NAME as JIJUM_NAME,e.CO_NAME as DEPART_NAME,';
  stSql := stSql + ' I.PO_NAME,b.*';
  stSql := stSql + ' from TB_EMPLOYEE a  ';
  stSql := stSql + ' Inner Join TB_ATMONTHSUMMARY b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.EM_CODE = b.EM_CODE  ';
  stSql := stSql + ' AND b.AT_MONTH = ''' + FormatDateTime('yyyymm',dt_Date.Date) + ''')  ';
  stSql := stSql + ' Left Join TB_COMPANY c ';
  stSql := stSql + ' ON (a.Group_Code = c.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = c.CO_COMPANYCODE ';
  stSql := stSql + ' AND c.CO_GUBUN = ''1'') ';
  stSql := stSql + ' Left Join TB_COMPANY d ';
  stSql := stSql + ' ON (a.Group_Code = d.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = d.CO_COMPANYCODE  ';
  stSql := stSql + ' AND a.CO_JIJUMCODE = d.CO_JIJUMCODE  ';
  stSql := stSql + ' AND d.CO_GUBUN = ''2'') ';
  stSql := stSql + ' Left Join TB_COMPANY e ';
  stSql := stSql + ' ON (a.Group_Code = e.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = e.CO_COMPANYCODE  ';
  stSql := stSql + ' AND a.CO_JIJUMCODE = e.CO_JIJUMCODE  ';
  stSql := stSql + ' AND a.CO_DEPARTCODE = e.CO_DEPARTCODE  ';
  stSql := stSql + ' AND e.CO_GUBUN = ''3'') ';
  stSql := stSql + ' Left Join TB_POSI I ';
  stSql := stSql + ' ON (a.GROUP_CODE = I.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = I.CO_COMPANYCODE  ';
  stSql := stSql + ' AND a.PO_POSICODE = I.PO_POSICODE)  ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
 }

  if (Not IsMaster) and (CompanyGrade <> '0') then
  begin
    if CompanyGrade = '1' then
    begin
      if cmb_Company.ItemIndex < 1 then
      begin
        if CompanyCodeList.Count < 2 then
        begin
          showmessage('�����Ҽ� �ִ� ȸ�� ������ �����ϴ�.');
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
        showmessage('������ �Ҽ� ȸ���ڵ尡 �̻��մϴ�.');
        Exit;
      end;
      stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + CompanyCodeList.Strings[cmb_Company.ItemIndex] + ''' ';
      if cmb_Jijum.ItemIndex < 1 then
      begin
        if JijumCodeList.Count < 2 then
        begin
          showmessage('�����Ҽ� �ִ� ���� ������ �����ϴ�.');
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
        showmessage('������ �Ҽ� ȸ���ڵ尡 �̻��մϴ�.');
        Exit;
      end;
      stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + CompanyCodeList.Strings[cmb_Company.ItemIndex] + ''' ';
      if cmb_Jijum.ItemIndex < 1 then
      begin
        showmessage('������ �Ҽ� �����ڵ尡 �̻��մϴ�.');
        Exit;
      end;
      stSql := stSql + ' AND a.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3) + ''' ';
      if cmb_Depart.ItemIndex < 1 then
      begin
        if DepartCodeList.Count < 2 then
        begin
          showmessage('�����Ҽ� �ִ� �μ� ������ �����ϴ�.');
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
    stSql := stSql + ' AND a.EM_NAME LIKE ''' + Trim(ed_name.Text)  + '%'' ';

  stSql := stSql + ' Order By a.CO_COMPANYCODE,a.CO_JIJUMCODE,a.CO_DEPARTCODE,a.EM_CODE ';

  with ADOQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then
    begin
      showmessage('��ȸ�� �����Ͱ� �����ϴ�.���������۾��� ��ȸ �����մϴ�.');
      Exit;
    end;
    nCount:= RecordCount;

    sg_report.RowCount := sg_report.FixedRows + (nCount * 4);
    nRow := sg_report.FixedRows;
    While Not Eof do
    begin
      nFirstRow := nRow;
      with sg_Report do
      begin
        MergeCells(0,nRow,1,4);
        MergeCells(1,nRow,1,4);
        MergeCells(2,nRow,1,4);
        MergeCells(3,nRow,1,4);
        MergeCells(4,nRow,1,4);
        MergeCells(5,nRow,1,4);
        Cells[0,nRow] := FindField('COMPANY_NAME').AsString;
        Cells[1,nRow] := FindField('JIJUM_NAME').AsString;
        Cells[2,nRow] := FindField('DEPART_NAME').AsString;
        Cells[3,nRow] := FindField('PO_NAME').AsString;
        Cells[4,nRow] := FindField('EM_CODE').AsString;
        Cells[5,nRow] := FindField('EM_NAME').AsString;
        Cells[6,nRow] := FindField('AT_TOTDAYCOUNT').AsString + '��'; //�� �ѱ����ϼ�
        Cells[7,nRow] := FindField('AT_INCOUNT').AsString + '��'; //����ϼ�
        MergeCells(8,nRow,1,2);
        Cells[8,nRow] := FindField('AT_PAYVACOUNT').AsString + '��'; //�����ް�
        MergeCells(9,nRow,1,4);
        Cells[9,nRow] := WonStringFormat(FindField('AT_WORKAMT').AsString) + '��' ;   //�⺻�޿�
        Cells[10,nRow] := MinuteToString(FindField('AT_INFROMMM').AsInteger);  //����ٹ��ð�
        Cells[11,nRow] := WonStringFormat(FindField('AT_INFROMAMT').AsString) + '��' ;   //����ٹ�����
        MergeCells(14,nRow,1,4); //�ѱݾ�
        Cells[14,nRow] := WonStringFormat(inttostr(FindField('AT_WORKAMT').AsInteger +
                                                   FindField('AT_INFROMAMT').AsInteger +
                                                   FindField('AT_EXTENDAMT').AsInteger +
                                                   FindField('AT_NIGHTAMT').AsInteger +
                                                   FindField('AT_HOLIDAYAMT').AsInteger
                                                   )
                                          ) + '��';   //�ѱݾ�
        Cells[15,nRow] := inttostr(FindField('AT_WORKAMT').AsInteger +
                                                   FindField('AT_INFROMAMT').AsInteger +
                                                   FindField('AT_EXTENDAMT').AsInteger +
                                                   FindField('AT_NIGHTAMT').AsInteger +
                                                   FindField('AT_HOLIDAYAMT').AsInteger
                                                   );
        Cells[16,nRow] := FindField('CO_COMPANYCODE').AsString;
        Cells[17,nRow] := FindField('EM_CODE').AsString;

        nRow := nRow + 1;
        Cells[6,nRow] := FindField('AT_HOLIDAYCOUNT').AsString + '��'; //������ �ϼ�
        Cells[7,nRow] := FindField('AT_JIKAGCOUNT').AsString + '��'; //���� �ϼ�
        Cells[10,nRow] := MinuteToString(FindField('AT_EXTENDMM').AsInteger);  //����ٹ��ð�
        Cells[11,nRow] := WonStringFormat(FindField('AT_EXTENDAMT').AsString) + '��' ;   //����ٹ�����

        nRow := nRow + 1;
        Cells[6,nRow] := FindField('AT_ATTENDDAYCOUNT').AsString + '��'; //��ٰ��� �ϼ�
        Cells[7,nRow] := FindField('AT_JOTAECOUNT').AsString + '��'; //���� �ϼ�
        MergeCells(8,nRow,1,2);
        Cells[8,nRow] := FindField('AT_NONPAYVACOUNT').AsString + '��'; //�����ް�
        Cells[10,nRow] := MinuteToString(FindField('AT_NIGHTMM').AsInteger);  //�߰��ٹ��ð�
        Cells[11,nRow] := WonStringFormat(FindField('AT_NIGHTAMT').AsString) + '��' ;   //�߰��ٹ�����

        nRow := nRow + 1;
        Cells[7,nRow] := FindField('AT_NONATCOUNT').AsString + '��'; //��� �ϼ�
        Cells[10,nRow] := MinuteToString(FindField('AT_HOLIDAYMM').AsInteger);  //���ϱٹ��ð�
        Cells[11,nRow] := WonStringFormat(FindField('AT_HOLIDAYAMT').AsString) + '��' ;   //���ϱٹ�����

        GetExtraSearch(FormatDateTime('yyyymm',dt_Date.Date),FindField('CO_COMPANYCODE').AsString,
                       FindField('EM_CODE').AsString,nFirstRow);
        RefreshTotalAmt(nFirstRow);

      end;
      nRow := nRow + 1;
      Next;
    end;
{    //�հ� �Է�
    with sg_Report do
    begin
      RowCount := RowCount + 1;
      nRow := RowCount - 1;
      Cells[0,nRow] := '�հ�';
      Cells[6,nRow] := WonStringFormat(inttostr(nCount)) + '��';
      Cells[8,nRow] := WonStringFormat(inttostr(nLeaveCount)) + '��';     //����
      Cells[9,nRow] := WonStringFormat(inttostr(nBackCount)) + '��';     //����
      Cells[14,nRow] := MinuteToString(nInfromMM) ;
      Cells[15,nRow] := MinuteToString(nExtendMM) ;
      Cells[16,nRow] := MinuteToString(nNightMM);
      Cells[17,nRow] := MinuteToString(nRealMM);
      Cells[18,nRow] := WonStringFormat(inttostr(nInfromAMT)) + '��';
      Cells[19,nRow] := WonStringFormat(inttostr(nExtendAMT)) + '��';
      Cells[20,nRow] := WonStringFormat(inttostr(nNightAMT)) + '��'; 

    end; }
  end;
end;

procedure TfmMonthATReport.cmb_JijumChange(Sender: TObject);
begin
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
  btn_SearchClick(Self);

end;

procedure TfmMonthATReport.cmb_DepartChange(Sender: TObject);
begin
  btn_SearchClick(Self);

end;

procedure TfmMonthATReport.cmb_PosiChange(Sender: TObject);
begin
  btn_SearchClick(Self);

end;

procedure TfmMonthATReport.sg_reportColChanging(Sender: TObject; OldCol,
  NewCol: Integer; var Allow: Boolean);
begin
  with sg_report do
  begin
    if (NewCol = 12) or (NewCol = 13) then
    begin
      Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goRangeSelect,goDrawFocusSelected,goColSizing,goEditing];
    end
    else Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goRangeSelect,goDrawFocusSelected,goColSizing] ;
  end;

end;

procedure TfmMonthATReport.sg_reportExit(Sender: TObject);
var
  bResult : Boolean;
begin
  with sender as TStringGrid do
  begin
    sg_reportCellChanging(sender,Row,Col,Row,Col,bResult);
  end;

end;

procedure TfmMonthATReport.sg_reportKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key <> #13 then exit;
  Key := #0;

  with sg_report do
  begin
    if (ColCount -  2) > Col then
      SelectRange(Col + 1,Col + 1,Row,Row);
  end;
end;

procedure TfmMonthATReport.sg_reportCellChanging(Sender: TObject; OldRow,
  OldCol, NewRow, NewCol: Integer; var Allow: Boolean);
var
  nRow:integer;
  stCompanyCode : string;
  stEmCode : string;
  stAmt : string;
begin
  with sg_report do
  begin
    if OldCol = 12 then
    begin
      nRow := (OldRow - FixedRows) div 4;
      nRow := FixedRows + ( nRow * 4);
      stCompanyCode := Cells[16,nRow];
      stEmCode := Cells[17,nRow];
      if Cells[18,OldRow] <> Cells[OldCol,OldRow] then
      begin
        if Trim(Cells[OldCol,OldRow]) = '' then
        begin
          if (Application.MessageBox(PChar(Cells[18,OldRow] + ' �����͸� �����Ͻðڽ��ϱ�?'),'����',MB_OKCANCEL) = ID_CANCEL)  then
          begin
            Cells[OldCol,OldRow] := Cells[18,OldRow];
            Exit;
          end;
          if Not DeleteTB_ATMONTHEXTRA(FormatDateTime('yyyymm',dt_Date.DateTime),stCompanyCode,stEmCode,Cells[18,OldRow]) then
          begin
            showmessage('������ ���� �߽��ϴ�');
            Cells[OldCol,OldRow] := Cells[18,OldRow];
            Exit;
          end;
          Cells[18,OldRow] := '';
          Cells[OldCol + 1,OldRow] := '';
          RefreshTotalAmt(nRow);
          Exit;
        end;
        if CheckTB_ATMONTHEXTRA(FormatDateTime('yyyymm',dt_Date.DateTime),stCompanyCode,stEmCode,Cells[18,OldRow]) then
           UpdateTB_ATMONTHEXTRAName(FormatDateTime('yyyymm',dt_Date.DateTime),stCompanyCode,stEmCode,Cells[18,OldRow],Cells[OldCol,OldRow])
        else
        begin
          if Not InsertIntoTB_ATMONTHEXTRA(FormatDateTime('yyyymm',dt_Date.DateTime),stCompanyCode,stEmCode,Cells[OldCol,OldRow],'0') then
          begin
            showmessage('���濡 �����Ͽ����ϴ�.');
            Cells[OldCol,OldRow] := Cells[18,OldRow];
            Exit;
          end;
        end; 
        Cells[18,OldRow] := Cells[OldCol,OldRow];
      end;
    end
    else
    if OldCol = 13 then
    begin
      //if Trim(Cells[OldCol,OldRow]) = '' then Cells[OldCol,OldRow] := '0';
      nRow := (OldRow - FixedRows) div 4;
      nRow := FixedRows + ( nRow * 4);
      stCompanyCode := Cells[16,nRow];
      stEmCode := Cells[17,nRow];
      stAmt := Cells[OldCol,OldRow];
      stAmt := StringReplace(stAmt,',','',[rfReplaceAll]);
      stAmt := StringReplace(stAmt,'��','',[rfReplaceAll]);
      if Trim(stAmt) = '' then stAmt := '0';
      if Not CheckTB_ATMONTHEXTRA(FormatDateTime('yyyymm',dt_Date.DateTime),stCompanyCode,stEmCode,Cells[12,OldRow]) then
      begin
        if Trim(Cells[OldCol,OldRow]) <> '' then
        begin
          showmessage(Cells[12,OldRow] + ' ������ ��ϵ��� �ʾҽ��ϴ�.');
          Cells[OldCol,OldRow] := '';
        end;
        Exit;
      end;
      UpdateTB_ATMONTHEXTRAAmt(FormatDateTime('yyyymm',dt_Date.DateTime),stCompanyCode,stEmCode,Cells[OldCol - 1,OldRow],stAmt);
      RefreshTotalAmt(nRow);
      Cells[OldCol,OldRow] := WonStringFormat(stAmt) + '��';
    end;
  end;

end;

function TfmMonthATReport.CheckTB_ATMONTHEXTRA(aMonth, aCompanyCode,
  aEmCode, aExtraName: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;

begin
  result := False;
  stSql := 'select * from TB_ATMONTHEXTRA ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_MONTH = ''' + aMonth + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';
  stSql := stSql + ' AND AT_EXTRANAME = ''' + aExtraName + ''' ';

  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;
  with TempAdoQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Text := stSql;

    Try
      Open;
    Except
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;

    if RecordCount > 0 then
    begin
      Result:= True;
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

function TfmMonthATReport.UpdateTB_ATMONTHEXTRAName(aMonth, aCompanyCode,
  aEmCode, aOldExtraName, aNewExtraName: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Update TB_ATMONTHEXTRA set AT_EXTRANAME = ''' + aNewExtraName + ''' ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_MONTH = ''' + aMonth + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';
  stSql := stSql + ' AND AT_EXTRANAME = ''' + aOldExtraName + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmMonthATReport.InsertIntoTB_ATMONTHEXTRA(aMonth, aCompanyCode,
  aEmCode, aExtraName, aExtraAmt: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_ATMONTHEXTRA(';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'AT_MONTH,';
  stSql := stSql + 'CO_COMPANYCODE,';
  stSql := stSql + 'EM_CODE,';
  stSql := stSql + 'AT_EXTRANAME,';
  stSql := stSql + 'AT_EXTRAAMT )';
  stSql := stSql + ' Values(';
  stSql := stSql + '''' + GROUPCODE + ''', ';
  stSql := stSql + '''' + aMonth + ''', ';
  stSql := stSql + '''' + aCompanyCode + ''', ';
  stSql := stSql + '''' + aEmCode + ''', ';
  stSql := stSql + '''' + aExtraName + ''', ';
  stSql := stSql + aExtraAmt + ')';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmMonthATReport.UpdateTB_ATMONTHEXTRAAmt(aMonth, aCompanyCode,
  aEmCode, aExtraName, aExtraAmt: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Update TB_ATMONTHEXTRA set AT_EXTRAAMT = ' + aExtraAmt ;
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_MONTH = ''' + aMonth + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';
  stSql := stSql + ' AND AT_EXTRANAME = ''' + aExtraName + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmMonthATReport.DeleteTB_ATMONTHEXTRA(aMonth, aCompanyCode,
  aEmCode, aExtraName: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Delete From TB_ATMONTHEXTRA ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_MONTH = ''' + aMonth + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';
  stSql := stSql + ' AND AT_EXTRANAME = ''' + aExtraName + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmMonthATReport.RefreshTotalAmt(aRow: integer);
var
  nBaseTotal : integer;
  stExtraAmt1 : string;
  stExtraAmt2 : string;
  stExtraAmt3 : string;
  stExtraAmt4 : string;
  nTotalAmt : integer;
begin
  with sg_Report do
  begin
    if Not isDigit(Cells[15,aRow]) then Cells[15,aRow] := '0';
    stExtraAmt1 := Cells[13,aRow];
    stExtraAmt2 := Cells[13,aRow + 1];
    stExtraAmt3 := Cells[13,aRow + 2];
    stExtraAmt4 := Cells[13,aRow + 3];
    stExtraAmt1 := StringReplace(stExtraAmt1,',','',[rfReplaceAll]);
    stExtraAmt1 := StringReplace(stExtraAmt1,'��','',[rfReplaceAll]);
    stExtraAmt2 := StringReplace(stExtraAmt2,',','',[rfReplaceAll]);
    stExtraAmt2 := StringReplace(stExtraAmt2,'��','',[rfReplaceAll]);
    stExtraAmt3 := StringReplace(stExtraAmt3,',','',[rfReplaceAll]);
    stExtraAmt3 := StringReplace(stExtraAmt3,'��','',[rfReplaceAll]);
    stExtraAmt4 := StringReplace(stExtraAmt4,',','',[rfReplaceAll]);
    stExtraAmt4 := StringReplace(stExtraAmt4,'��','',[rfReplaceAll]);
    if Trim(stExtraAmt1) = '' then stExtraAmt1 := '0';
    if Trim(stExtraAmt2) = '' then stExtraAmt2 := '0';
    if Trim(stExtraAmt3) = '' then stExtraAmt3 := '0';
    if Trim(stExtraAmt4) = '' then stExtraAmt4 := '0';
    nBaseTotal := strtoint(Cells[15,aRow]);
    nTotalAmt := nBaseTotal + strtoint(stExtraAmt1) + strtoint(stExtraAmt2)+ strtoint(stExtraAmt3)+ strtoint(stExtraAmt4);
    Cells[14,aRow] := WonStringFormat(inttostr(nTotalAmt)) + '��';
  end;
end;

procedure TfmMonthATReport.GetExtraSearch(aMonth, aCompanyCode,
  aEmCode: string; aRow: integer);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  i : integer;
begin
  stSql := ' select * from TB_ATMONTHEXTRA ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_MONTH = ''' + aMonth + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';

  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;
  with TempAdoQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Text := stSql;

    Try
      Open;
    Except
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;
    i:= 0;
    While Not Eof do
    begin
      if i> 3 then Break;

      with sg_Report do
      begin
        Cells[12,aRow+i] := FindField('AT_EXTRANAME').AsString;
        Cells[18,aRow+i] := FindField('AT_EXTRANAME').AsString; // Old Data ������ ����
        Cells[13,aRow+i] := WonStringFormat(FindField('AT_EXTRAAMT').AsString) + '��';
      end;

      inc(i);
      Next;
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

procedure TfmMonthATReport.btn_ExcelClick(Sender: TObject);
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
  stTitle := GetTitle;
  ini_fun := TiniFile.Create(ExeFolder + '\print.ini');
  stPrintRefPath := ExeFolder + '\..\PrintOutRef\' ;
  stPrintRefPath := ini_fun.ReadString('ȯ�漳��','PrintRefPath',stPrintRefPath);
  stRefFileName  := ini_fun.ReadString('�������º���','��������','MonthATReport.xls');
  stRefFileName := stPrintRefPath + stRefFileName;
  nExcelRowStart := ini_fun.ReadInteger('�������º���','������ġ',10);
  ini_fun.Free;

  aFileName:='�������º���';
  SaveDialog1.FileName := aFileName;
  if SaveDialog1.Execute then
  begin
    stSaveFileName := SaveDialog1.FileName;

    if SaveDialog1.FileName <> '' then
    begin
      pan_gauge.Visible := True;
      Screen.Cursor:= crHourGlass;
      dmExcelSave.ExcelPrintOut(sg_Report,stRefFileName,stSaveFileName,True,nExcelRowStart,stTitle,False,False,Gauge1);
    end;
  end;
  pan_gauge.Visible := False;
  Screen.Cursor:= crDefault;
  btn_Excel.Enabled := True;
{  SaveDialog1.FileName := aFileName;
  if SaveDialog1.Execute then
  begin
    stSaveFileName := SaveDialog1.FileName;
    if SaveDialog1.FileName <> '' then
      if Not ExcelPrintOut(sg_Report,stRefFileName,stSaveFileName,True,nExcelRowStart,stTitle,False,False) then
      begin
        Screen.Cursor:= crDefault;
        btn_Excel.Enabled := True;
        Exit;
      end;
      //showmessage('���ϻ��� �Ϸ�');
  end;
  Screen.Cursor:= crDefault;
  btn_Excel.Enabled := True;}
end;


function TfmMonthATReport.GetTitle: string;
var
  stTitle : string;
begin
  stTitle := '�˻��� : ' + FormatDateTime('yyyy��mm��',dt_Date.Date)  ;
  if cmb_Company.ItemIndex > 0 then
    stTitle := stTitle + ' / ȸ�� : ' + cmb_Company.Text ;
  if cmb_Jijum.ItemIndex > 0 then
    stTitle := stTitle + ' / ���� : ' + cmb_Jijum.text ;
  if cmb_Depart.ItemIndex > 0 then
    stTitle := stTitle + ' / �μ� : ' + cmb_Depart.text ;
  if cmb_Posi.ItemIndex > 0 then
    stTitle := stTitle + ' / ���� : ' + cmb_Posi.text ;
  if Trim(ed_empNo.Text) <> '' then
    stTitle := stTitle  + ' / ��� : ' + ed_empNo.text ;
  if Trim(ed_name.Text) <> '' then
    stTitle := stTitle  + ' / �̸� : ' + ed_name.text ;

  Result := stTitle;
end;

procedure TfmMonthATReport.btn_PrintClick(Sender: TObject);
var
  stRefFileName,stSaveFileName:String;
  stPrintRefPath : string;
  nExcelRowStart:integer;
  ini_fun : TiniFile;
  aFileName : string;
  stTitle : string;
begin
  btn_Print.Enabled := False;
  Screen.Cursor:= crHourGlass;
  stTitle := GetTitle;
  ini_fun := TiniFile.Create(ExeFolder + '\print.ini');
  stPrintRefPath := ExeFolder + '\..\PrintOutRef\' ;
  stPrintRefPath := ini_fun.ReadString('ȯ�漳��','PrintRefPath',stPrintRefPath);
  stRefFileName  := ini_fun.ReadString('�������º���','��������','MonthATReport.xls');
  stRefFileName := stPrintRefPath + stRefFileName;
  nExcelRowStart := ini_fun.ReadInteger('�������º���','������ġ',10);
  ini_fun.Free;

  dmExcelSave.ExcelPrintOut(sg_Report,stRefFileName,stSaveFileName,False,nExcelRowStart,stTitle,False,False,Gauge1);

  btn_Print.Enabled := True;
  Screen.Cursor:= crDefault;

end;

procedure TfmMonthATReport.sg_reportResize(Sender: TObject);
var
  nTotWidth: integer;
  nWidth : integer;
  nLeft : integer;
begin
  nTotWidth := sg_report.Width;
  nWidth := pan_gauge.Width;

  nleft := (nTotWidth - nWidth) div 2;
  pan_gauge.Left := nLeft;

end;

initialization
  RegisterClass(TfmMonthATReport);
Finalization
  UnRegisterClass(TfmMonthATReport);


end.
