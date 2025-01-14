unit uReceiveTelNum;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, Grids, BaseGrid, AdvGrid,
  uSubForm, CommandArray, DB, ADODB, Menus, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient;

type
  TfmReceiveTelNum = class(TfmASubForm)
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
    TempQuery: TADOQuery;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure sg_reportMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    procedure ShowReceiveTelList;
    procedure PhoneCall(aTelNum:string);
  public
    { Public declarations }
  end;

var
  fmReceiveTelNum: TfmReceiveTelNum;

implementation
uses
  uDataModule,
  uManagerAdminN,
  uLomosUtil, uMain;

{$R *.dfm}



procedure TfmReceiveTelNum.FormCreate(Sender: TObject);
begin
  dt_FromDate.Date := Now;
  dt_ToDate.Date := Now;

end;

procedure TfmReceiveTelNum.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;

end;

procedure TfmReceiveTelNum.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmReceiveTelNum.btn_SearchClick(Sender: TObject);
begin
  ShowReceiveTelList;
end;

procedure TfmReceiveTelNum.ShowReceiveTelList;
var
  stSql : string;
  nRow : integer;
begin
  RowGridInitialize(sg_Report);

  stSql := ' Select a.*,c.AM_USERNAME,c.AM_DEPARTNAME,c.AM_POSI,d.AC_CPNAME ';
  stSql := stSql + ' From TB_TELLIST a ';
  stSql := stsql + ' Left Join TB_LASTCUSTOMERID b ';
  stSql := stSql + ' ON(a.TL_TELNUM = b.CT_TELNO) ';
  stsql := stSql + ' Left Join TB_AUTHMANAGER c ';
  stSql := stSql + ' ON(b.AC_COMPANYID = c.AC_COMPANYID ';
  stSql := stSql + ' AND b.AM_MANAGERID = c.AM_MANAGERID ) ';
  stsql := stSql + ' Left Join TB_AUTHCOMPANY d ';
  stSql := stSql + ' ON(b.AC_COMPANYID = d.AC_COMPANYID )';
  stSql := stSql + ' Where a.TL_DATE between ''' + FormatdateTime('yyyymmdd',dt_FromDate.Date) + ''' ';
  stSql := stSql + ' AND ''' +  FormatdateTime('yyyymmdd',dt_ToDate.Date) + ''' ';
  stSql := stSql + ' Order by a.TL_DATE DESC,a.TL_TIME DESC ';

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
        Cells[0,nRow] := DateType(FindField('TL_DATE').AsString);
        Cells[1,nRow] := TimeType(FindField('TL_TIME').AsString);
        Cells[2,nRow] := PhoneNumberType(FindField('TL_TELNUM').AsString);
        Cells[3,nRow] := FindField('AM_USERNAME').AsString;
        Cells[4,nRow] := FindField('AC_CPNAME').AsString;
        Cells[5,nRow] := FindField('AM_DEPARTNAME').AsString;
        Cells[6,nRow] := FindField('AM_POSI').AsString;
        inc(nRow);
        Next;
      end;
    end;
  end;
end;

procedure TfmReceiveTelNum.FormShow(Sender: TObject);
begin
  ShowReceiveTelList;

end;

procedure TfmReceiveTelNum.N1Click(Sender: TObject);
begin
  if sg_report.Cells[2,sg_report.Row] = '' then
  begin
    Exit;
  end;
  if sg_report.Cells[3,sg_report.Row] <> '' then
  begin
    Exit;
  end;
  fmManagerAdmin1:= TfmManagerAdmin1.Create(Self);
  fmManagerAdmin1.L_sTelNum := sg_report.Cells[2,sg_report.Row];
  fmManagerAdmin1.ShowModal;
  fmManagerAdmin1.Free;
end;

procedure TfmReceiveTelNum.N2Click(Sender: TObject);
var
  stTelNum : string;
begin
  stTelNum := sg_report.Cells[2,sg_report.Row];
  stTelNum := StringReplace(stTelNum,'-','',[rfReplaceAll]);

  if Not IsDigit(stTelNum) then Exit;

  PhoneCall(stTelNum);

end;

procedure TfmReceiveTelNum.PhoneCall(aTelNum: string);
var
  stSendData : string;
begin
  G_stSendTelNum := aTelNum;
  stSendData := 'MODEMSEND' + DATADELIMITER + 'ATDT' + aTelNum + DATADELIMITER + LINEEND;
  fmMain.ModemSendData(stSendData);
  fmMain.DisConnectTimer.Enabled := True;
end;

procedure TfmReceiveTelNum.sg_reportMouseDown(Sender: TObject;
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

initialization
  RegisterClass(TfmReceiveTelNum);
Finalization
  UnRegisterClass(TfmReceiveTelNum);

end.
