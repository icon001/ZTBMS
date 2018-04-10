unit uTelNumberAdmin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, IdBaseComponent, IdComponent,
  IdUDPBase, IdUDPServer,IdSocketHandle, Menus,iniFiles,DB, Grids,
  BaseGrid, AdvGrid, ComCtrls, ADODB, uSubForm, CommandArray,
  antTaskbarIcon, Gauges, ImgList,Registry;

type
  TfmMain = class(TfmASubForm)
    IdUDPServer1: TIdUDPServer;
    Panel1: TPanel;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    mn_FormHide: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    Panel2: TPanel;
    Splitter1: TSplitter;
    sg_report: TAdvStringGrid;
    ADOQuery: TADOQuery;
    pmTest: TPopupMenu;
    miShow: TMenuItem;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    Ver011: TMenuItem;
    tbi: TantTaskbarIcon;
    HideTimer: TTimer;
    StatusBar1: TStatusBar;
    ADOServerQuery: TADOQuery;
    ADOLocal: TADOQuery;
    N2: TMenuItem;
    N3: TMenuItem;
    N7: TMenuItem;
    Menu_ImageList: TImageList;
    pan: TPanel;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    btn_Search: TSpeedButton;
    SpeedButton3: TSpeedButton;
    chk_date: TCheckBox;
    dt_startDate: TDateTimePicker;
    dt_endDate: TDateTimePicker;
    ed_SearchQ: TEdit;
    ed_SearchP: TEdit;
    Panel4: TPanel;
    ed_SearchTelNo: TEdit;
    Label9: TLabel;
    Gauge1: TGauge;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edit_recvTelno: TEdit;
    chk_Customer: TCheckBox;
    ed_recvname: TEdit;
    Label3: TLabel;
    Label2: TLabel;
    ed_recvTime: TEdit;
    Label4: TLabel;
    mem_Etc: TMemo;
    Label5: TLabel;
    ed_Question: TEdit;
    Label6: TLabel;
    mem_Process: TMemo;
    btn_save: TSpeedButton;
    PopupMenu1: TPopupMenu;
    mn_F4: TMenuItem;
    ADOTempQuery: TADOQuery;
    Label7: TLabel;
    ed_Content: TEdit;
    N6: TMenuItem;
    Label13: TLabel;
    ed_SearchName: TEdit;
    procedure IdUDPServer1UDPRead(Sender: TObject; AData: TStream;
      ABinding: TIdSocketHandle);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure btn_saveClick(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure sg_reportDblClick(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure miShowClick(Sender: TObject);
    procedure tbiDblClick(Sender: TObject);
    procedure HideTimerTimer(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure mn_FormHideClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N3Click(Sender: TObject);
    procedure edit_recvTelnoKeyPress(Sender: TObject; var Key: Char);
    procedure edit_recvTelnoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed_SearchTelNoChange(Sender: TObject);
    procedure mn_F4Click(Sender: TObject);
    procedure ed_ContentChange(Sender: TObject);
    procedure N6Click(Sender: TObject);
  private
    L_bClose : Boolean;
    L_stOldData : String;
    L_bDataProcess : Boolean;
    L_bAutoShow:Boolean;
    { Private declarations }
    Function DataBaseConnect:Boolean;
    procedure DataProcess(aRecvData:string);
    procedure FormClear;
    Function GetCustomerName(aTelNo:string;var aName,aETC:string):Boolean;
    procedure SearchManageList(aCode:string);
    Function DataBaseSeverConnect:Boolean;
    Function DataBaseLocalConnect:Boolean;
    Function GetServerData:Boolean;
    Function PushServerData:Boolean;
    Function getUserName(aTelNo:string):string;
    Function CheckTB_MANAGELIST(aDate,aTelno:string):Boolean;
{Detecting Windows Shutdown
To detect Windows Shutdown, you must trap WM_EndSession message. These steps should be taken: Declare a message handling
procedure in your Form's Private section: }
    procedure WMEndSession(var Msg : TWMEndSession); message WM_ENDSESSION;
{Detecting Windows shutdown
When Windows is shutting down, it sends a WM_QueryEndSession to all open applications. To detect (and prevent shutdown), you must
define a message handler to this message. Put this definition on the private section of the main form:}
    procedure WMQueryEndSession(var Msg : TWMQueryEndSession); message WM_QueryEndSession;
    //procedure WndProc(var Message: TMessage); override;
  protected
    procedure WndProc(var Msg: TMessage); override;
    Function TableCheck:Boolean;
    Function ConfigCheck:Boolean;


  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;

implementation
uses
  uDataBaseConfig,
  uDataModule1,
  uAdminConfig,
  uLomosUtil,
  uManageShow, uCustomer, uTAConfig;
{$R *.dfm}

procedure TfmMain.IdUDPServer1UDPRead(Sender: TObject; AData: TStream;
  ABinding: TIdSocketHandle);
var
  DataStringStream: TStringStream;
  RecvData : String;

begin
  DataStringStream := TStringStream.Create('');
  try
    DataStringStream.CopyFrom(AData, AData.Size);
    RecvData:=DataStringStream.DataString;
  finally
    DataStringStream.Free;
  end;
  if L_stOldData = RecvData then Exit;
  L_stOldData := RecvData;
  //if Not L_bDataProcess then
    DataProcess(RecvData);
//  memo1.Lines.Add(RecvData);
end;

procedure TfmMain.FormActivate(Sender: TObject);
begin
  IdUDPServer1.Active := False;
  IdUDPServer1.DefaultPort := 194501;
  IdUDPServer1.Active := True;
  dt_startDate.Date := Now -1;
  dt_endDate.Date := Now;
  SearchManageList('');
end;

procedure TfmMain.FormCreate(Sender: TObject);
begin
  L_bClose := False;
  L_bDataProcess := False;
  if Not DataBaseConnect then
  begin
    showmessage('인터넷 접속환경을 확인하세요.');
    Application.Terminate;
    Exit;
{    fmAdminConfig:= TfmAdminConfig.Create(Self);
    fmAdminConfig.SHowmodal;
    fmAdminConfig.Free;
    DataBaseConnect; }
  end;
  tbi.Visible := True;
  tbi.Hint := '고객관리프로그램';
  HideTimer.Enabled := True;

  TableCheck;
  ConfigCheck;

end;

function TfmMain.DataBaseConnect: Boolean;
var
  conStr : wideString;
  stHost : String;
  stPort : String;
  stuserID : String;
  stuserPW : String;
  ini_fun : TiniFile;
  stExeFolder : String;
begin
  result := False;

  stExeFolder  := ExtractFileDir(Application.ExeName);
  ini_fun := TiniFile.Create(stExeFolder + '\Lomos.INI');

  stHost  := ini_fun.ReadString('DBConfig','Host','zeron.co.kr');
  stPort := ini_fun.ReadString('DBConfig','Port','1433');
  stuserID := ini_fun.ReadString('DBConfig','UserID','zeron');
  stuserPW := ini_fun.ReadString('DBConfig','UserPW','zeronpass');  //saPasswd
  DBName := ini_fun.ReadString('DBConfig','DBNAME','zeron');
  GROUPCODE := ini_fun.ReadString('COMPANY','GROUPCODE','1234567890');
  DBType := UpperCase(ini_fun.ReadString('DBConfig','TYPE','MSSQL'));
//  if ini_fun.ReadString('Config','AutoShow','False') = 'TRUE' then
//    L_bAutoShow := True
//  else L_bAutoShow := False;
  conStr := '';
  if UpperCase(DBType) = 'MSSQL' then
  begin
    conStr := constr + 'Provider=SQLOLEDB.1;';
    conStr := constr + 'Password=' + stuserPW + ';';
    conStr := constr + 'Persist Security Info=True;';
    conStr := constr + 'User ID=' + stuserID + ';';
    conStr := constr + 'Initial Catalog=' + DBName + ';';
    conStr := constr + 'Data Source=' + stHost  + ',' + stPort;
  end else if UpperCase(DBType) = 'MDB' then
  begin
    DBName := stExeFolder + '\' + DBName + '.mdb';
    conStr := 'Provider=Microsoft.Jet.OLEDB.4.0;';
    conStr := conStr + 'Data Source=' + DBName + ';';
    conStr := conStr + 'Persist Security Info=True;';
    conStr := conStr + 'Jet OLEDB:Database ';
    if stuserPW <> '' then  conStr := conStr + ' Password=' + stuserPW;
  end else
  begin
    showmessage('DB Type 이 정확하지 않습니다.');
    Exit;
  end;

  with DataModule1.ADOConnection do
  begin
    Connected := False;
    ConnectionString := conStr;
    LoginPrompt:= false ;
    Try
      Connected := True;
    Except
      on E : EDatabaseError do
        begin
          // ERROR MESSAGE-BOX DISPLAY
          ShowMessage(E.Message );
          Exit;
        end;
      else
        begin
          ShowMessage('데이터베이스 접속 에러' );
          Exit;
        end;
    End;
  end;
  ini_fun.free;

  result := True;
end;

procedure TfmMain.N2Click(Sender: TObject);
begin
{  fmAdminConfig:= TfmAdminConfig.Create(Self);
  fmAdminConfig.SHowmodal;
  fmAdminConfig.Free;
  DataBaseConnect;   }
end;

procedure TfmMain.SpeedButton3Click(Sender: TObject);
begin
    Visible := False;
    ShowWindow( Application.Handle, SW_HIDE );

end;

procedure TfmMain.DataProcess(aRecvData: string);
var
  stSql : string;
  TempList : TStringList;
  nPos : integer;
  i : integer;
  stDate,stTelNo,stTime,stName,stEtc:string;
begin
  L_bDataProcess := True;
  TempList := TStringList.Create;
  TempList.Delimiter := ',';
  TempList.DelimitedText := aRecvData;
  stDate := FormatDateTime('yyyymmddHHMMSS',Now);
  stTime := copy(stDate,9,4);
  stDate := copy(stDate,1,8);
  stTelNo := '';
  stName := '';
  stEtc := '';
  For i:=0 to TempList.Count - 1 do
  begin
    if Pos('NMBR',TempList.Strings[i]) > 0 then
    begin
      nPos := Pos('=',TempList.Strings[i]);
      if nPos > 0 then
        stTelNo := Trim(copy(TempList.Strings[i],nPos + 1,Length(TempList.Strings[i]) - nPos));
    end else if Pos('DATE',TempList.Strings[i]) > 0 then
    begin
      nPos := Pos('=',TempList.Strings[i]);
      if nPos > 0 then
        stDate := copy(stDate,1,4) + Trim(copy(TempList.Strings[i],nPos + 1,Length(TempList.Strings[i]) - nPos));
    end else if Pos('TIME',TempList.Strings[i]) > 0 then
    begin
      nPos := Pos('=',TempList.Strings[i]);
      if nPos > 0 then
        stTime := Trim(copy(TempList.Strings[i],nPos + 1,Length(TempList.Strings[i]) - nPos));
    end;
  end;
  if stTelNo = '' then Exit;
  ed_SearchTelNo.Text := stTelNo;
  SearchManageList('');

  if Not CheckTB_MANAGELIST(stDate + stTime,stTelno) then
  begin
    stSql := ' Insert Into TB_MANAGELIST(';
    stSql := stSql + ' MA_DATE,';
    stSql := stSql + ' MA_TIME,';
    stSql := stSql + 'CU_TELNo,';
    stSql := stSql + 'MA_PCIP) ';
    stSql := stSql + ' Values( ';
    stSql := stSql + '''' + stDate + ''',';
    stSql := stSql + '''' + stTime + ''',';
    stSql := stSql + '''' + stTelno + ''',';
    stSql := stSql + '''' + Get_Local_IPAddr + ''') ';
    DataModule1.ProcessExecSQL(stSql);
  end;
{  if (Application.MessageBox(PChar('전화데이터를 처리하시겠습니까?'),'처리',MB_OKCANCEL) = ID_CANCEL)  then
  begin
    L_bDataProcess := False;
    Exit;
  end;    }


  FormClear;
  edit_recvTelno.Text := stTelNo;
  ed_recvTime.Text := copy(stdate,1,4) + '-' +
                  copy(stDate,5,2) + '-' +
                  copy(stDate,7,2) + ' ' +
                  copy(stTime,1,2) + ':' +
                  copy(stTime,3,2) ;

  if Not L_bAutoShow then
  begin
    if Not Visible  then
    begin
      L_bDataProcess := False;
      Exit;
    end;
  end;
  Visible := True;

  if GetCustomerName(stTelNo,stName,stEtc) then
  begin
    ed_recvname.Text := stName;
    mem_Etc.Text := stEtc;
    chk_Customer.Checked := True;
    ed_Question.SetFocus;
  end else
  begin
    chk_Customer.Checked := False;
    ed_recvname.SetFocus;
  end;

end;

procedure TfmMain.FormClear;
begin
  edit_recvTelno.Text := '';
  ed_recvTime.Text := '';
  ed_recvname.Text := '';
  mem_Etc.Text := '';
  ed_Question.Text := '';
  mem_Process.Text := '';
  chk_Customer.Checked := False;
  L_bDataProcess := False;
end;

function TfmMain.GetCustomerName(aTelNo: string;var aName,aETC:string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'select  * from TB_CUSTOMER ';
  stSql := stSql + ' WHERE CU_TELNO = ''' + aTelNo + ''' ';
  with DataModule1.ADOTmpQuery do
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
    aETC := FindField('CU_ETC').AsString;
    aName := FindField('CU_NAME').AsString;
  end;
  result := True;
end;

procedure TfmMain.btn_saveClick(Sender: TObject);
var
  stSql : string;
  stDate : string;
begin
  if edit_recvTelno.Text ='' then Exit;
//  if ed_recvTime.Text = '' then Exit;
  stDate := StringReplace(ed_recvTime.Text,'-','',[rfReplaceAll]);
  stDate := StringReplace(stDate,' ','',[rfReplaceAll]);
  stDate := StringReplace(stDate,':','',[rfReplaceAll]);
  if Trim(stDate) = '' then stDate := FormatDateTime('yyyymmddHHMM',Now);
//  if CheckTB_MANAGELIST(stDate,edit_recvTelno.Text) then
//  begin
    stSql := ' Update TB_MANAGELIST set ';
    stSql := stSql + 'MA_DATA = ''' + mem_Process.Text + ''',';
    stSql := stSql + 'MA_PCIP = ''' + Get_Local_IPAddr + ''',';
    stSql := stSql + 'MA_QUESTION = ''' + ed_Question.Text + ''' ';
    stSql := stSql + ' Where MA_DATE = ''' + copy(stDate,1,8) + ''' ';
    stSql := stSql + ' AND MA_TIME = ''' + copy(stDate,9,4) + ''' ';
    stsql := stSql + ' AND CU_TELNO = ''' + edit_recvTelno.Text + ''' ';
{  end else
  begin
    stSql := ' Insert Into TB_MANAGELIST( MA_DATE,MA_TIME,CU_TELNO,MA_DATA,MA_PCIP,MA_QUESTION )';
    stSql := stSql + ' VALUES( ';
    stSql := stSql + '''' + copy(stDate,1,8) + ''', ';
    stSql := stSql + '''' + copy(stDate,9,4) + ''', ';
    stsql := stSql + '''' + edit_recvTelno.Text + ''', ';
    stSql := stSql + '''' + mem_Process.Text + ''',';
    stSql := stSql + '''' + Get_Local_IPAddr + ''',';
    stSql := stSql + '''' + ed_Question.Text + ''' ) ';
  end;    }
  DataModule1.ProcessExecSQL(stSql);

  if chk_Customer.Checked then
  begin
    stSql := 'Update TB_CUSTOMER set ';
    stSql := stSql + ' CU_NAME = ''' + ed_recvName.Text + ''',';
    stSql := stSql + ' CU_ETC = ''' + mem_etc.Text + ''' ';
    stSql := stSql + ' WHERE CU_TELNO = ''' + edit_recvTelno.Text + ''' ';
  end else
  begin
    stSql := 'Insert Into TB_CUSTOMER (';
    stSql := stSql + ' CU_TELNO,' ;
    stSql := stSql + ' CU_NAME, ';
    stSql := stSql + ' CU_ETC ) ';
    stSql := stSql + ' Values( ';
    stSql := stSql + '''' + edit_recvTelno.Text + ''', ';
    stSql := stSql + '''' + ed_recvName.Text  + ''', ';
    stSql := stSql + '''' + mem_etc.Text  + ''') ';
  end;
  DataModule1.ProcessExecSQL(stSql);
  L_bDataProcess := False;
  FormClear;
  SearchManageList(stDate + edit_recvTelno.Text);
end;

procedure TfmMain.btn_SearchClick(Sender: TObject);
begin
  SearchManageList('');
end;

procedure TfmMain.SearchManageList(aCode: string);
var
  stSql : string;
  stWhere : string;
  nRow : integer;
  stName : string;
begin
  GridInit(sg_Report as TStringGrid,6);
  stWhere := '';
  if ed_Content.Text <> '' then
  begin
    if stWhere = '' then stWhere := ' Where '
    else stWhere := stWhere + ' AND ';
    stWhere := stWhere + ' ( MA_DATA Like ''%' + ed_Content.Text + '%'' ';
    stWhere := stWhere + ' OR MA_QUESTION Like ''%' + ed_Content.Text + '%'') ';
  end;

  if chk_date.Checked then
  begin
    if stWhere = '' then stWhere := ' Where '
    else stWhere := stWhere + ' AND ';

    stWhere := stWhere + ' a.MA_DATE Between ''' + FormatDateTime('yyyymmdd',dt_startDate.Date) + ''' ';
    stWhere := stWhere + ' AND ''' + FormatDateTime('yyyymmdd',dt_endDate.Date) + ''' ';
  end;
  if ed_SearchTelNo.Text <> '' then
  begin
    if stWhere = '' then stWhere := ' Where '
    else stWhere := stWhere + ' AND ';

    stName := getUserName(ed_SearchTelNo.Text);
    if Trim(stName) = '' then
      stWhere := stWhere + ' a.CU_TELNO Like ''%' + ed_SearchTelNo.Text + '%'' '
    else stWhere := stWhere + 'b.CU_NAME = ''' + stName + ''' ';
  end;
  if ed_SearchName.Text <> '' then
  begin
    if stWhere = '' then stWhere := ' Where '
    else stWhere := stWhere + ' AND ';

    stWhere := stWhere + ' b.CU_NAME Like ''%' + ed_SearchName.Text + '%'' ';
  end;
  if ed_SearchQ.Text <> '' then
  begin
    if stWhere = '' then stWhere := ' Where '
    else stWhere := stWhere + ' AND ';

    stWhere := stWhere + ' a.MA_QUESTION Like ''%' + ed_SearchQ.Text + '%'' ';
  end;
  if ed_SearchP.Text <> '' then
  begin
    if stWhere = '' then stWhere := ' Where '
    else stWhere := stWhere + ' AND ';

    stWhere := stWhere + ' a.MA_DATA Like ''%' + ed_SearchP.Text + '%'' ';
  end;
  stSql := ' select (a.MA_DATE + a.MA_TIME) as date,a.MA_DATE,a.MA_TIME,a.CU_TELNO,a.MA_DATA,';
  stSql := stSql + ' a.MA_PCIP,a.MA_QUESTION,b.CU_NAME,b.CU_ETC ';
  stSql := stSql + ' from TB_MANAGELIST a ';
  stSql := stSql + ' Left Join TB_CUSTOMER b ';
  stSql := stSql + ' ON(a.CU_TELNO = b.CU_TELNO) ';
  if stWhere <> '' then stSql := stSql + stWhere;
  stSql := stSql + ' order by date DESC ';

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
    if RecordCount < 1 then Exit;
    nRow := 1;
    sg_Report.RowCount := recordcount + 1;
    While Not Eof do
    begin
      with sg_Report do
      begin
        Cells[0,nRow] := copy(FindField('MA_DATE').AsString,1,4) + '-' +
                         copy(FindField('MA_DATE').AsString,5,2) + '-' +
                         copy(FindField('MA_DATE').AsString,7,2) ;
        Cells[1,nRow] := copy(FindField('MA_TIME').AsString,1,2) + ':' +
                         copy(FindField('MA_TIME').AsString,3,2);
        Cells[2,nRow] := FindField('CU_TELNO').AsString;
        Cells[3,nRow] := FindField('CU_NAME').AsString;
        Cells[4,nRow] := FindField('MA_QUESTION').AsString;
        Cells[5,nRow] := FindField('MA_DATA').AsString;
        Cells[6,nRow] := FindField('MA_PCIP').AsString;
        Cells[7,nRow] := FindField('CU_ETC').AsString;
        if (FindField('MA_DATE').AsString + FindField('MA_TIME').AsString + FindField('CU_TELNO').AsString)  = aCode then
        begin
          SelectRows(nRow,1);
        end;
      end;
      inc(nRow);
      Next;
    end;
  end;
end;

procedure TfmMain.sg_reportDblClick(Sender: TObject);
begin
  fmManageShow:= TfmManageShow.Create(Self);
  fmManageShow.Show;
  with sg_report do
  begin
    fmManageShow.edit_recvTelno.Text := Cells[2,Row];
    fmManageShow.ed_recvTime.Text := Cells[0,Row] + ' ' + Cells[1,Row];
    fmManageShow.ed_recvname.Text := Cells[3,Row];
    fmManageShow.mem_Etc.Text := Cells[7,Row];
    fmManageShow.ed_Question.Text := Cells[4,Row];
    fmManageShow.mem_Process.Text := Cells[5,Row];
    fmManageShow.ed_PCIP.Text := Cells[6,Row];
    fmManageShow.Refresh;
  end;
end;

procedure TfmMain.N8Click(Sender: TObject);
begin
  if Not DataBaseSeverConnect then Exit;
  if Not DataBaseLocalConnect then Exit;
  GetServerData;
end;

function TfmMain.DataBaseLocalConnect: Boolean;
var
  conStr : wideString;
  stExeFolder : String;
  stDBName :string;
begin
  result := False;

  stDBName := ExtractFileDir(Application.ExeName) + '\CUSTOMER.mdb';
  conStr := 'Provider=Microsoft.Jet.OLEDB.4.0;';
  conStr := conStr + 'Data Source=' + stDBName + ';';
  conStr := conStr + 'Persist Security Info=True;';
  conStr := conStr + 'Jet OLEDB:Database ';

  with DataModule1.ADOConnectionLOG do
  begin
    Connected := False;
    ConnectionString := conStr;
    LoginPrompt:= false ;
    Try
      Connected := True;
    Except
      on E : EDatabaseError do
        begin
          // ERROR MESSAGE-BOX DISPLAY
          ShowMessage(E.Message );
          Exit;
        end;
      else
        begin
          ShowMessage('로컬 접속 에러' );
          Exit;
        end;
    End;
  end;

  result := True;
end;

function TfmMain.DataBaseSeverConnect: Boolean;
var
  conStr : wideString;
  stHost : String;
  stPort : String;
  stuserID : String;
  stuserPW : String;
  stExeFolder : String;
  stDBName : string;
begin
  result := False;
  stHost := '192.168.0.116';
  stPort := '1433';
  stuserID := 'sa';
  stuserPW := 'saPasswd';  //saPasswd
  stDBName := 'CUSTOMER';
  conStr := '';
  conStr := constr + 'Provider=SQLOLEDB.1;';
  conStr := constr + 'Password=' + stuserPW + ';';
  conStr := constr + 'Persist Security Info=True;';
  conStr := constr + 'User ID=' + stuserID + ';';
  conStr := constr + 'Initial Catalog=' + stDBName + ';';
  conStr := constr + 'Data Source=' + stHost  + ',' + stPort;

  with DataModule1.ADOBackupConnection do
  begin
    Connected := False;
    ConnectionString := conStr;
    LoginPrompt:= false ;
    Try
      Connected := True;
    Except
      on E : EDatabaseError do
        begin
          // ERROR MESSAGE-BOX DISPLAY
          ShowMessage(E.Message );
          Exit;
        end;
      else
        begin
          ShowMessage('서버 접속 에러' );
          Exit;
        end;
    End;
  end;

  result := True;
end;

procedure TfmMain.N9Click(Sender: TObject);
begin
  if Not DataBaseSeverConnect then Exit;
  if Not DataBaseLocalConnect then Exit;
  PushServerData;

end;

procedure TfmMain.MenuItem2Click(Sender: TObject);
begin
  L_bClose := True;
  Close;

end;

procedure TfmMain.miShowClick(Sender: TObject);
begin
  Visible := True;
end;

procedure TfmMain.tbiDblClick(Sender: TObject);
var
   ptMouse : TPoint;
begin
   {SetForegroundWindow(Application.Handle);
   GetCursorPos(ptMouse);
   pmTest.Popup(ptMouse.X, ptMouse.Y);}
   Visible := True;

end;

procedure TfmMain.HideTimerTimer(Sender: TObject);
begin
  if L_bClose then Exit;
  Visible:=False;
  HideTimer.Enabled:=False;

end;

procedure TfmMain.N5Click(Sender: TObject);
begin
  L_bClose := True;
  Close;
end;

procedure TfmMain.mn_FormHideClick(Sender: TObject);
begin
    Visible := False;
    ShowWindow( Application.Handle, SW_HIDE );

end;

procedure TfmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if L_bClose = False then
  Begin
    Visible := False;
    CanClose := False;
    ShowWindow( Application.Handle, SW_HIDE );
    Exit;
  End;  

end;

function TfmMain.GetServerData: Boolean;
var
  stSql : string;
begin
  Gauge1.Visible := True ;
  stSql := 'select * from TB_CUSTOMER ';
  With ADOServerQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Gauge1.Visible := False;
      Exit;
    End;
    Gauge1.MaxValue := recordCount;
    Gauge1.Progress := 0;
    while Not Eof do
    begin
      stSql := 'Insert Into TB_CUSTOMER (';
      stSql := stSql + 'CU_TELNO,';
      stSql := stSql + 'CU_NAME,';
      stSql := stSql + 'CU_ETC )';
      stSql := stSql + ' VALUES (';
      stSql := stSql + '''' + FindField('CU_TELNO').AsString + ''',';
      stSql := stSql + '''' + FindField('CU_NAME').AsString + ''',';
      stSql := stSql + '''' + FindField('CU_ETC').AsString + ''') ';
      DataModule1.ProcessLogExecSQL(stSql);
      Gauge1.Progress := Gauge1.Progress + 1;
      Next;
    end;
  end;

  stSql := 'select * from TB_MANAGELIST ';
  With ADOServerQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Gauge1.Visible := False;
      Exit;
    End;
    Gauge1.MaxValue := recordCount;
    Gauge1.Progress := 0;
    while Not Eof do
    begin
      stSql := 'Insert Into TB_MANAGELIST (';
      stSql := stSql + 'MA_DATE,';
      stSql := stSql + 'MA_TIME,';
      stSql := stSql + 'CU_TELNO,';
      stSql := stSql + 'MA_DATA,';
      stSql := stSql + 'MA_PCIP,';
      stSql := stSql + 'MA_QUESTION,';
      stSql := stSql + 'MA_JOIN)';
      stSql := stSql + ' VALUES (';
      stSql := stSql + '''' + FindField('MA_DATE').AsString + ''',';
      stSql := stSql + '''' + FindField('MA_TIME').AsString + ''',';
      stSql := stSql + '''' + FindField('CU_TELNO').AsString + ''',';
      stSql := stSql + '''' + FindField('MA_DATA').AsString + ''',';
      stSql := stSql + '''' + FindField('MA_PCIP').AsString + ''',';
      stSql := stSql + '''' + FindField('MA_QUESTION').AsString + ''',';
      stSql := stSql + '''Y'')';
      DataModule1.ProcessLogExecSQL(stSql);
      Gauge1.Progress := Gauge1.Progress + 1;
      Next;
    end;
  end;

  Gauge1.Visible := False;
end;

function TfmMain.PushServerData: Boolean;
var
  stSql : string;
begin
  Gauge1.Visible := True ;
  stSql := 'select * from TB_CUSTOMER ';
  With ADOLocal do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Gauge1.Visible := False;
      Exit;
    End;
    Gauge1.MaxValue := recordCount;
    Gauge1.Progress := 0;
    while Not Eof do
    begin
      stSql := 'Insert Into TB_CUSTOMER (';
      stSql := stSql + 'CU_TELNO,';
      stSql := stSql + 'CU_NAME,';
      stSql := stSql + 'CU_ETC )';
      stSql := stSql + ' VALUES (';
      stSql := stSql + '''' + FindField('CU_TELNO').AsString + ''',';
      stSql := stSql + '''' + FindField('CU_NAME').AsString + ''',';
      stSql := stSql + '''' + FindField('CU_ETC').AsString + ''') ';
      DataModule1.ProcessBackupExecSQL(stSql);
      Gauge1.Progress := Gauge1.Progress + 1;
      Next;
    end;
  end;

  stSql := 'select * from TB_MANAGELIST ';
  stSql := stSql + ' Where MA_JOIN <> ''Y'' ';
  With ADOLocal do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Gauge1.Visible := False;
      Exit;
    End;
    Gauge1.MaxValue := recordCount;
    Gauge1.Progress := 0;
    while Not Eof do
    begin
      stSql := 'Insert Into TB_MANAGELIST (';
      stSql := stSql + 'MA_DATE,';
      stSql := stSql + 'MA_TIME,';
      stSql := stSql + 'CU_TELNO,';
      stSql := stSql + 'MA_DATA,';
      stSql := stSql + 'MA_PCIP,';
      stSql := stSql + 'MA_QUESTION,';
      stSql := stSql + 'MA_JOIN)';
      stSql := stSql + ' VALUES (';
      stSql := stSql + '''' + FindField('MA_DATE').AsString + ''',';
      stSql := stSql + '''' + FindField('MA_TIME').AsString + ''',';
      stSql := stSql + '''' + FindField('CU_TELNO').AsString + ''',';
      stSql := stSql + '''' + FindField('MA_DATA').AsString + ''',';
      stSql := stSql + '''' + FindField('MA_PCIP').AsString + ''',';
      stSql := stSql + '''' + FindField('MA_QUESTION').AsString + ''',';
      stSql := stSql + '''Y'')';
      DataModule1.ProcessBackupExecSQL(stSql);

      stSql := ' Update TB_MANAGELIST set MA_JOIN = ''Y'' ';
      stSql := stSql + ' WHERE MA_DATE = ''' + FindField('MA_DATE').AsString + ''' ';
      stSql := stSql + ' AND MA_TIME = ''' + FindField('MA_TIME').AsString + ''' ';
      stSql := stSql + ' AND CU_TELNO = ''' + FindField('CU_TELNO').AsString + ''' ';
      DataModule1.ProcessLogExecSQL(stSql);
      Gauge1.Progress := Gauge1.Progress + 1;
      Next;
    end;
  end;

  Gauge1.Visible := False;
end;

procedure TfmMain.WMEndSession(var Msg: TWMEndSession);
begin
  if Msg.EndSession = True then
  begin
//
  end;

end;

procedure TfmMain.WMQueryEndSession(var Msg: TWMQueryEndSession);
begin
//  if MessageDlg('Close Windows ?', mtConfirmation, [mbYes,mbNo], 0) = mrNo then
//    Msg.Result := 0
//  else
    Msg.Result := 1;

end;

procedure TfmMain.WndProc(var Msg: TMessage);
begin
  inherited;
    if Msg.WParam = SC_MINIMIZE then
    begin
      Close;
    end;

end;

procedure TfmMain.N3Click(Sender: TObject);
begin
  fmCustomer:= TfmCustomer.Create(Self);
  fmCustomer.SHowmodal;
  fmCustomer.Free;

end;

procedure TfmMain.edit_recvTelnoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then //
  begin
  end;
end;

procedure TfmMain.edit_recvTelnoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_return then
    perform(WM_NEXTDLGCTL,0,0)
end;

procedure TfmMain.ed_SearchTelNoChange(Sender: TObject);
begin
  SearchManageList('');
end;

procedure TfmMain.mn_F4Click(Sender: TObject);
begin
  btn_saveClick(self);
end;

function TfmMain.getUserName(aTelNo: string): string;
var
  stSql : string;
begin
  result := '';
  stSql := 'select * from TB_CUSTOMER ';
  stSql := stSql + ' Where CU_TELNO = ''' + aTelNo + ''' ';

  with ADOTempQuery do
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
    result := FindField('CU_NAME').AsString;
  end;
end;

function TfmMain.CheckTB_MANAGELIST(aDate, aTelno: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'select * from TB_MANAGELIST ';
  stSql := stSql + ' Where MA_DATE = ''' + copy(aDate,1,8) + ''' ';
  stSql := stSql + ' AND MA_TIME = ''' + copy(aDate,9,4) + ''' ';
  stSql := stSql + ' AND CU_TELNO = ''' + aTelno + ''' ';

  with ADOTempQuery do
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
  end;
  result := True;
end;

procedure TfmMain.ed_ContentChange(Sender: TObject);
begin
  SearchManageList('');
end;

function TfmMain.TableCheck: Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' select * from TB_CUSTOMER ';
  with ADOTempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if FieldCount < 4 then
    begin
      stSql := ' ALTER TABLE TB_CUSTOMER ADD CU_EMAIL Varchar(50) NULL ';
      DataModule1.ProcessExecSQL(stSql);
    end;
  end;
  result := True;
end;

procedure TfmMain.N6Click(Sender: TObject);
begin
  fmAdminConfig:= TfmAdminConfig.Create(Self);
  fmAdminConfig.SHowmodal;
  fmAdminConfig.Free;
  ConfigCheck;
end;

function TfmMain.ConfigCheck: Boolean;
var
  FReg : TRegistry;
  stAutoVisible : string;
begin
  stAutoVisible := '';
  FReg := TRegistry.Create;
 try
   FReg.RootKey := HKEY_LOCAL_MACHINE;
   if FReg.OpenKey('SOFTWARE\Zeron\TelNumberAdmin\AutoVisible', True) then
   begin
     stAutoVisible := FReg.ReadString('AutoVisible');
   end;
   FReg.CloseKey;
 Finally
  FReg.Free;
 end;
 if stAutoVisible <> '' then L_bAutoShow := True
 else L_bAutoShow := False;
 
 result := True;
end;

end.
