unit uReSendTelNum;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, Grids, BaseGrid, AdvGrid,
  uSubForm, CommandArray, DB, ADODB, Menus, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, AdvObj;

type
  TfmReSendTelNum = class(TfmASubForm)
    Panel1: TPanel;
    GroupBox5: TGroupBox;
    btn_Search: TSpeedButton;
    btn_Close: TSpeedButton;
    GroupBox2: TGroupBox;
    Label11: TLabel;
    dt_FromDate: TDateTimePicker;
    dt_ToDate: TDateTimePicker;
    sg_report: TAdvStringGrid;
    Label1: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    TempQuery: TZQuery;
    N4: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure sg_reportMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N4Click(Sender: TObject);
  private
    { Private declarations }
    function InsertTB_RETELNUM(aDate,aTime,aTelNum:string):Boolean;
    procedure ShowReceiveTelList;
    procedure PhoneCall(aTelNum:string);
  public
    { Public declarations }
  end;

var
  fmReSendTelNum: TfmReSendTelNum;

implementation
uses
  uDataModule,
  uManagerAdminN,
  uLomosUtil,
  uMain, uManagerAdd;

{$R *.dfm}



procedure TfmReSendTelNum.FormCreate(Sender: TObject);
begin
  dt_FromDate.Date := Now - 30;
  dt_ToDate.Date := Now;

end;

procedure TfmReSendTelNum.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;

end;

procedure TfmReSendTelNum.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmReSendTelNum.btn_SearchClick(Sender: TObject);
begin
  ShowReceiveTelList;
end;

procedure TfmReSendTelNum.ShowReceiveTelList;
var
  stSql : string;
  nRow : integer;
begin
  RowGridInitialize(sg_Report);

  stSql := ' Select a.RT_DATE,a.RT_TIME,a.RT_TELNO,b.TE_GUBUN,b.PE_CODE,c.PE_NAME,d.CO_NAME,e.CO_JIJUMNAME,f.CO_DEPARTNAME,c.PE_POSITIONNAME ';
  stSql := stSql + ' From TB_RESENDTEL a ';
  stSql := stsql + ' Left Join (select aa.* from TB_TELNUM aa ';
  stSql := stSql + ' Inner Join (select TE_TELNUMBER,MAX(TE_VIEWSEQ) as TE_VIEWSEQ ';
  stSql := stSql + ' From TB_TELNUM Group by TE_TELNUMBER ) bb ';
  stSql := stSql + ' ON (aa.TE_TELNUMBER = bb.TE_TELNUMBER ';
  stSql := stSql + ' AND aa.TE_VIEWSEQ = bb.TE_VIEWSEQ ) ';
  stSql := stSql + ' ) b ';
  stSql := stSql + ' ON(a.RT_TELNO = b.TE_TELNUMBER) ';
  stsql := stSql + ' Left Join TB_PERSON c ';
  stSql := stSql + ' ON(b.PE_CODE = c.PE_CODE) ';
  stsql := stSql + ' Left Join TB_COMPANY d ';
  stSql := stSql + ' ON(c.CO_COMPANYCODE = d.CO_COMPANYCODE )';
  stsql := stSql + ' Left Join TB_JIJUM e ';
  stSql := stSql + ' ON(c.CO_COMPANYCODE = e.CO_COMPANYCODE ';
  stSql := stSql + ' AND c.CO_JIJUMCODE = e.CO_JIJUMCODE) ';
  stsql := stSql + ' Left Join TB_DEPART f ';
  stSql := stSql + ' ON(c.CO_COMPANYCODE = f.CO_COMPANYCODE ';
  stSql := stSql + ' AND c.CO_JIJUMCODE = f.CO_JIJUMCODE ';
  stSql := stSql + ' AND c.CO_DEPARTCODE = f.CO_DEPARTCODE) ';
  stSql := stSql + ' Where a.RT_DATE between ''' + FormatdateTime('yyyymmdd',dt_FromDate.Date) + ''' ';
  stSql := stSql + ' AND ''' +  FormatdateTime('yyyymmdd',dt_ToDate.Date) + ''' ';
  stSql := stSql + ' AND a.MA_USERID = ''' + Master_ID + ''' ';
  stSql := stSql + ' Order by a.RT_DATE DESC,a.RT_TIME DESC ';

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
    with sg_report do
    begin
      rowcount := recordCount + 1;
      nRow := 1;
      While Not Eof do
      begin
        Cells[0,nRow] := DateType(FindField('RT_DATE').AsString);
        Cells[1,nRow] := TimeType(FindField('RT_TIME').AsString);
        Cells[2,nRow] := PhoneNumberType(FindField('RT_TELNO').AsString);
        Cells[3,nRow] := FindField('PE_NAME').AsString;
        Cells[4,nRow] := FindField('CO_NAME').AsString;
        Cells[5,nRow] := FindField('CO_JIJUMNAME').AsString;
        Cells[6,nRow] := FindField('CO_DEPARTNAME').AsString;
        Cells[7,nRow] := FindField('PE_POSITIONNAME').AsString;
        inc(nRow);
        Next;
      end;
    end;
  end;
end;

procedure TfmReSendTelNum.FormShow(Sender: TObject);
begin
  ShowReceiveTelList;

end;

procedure TfmReSendTelNum.N1Click(Sender: TObject);
begin
  if sg_report.Cells[2,sg_report.Row] = '' then
  begin
    Exit;
  end;
  fmManagerAdd:= TfmManagerAdd.Create(Self);
  fmManagerAdd.L_TelNumber := sg_report.Cells[2,sg_report.Row];
  fmManagerAdd.L_CustomerName := sg_report.Cells[3,sg_report.Row];
  fmManagerAdd.SHowmodal;
  fmManagerAdd.Free;

end;

procedure TfmReSendTelNum.N2Click(Sender: TObject);
var
  stTelNum : string;
begin
  stTelNum := sg_report.Cells[2,sg_report.Row];
  stTelNum := StringReplace(stTelNum,'-','',[rfReplaceAll]);

  if Not IsDigit(stTelNum) then Exit;

  PhoneCall(stTelNum);

end;

procedure TfmReSendTelNum.PhoneCall(aTelNum: string);
var
  stSendData : string;
begin
  G_stSendTelNum := aTelNum;
  stSendData := 'MODEMSEND' + DATADELIMITER + '' + DATADELIMITER;
  fmMain.ModemSendData(stSendData);
  Delay(1000);
  stSendData := 'MODEMSEND' + DATADELIMITER + 'ATDT' + aTelNum + DATADELIMITER + LINEEND;
  fmMain.ModemSendData(stSendData);
  fmMain.DisConnectTimer.Enabled := True;
  InsertTB_RETELNUM(FormatDateTime('yyyymmdd',now),FormatDateTime('hhnnss',now),G_stSendTelNum);
end;

procedure TfmReSendTelNum.sg_reportMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var 
  Acol, Arow : integer; 
begin
  sg_report.MouseToCell(x, Y, ACol, ARow);
  if Arow >= sg_Report.RowCount then Exit;
  if Arow < 1 then Exit;
  sg_report.SelectRows(Arow,1);
  //showmessage(inttostr(ACol) + ',' + inttostr(ARow) + ' Button Click');

end;

procedure TfmReSendTelNum.N4Click(Sender: TObject);
begin
  if sg_report.Cells[2,sg_report.Row] = '' then
  begin
    Exit;
  end;

  fmMain.CustomerConsultingView(sg_report.Cells[2,sg_report.Row]);
end;


function TfmReSendTelNum.InsertTB_RETELNUM(aDate, aTime,
  aTelNum: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_RESENDTEL( ';
  stSql := stSql + ' MA_USERID,';
  stSql := stSql + ' RT_DATE,';
  stSql := stSql + ' RT_TIME,';
  stSql := stSql + ' RT_TELNO ) ';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + Master_ID + ''', ';
  stSql := stSql + '''' + aDate + ''', ';
  stSql := stSql + '''' + aTime + ''', ';
  stSql := stSql + '''' + aTelNum + ''') ';

  result := dmDB.ProcessExecSQL(stSql);
end;

initialization
  RegisterClass(TfmReSendTelNum);
Finalization
  UnRegisterClass(TfmReSendTelNum);

end.
