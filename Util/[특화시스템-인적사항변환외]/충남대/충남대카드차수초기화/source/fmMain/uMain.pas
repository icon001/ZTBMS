unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, BaseGrid, AdvGrid, ExtCtrls, DB, ADODB,
  ActiveX, Gauges, ComCtrls;

type
  TfmMain = class(TForm)
    OpenDialog1: TOpenDialog;
    GroupBox3: TGroupBox;
    btn_WorkBranch: TBitBtn;
    GroupBox4: TGroupBox;
    btn_targetAdoConnect: TSpeedButton;
    ed_Host: TEdit;
    rg_dbtype: TRadioGroup;
    Label5: TLabel;
    Label6: TLabel;
    ed_Port: TEdit;
    Label7: TLabel;
    ed_Userid: TEdit;
    Label8: TLabel;
    ed_Passwd: TEdit;
    MDBADOConnection: TADOConnection;
    TargetADOConnection: TADOConnection;
    MdbADO: TADOQuery;
    Label9: TLabel;
    ed_DBName: TEdit;
    targetTempADOQuery: TADOQuery;
    targetADOExecQuery: TADOQuery;
    StatusBar1: TStatusBar;
    btnClose: TBitBtn;
    Gauge1: TGauge;
    GroupBox2: TGroupBox;
    btn_FileSearch: TSpeedButton;
    Label4: TLabel;
    ed_DBPath: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_targetAdoConnectClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btn_WorkBranchClick(Sender: TObject);
    procedure btn_FileSearchClick(Sender: TObject);
  private
    CardList : TStringList;
    { Private declarations }
    Function targetAdoConnect:Boolean;
  private
    Function CheckTB_CARD(aGROUP_CODE,aCardNo:string):Boolean;
    Function InsertTB_CARD(aGROUP_CODE,aCA_CARDNO,aCA_GUBUN,aCA_CARDTYPE,aCO_COMPANYCODE,aEM_CODE,aCA_LASTUSE,aCA_UPDATETIME,aCA_UPDATEOPERATOR,aCA_STATUS,aPOSITIONNUM,aCA_DOORGRADE:string) : Boolean;
    Function UpdateTB_CARD(aGROUP_CODE,aCA_CARDNO,aCA_GUBUN,aCA_CARDTYPE,aCO_COMPANYCODE,aEM_CODE,aCA_LASTUSE,aCA_UPDATETIME,aCA_UPDATEOPERATOR,aCA_STATUS,aPOSITIONNUM,aCA_DOORGRADE:string) : Boolean;
    Function DeleteTB_CARDNotInitilize(aCardNo:string):Boolean;
    Function CheckTB_DEVICECARDNO(aGROUP_CODE,aAC_NODENO,aAC_ECUID,aCA_CARDNO:string):Boolean;
    Function InsertTB_DEVICECARDNO(aGROUP_CODE,aAC_NODENO,aAC_ECUID,aCA_CARDNO,aDE_DOOR1,aDE_DOOR2,aDE_USEACCESS,aDE_USEALARM,aDE_TIMECODE,aDE_PERMIT,aDE_RCVACK,aDE_UPDATETIME,aDE_UPDATEOPERATOR:string) : Boolean;
    Function UpdateTB_DEVICECARDNO(aGROUP_CODE,aAC_NODENO,aAC_ECUID,aCA_CARDNO,aDE_DOOR1,aDE_DOOR2,aDE_USEACCESS,aDE_USEALARM,aDE_TIMECODE,aDE_PERMIT,aDE_RCVACK,aDE_UPDATETIME,aDE_UPDATEOPERATOR:string) : Boolean;
    Function DeleteTB_DEVICECARDNONotInitilize(aCardNo:string):Boolean;

    procedure TB_CardInitialize(aEmCode:string);
    procedure TB_DEVICECARDNOIniitialize(aEmCode:string);
    
    Function ProcessExecSQL(aSql:string;bUpdateResult:Boolean=False):Boolean;
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;
  GROUPCODE : string;

implementation

uses
  uLomosUtil;

{$R *.dfm}

procedure TfmMain.FormActivate(Sender: TObject);
begin
  btn_WorkBranch.Enabled := False;
end;

procedure TfmMain.FormCreate(Sender: TObject);
begin
  CardList := TStringList.Create;

  GROUPCODE := '1234567890';
end;

procedure TfmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CardList.Free;

end;

procedure TfmMain.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmMain.btn_targetAdoConnectClick(Sender: TObject);
begin
  btn_WorkBranch.Enabled := False;
  if targetAdoConnect then
  begin
    btn_WorkBranch.Enabled := True;
  end else
  begin
    showmessage('데이터베이스 접속실패');
  end;
end;

function TfmMain.targetAdoConnect: Boolean;
var
  conStr : wideString;
begin
  result := False;
  if rg_dbtype.ItemIndex = 0 then  //Mssql
  begin
    conStr := constr + 'Provider=SQLOLEDB.1;';
    conStr := constr + 'Password=' + ed_Passwd.Text + ';';
    conStr := constr + 'Persist Security Info=True;';
    conStr := constr + 'User ID=' + ed_Userid.Text + ';';
    conStr := constr + 'Initial Catalog=' + ed_DBName.Text + ';';
    conStr := constr + 'Data Source=' + ed_Host.Text  + ',' + ed_Port.Text;
  end else if rg_dbtype.ItemIndex = 1 then   //PostGresql
  begin
    conStr := 'Provider=PostgreSQL OLE DB Provider;';
    conStr := constr + 'Data Source=' + ed_Host.Text + ';'   ;
    conStr := constr + 'location=' + ed_DBName.Text + ';';
    conStr := constr + 'User Id='+ ed_Userid.Text + ';';
    conStr := constr + 'password=' + ed_Passwd.Text;
  end  else
  begin
    showmessage('데이터베이스 타입을 선택 하세요.');
    Exit;
  end;
  with TargetADOConnection do
  begin
    Connected := False;
    Try
      ConnectionString := conStr;
      LoginPrompt:= false ;
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
    CursorLocation := clUseServer;
  end;

  result := True;
end;

function TfmMain.ProcessExecSQL(aSql: string;bUpdateResult:Boolean=False): Boolean;
var
  ExecQuery :TADOQuery;
  nResult : integer;
begin
  Result:= False;
  Try
    CoInitialize(nil);
    ExecQuery := TADOQuery.Create(nil);
    ExecQuery.Connection := TargetADOConnection;
    ExecQuery.DisableControls;
    with ExecQuery do
    begin
      Close;
      SQL.Text:= aSql;
      try
        nResult := ExecSQL;
      except
      ON E: Exception do
        begin

{          //SQLErrorLog('DBError('+ E.Message + ')' + aSql);
          if Pos('no connection to the server',E.Message) > 0 then
          begin
            if Assigned(FOnAdoConnected) then
            begin
              OnAdoConnected(Self,False);
            end;
          end;
          if Pos('server closed the connection',E.Message) > 0 then
          begin
            if Assigned(FOnAdoConnected) then
            begin
              OnAdoConnected(Self,False);
            end;
          end;
          if Pos('연결을 실패했습니다',E.Message) > 0 then
          begin
            if Assigned(FOnAdoConnected) then
            begin
              OnAdoConnected(Self,False);
            end;
          end;      }

          Exit;
        end
      end;
    end;
  Finally
    ExecQuery.EnableControls;
    ExecQuery.Free;
    CoUninitialize;
  End;

  if bUpdateResult then
  begin
    if nResult > 0 then Result := True
    else
    begin
      Result := False;
      //SQLErrorLog('DBError:'+ aSql);
    end;
  end else
  begin
    Result:= True;
  end;
end;


function TfmMain.CheckTB_CARD(aGROUP_CODE,aCardNo: string): Boolean;
var
  stSql: string;
  TempAdoQuery : TADOQuery;
begin
  Result := False;
  stSql := 'select * from TB_CARD ';
  stSql := stSql + ' where CA_CARDNO = ''' + aCardNo + ''' ';
  stSql := stSql + ' AND GROUP_CODE = ''' + aGROUP_CODE + ''' ';

  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := TargetADOConnection;
  with TempAdoQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      Open;
    Except
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;
    if RecordCount > 0 then Result := True;
  end;
  TempAdoQuery.Free;
  CoUninitialize;

end;

procedure TfmMain.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmMain.btn_WorkBranchClick(Sender: TObject);
var
  i : integer;
  stEmCode : string;
begin
  if Not FileExists(ed_DBPath.Text) then
  begin
    showmessage('파일이 없습니다.');
    Exit;
  end;
  CardList.Clear;
  CardList.LoadFromFile(ed_DBPath.Text);
  btn_WorkBranch.Enabled := False;
  Gauge1.Visible := True;
  Gauge1.MaxValue := CardList.Count - 1;
  Gauge1.Progress := 0;
  for i := 1 to CardList.Count - 1 do
  begin
    stEmCode := CardList.Strings[i];
    if Trim(stEmCode) <> '' then
    begin
      stEmCode := FillZeroStrNum(stEmCode,9);
      TB_CardInitialize(stEmCode);
      TB_DEVICECARDNOIniitialize(stEmCode);
    end;
    Gauge1.Progress := i;
    Application.ProcessMessages;
  end;
  btn_WorkBranch.Enabled := True;
end;



function TfmMain.InsertTB_CARD(aGROUP_CODE, aCA_CARDNO, aCA_GUBUN,
  aCA_CARDTYPE, aCO_COMPANYCODE, aEM_CODE, aCA_LASTUSE, aCA_UPDATETIME,
  aCA_UPDATEOPERATOR, aCA_STATUS, aPOSITIONNUM,
  aCA_DOORGRADE: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_CARD(';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'CA_CARDNO,';
  stSql := stSql + 'CA_GUBUN,';
  stSql := stSql + 'CA_CARDTYPE,';
  stSql := stSql + 'CO_COMPANYCODE,';
  stSql := stSql + 'EM_CODE,';
  stSql := stSql + 'CA_LASTUSE,';
  stSql := stSql + 'CA_UPDATETIME,';
  stSql := stSql + 'CA_UPDATEOPERATOR,';
  stSql := stSql + 'CA_STATUS,';
  stSql := stSql + 'POSITIONNUM,';
  stSql := stSql + 'CA_DOORGRADE)';
  stSql := stSql + ' Values(';
  stSql := stSql + '''' + aGROUP_CODE + ''',';
  stSql := stSql + '''' + aCA_CARDNO + ''',';
  stSql := stSql + '''' + aCA_GUBUN + ''',';
  stSql := stSql + '''' + aCA_CARDTYPE + ''',';
  stSql := stSql + '''' + aCO_COMPANYCODE + ''',';
  stSql := stSql + '''' + aEM_CODE + ''',';
  stSql := stSql + '''' + aCA_LASTUSE + ''',';
  stSql := stSql + '''' + aCA_UPDATETIME + ''',';
  stSql := stSql + '''' + aCA_UPDATEOPERATOR + ''',';
  stSql := stSql + '''' + aCA_STATUS + ''',';
  stSql := stSql + '' + aPOSITIONNUM + ',';
  stSql := stSql + '''' + aCA_DOORGRADE + ''')';

  result := ProcessExecsql(stSql);
end;

function TfmMain.UpdateTB_CARD(aGROUP_CODE, aCA_CARDNO, aCA_GUBUN,
  aCA_CARDTYPE, aCO_COMPANYCODE, aEM_CODE, aCA_LASTUSE, aCA_UPDATETIME,
  aCA_UPDATEOPERATOR, aCA_STATUS, aPOSITIONNUM,
  aCA_DOORGRADE: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_CARD set ';
  stSql := stSql + 'CA_GUBUN = ''' + aCA_GUBUN + ''',';
  stSql := stSql + 'CA_CARDTYPE = ''' + aCA_CARDTYPE + ''',';
  stSql := stSql + 'CO_COMPANYCODE = ''' + aCO_COMPANYCODE + ''',';
  stSql := stSql + 'EM_CODE = ''' + aEM_CODE + ''',';
  stSql := stSql + 'CA_LASTUSE = ''' + aCA_LASTUSE + ''',';
  stSql := stSql + 'CA_UPDATETIME = ''' + aCA_UPDATETIME + ''',';
  stSql := stSql + 'CA_UPDATEOPERATOR = ''' + aCA_UPDATEOPERATOR + ''',';
  stSql := stSql + 'CA_STATUS = ''' + aCA_STATUS + ''',';
  stSql := stSql + 'POSITIONNUM = ' + aPOSITIONNUM + ',';
  stSql := stSql + 'CA_DOORGRADE = ''' + aCA_DOORGRADE + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + aGROUP_CODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCA_CARDNO + ''' ';

  result := ProcessExecsql(stSql);
end;

function TfmMain.CheckTB_DEVICECARDNO(aGROUP_CODE, aAC_NODENO, aAC_ECUID,
  aCA_CARDNO: string): Boolean;
var
  stSql: string;
  TempAdoQuery : TADOQuery;
begin
  Result := False;
  stSql := 'select * from TB_DEVICECARDNO ';
  stSql := stSql + ' where CA_CARDNO = ''' + aCA_CARDNO + ''' ';
  stSql := stSql + ' AND GROUP_CODE = ''' + aGROUP_CODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aAC_NODENO + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aAC_ECUID + ''' ';

  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := TargetADOConnection;
  with TempAdoQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      Open;
    Except
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;
    if RecordCount > 0 then Result := True;
  end;
  TempAdoQuery.Free;
  CoUninitialize;

end;

function TfmMain.InsertTB_DEVICECARDNO(aGROUP_CODE, aAC_NODENO, aAC_ECUID,
  aCA_CARDNO, aDE_DOOR1, aDE_DOOR2, aDE_USEACCESS, aDE_USEALARM,
  aDE_TIMECODE, aDE_PERMIT, aDE_RCVACK, aDE_UPDATETIME,
  aDE_UPDATEOPERATOR: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_DEVICECARDNO(';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'AC_NODENO,';
  stSql := stSql + 'AC_ECUID,';
  stSql := stSql + 'CA_CARDNO,';
  stSql := stSql + 'DE_DOOR1,';
  stSql := stSql + 'DE_DOOR2,';
  stSql := stSql + 'DE_USEACCESS,';
  stSql := stSql + 'DE_USEALARM,';
  stSql := stSql + 'DE_TIMECODE,';
  stSql := stSql + 'DE_PERMIT,';
  stSql := stSql + 'DE_RCVACK,';
  stSql := stSql + 'DE_UPDATETIME,';
  stSql := stSql + 'DE_UPDATEOPERATOR )';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + aGROUP_CODE + ''',';
  stSql := stSql + '' + aAC_NODENO + ',';
  stSql := stSql + '''' + aAC_ECUID + ''',';
  stSql := stSql + '''' + aCA_CARDNO + ''',';
  stSql := stSql + '''' + aDE_DOOR1 + ''',';
  stSql := stSql + '''' + aDE_DOOR2 + ''',';
  stSql := stSql + '''' + aDE_USEACCESS + ''',';
  stSql := stSql + '''' + aDE_USEALARM + ''',';
  stSql := stSql + '''' + aDE_TIMECODE + ''',';
  stSql := stSql + '''' + aDE_PERMIT + ''',';
  stSql := stSql + '''' + aDE_RCVACK + ''',';
  stSql := stSql + '''' + aDE_UPDATETIME + ''',';
  stSql := stSql + '''' + aDE_UPDATEOPERATOR + ''')';

  result := ProcessExecsql(stSql);

end;

function TfmMain.UpdateTB_DEVICECARDNO(aGROUP_CODE, aAC_NODENO, aAC_ECUID,
  aCA_CARDNO, aDE_DOOR1, aDE_DOOR2, aDE_USEACCESS, aDE_USEALARM,
  aDE_TIMECODE, aDE_PERMIT, aDE_RCVACK, aDE_UPDATETIME,
  aDE_UPDATEOPERATOR: string): Boolean;
var
  stSql : string;
begin
  stSql := ' update TB_DEVICECARDNO set ';
  stSql := stSql + 'DE_DOOR1 = ''' + aDE_DOOR1 + ''',';
  stSql := stSql + 'DE_DOOR2 = ''' + aDE_DOOR2 + ''',';
  stSql := stSql + 'DE_USEACCESS = ''' + aDE_USEACCESS + ''',';
  stSql := stSql + 'DE_USEALARM = ''' + aDE_USEALARM + ''',';
  stSql := stSql + 'DE_TIMECODE = ''' + aDE_TIMECODE + ''',';
  stSql := stSql + 'DE_PERMIT = ''' + aDE_PERMIT + ''',';
  stSql := stSql + 'DE_RCVACK = ''' + aDE_RCVACK + ''',';
  stSql := stSql + 'DE_UPDATETIME = ''' + aDE_UPDATETIME + ''',';
  stSql := stSql + 'DE_UPDATEOPERATOR = ''' + aDE_UPDATEOPERATOR + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + aGROUP_CODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aAC_NODENO + '';
  stSql := stSql + ' AND AC_ECUID = ''' + aAC_ECUID + '''';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCA_CARDNO + ''' ';

  result := ProcessExecsql(stSql);

end;


function TfmMain.DeleteTB_CARDNotInitilize(aCardNo:string): Boolean;
var
  stSql : string;
begin
  stSql := ' Delete From TB_CARD where ca_cardno = ''' + aCardNo + ''' ';
  stSql := stSql +  ' AND substring(ca_cardno,14,2) <> ''00'' ';

  result := ProcessExecsql(stSql);

end;


function TfmMain.DeleteTB_DEVICECARDNONotInitilize(aCardNo:string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_DEVICECARDNO set DE_PERMIT = ''N'',DE_RCVACK = ''N''  ';
  stSql := stSql + ' where ca_cardno = ''' + aCardNo + ''' ';
  stSql := stSql +  ' AND substring(ca_cardno,14,2) <> ''00'' ';

  result := ProcessExecsql(stSql);

end;

procedure TfmMain.TB_CardInitialize(aEmCode:string);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  stSql := ' Select * from TB_CARD ';
  stSql := stSql +  ' Where EM_CODE = ''' + aEmCode + ''' ';
  stSql := stSql +  ' AND substring(ca_cardno,14,2) <> ''00'' ';
  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := TargetADOConnection;
  with TempAdoQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      Open;
    Except
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;
    While Not Eof do
    begin
      if CheckTB_CARD(FindField('GROUP_CODE').AsString,copy(FindField('CA_CARDNO').AsString,1,13) + '00') then
      begin
        UpdateTB_CARD(FindField('GROUP_CODE').AsString,
                      copy(FindField('CA_CARDNO').AsString,1,13) + '00',
                      FindField('CA_GUBUN').AsString,
                      FindField('CA_CARDTYPE').AsString,
                      FindField('CO_COMPANYCODE').AsString,
                      FindField('EM_CODE').AsString,
                      FindField('CA_LASTUSE').AsString,
                      FindField('CA_UPDATETIME').AsString,
                      FindField('CA_UPDATEOPERATOR').AsString,
                      FindField('CA_STATUS').AsString,
                      FindField('POSITIONNUM').AsString,
                      FindField('CA_DOORGRADE').AsString);
      end else
      begin
        InsertTB_CARD(FindField('GROUP_CODE').AsString,
                      copy(FindField('CA_CARDNO').AsString,1,13) + '00',
                      FindField('CA_GUBUN').AsString,
                      FindField('CA_CARDTYPE').AsString,
                      FindField('CO_COMPANYCODE').AsString,
                      FindField('EM_CODE').AsString,
                      FindField('CA_LASTUSE').AsString,
                      FindField('CA_UPDATETIME').AsString,
                      FindField('CA_UPDATEOPERATOR').AsString,
                      FindField('CA_STATUS').AsString,
                      FindField('POSITIONNUM').AsString,
                      FindField('CA_DOORGRADE').AsString);
      end;
      DeleteTB_CARDNotInitilize(FindField('CA_CARDNO').AsString);
      Next;
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

procedure TfmMain.TB_DEVICECARDNOIniitialize(aEmCode:string);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  stSql := ' Select * from TB_DEVICECARDNO ';
  stSql := stSql +  ' Where substring(ca_cardno,1,9) = ''' + aEmCode + ''' ';
  stSql := stSql +  ' AND substring(ca_cardno,14,2) <> ''00'' ';
  stSql := stSql +  ' AND DE_PERMIT = ''L'' ';
  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := TargetADOConnection;
  with TempAdoQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      Open;
    Except
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;
    While Not Eof do
    begin
      if CheckTB_DEVICECARDNO(FindField('GROUP_CODE').AsString,inttostr(FindField('AC_NODENO').AsInteger),FindField('AC_ECUID').AsString,copy(FindField('CA_CARDNO').AsString,1,13) + '00') then
      begin
        UpdateTB_DEVICECARDNO(FindField('GROUP_CODE').AsString,
                      inttostr(FindField('AC_NODENO').AsInteger),
                      FindField('AC_ECUID').AsString,
                      copy(FindField('CA_CARDNO').AsString,1,13) + '00',
                      FindField('DE_DOOR1').AsString,
                      FindField('DE_DOOR2').AsString,
                      FindField('DE_USEACCESS').AsString,
                      FindField('DE_USEALARM').AsString,
                      FindField('DE_TIMECODE').AsString,
                      FindField('DE_PERMIT').AsString,
                      'N',
                      FindField('DE_UPDATETIME').AsString,
                      FindField('DE_UPDATEOPERATOR').AsString);
      end else
      begin
        InsertTB_DEVICECARDNO(FindField('GROUP_CODE').AsString,
                      inttostr(FindField('AC_NODENO').AsInteger),
                      FindField('AC_ECUID').AsString,
                      copy(FindField('CA_CARDNO').AsString,1,13) + '00',
                      FindField('DE_DOOR1').AsString,
                      FindField('DE_DOOR2').AsString,
                      FindField('DE_USEACCESS').AsString,
                      FindField('DE_USEALARM').AsString,
                      FindField('DE_TIMECODE').AsString,
                      FindField('DE_PERMIT').AsString,
                      'N',
                      FindField('DE_UPDATETIME').AsString,
                      FindField('DE_UPDATEOPERATOR').AsString);

      end;
      DeleteTB_DEVICECARDNONotInitilize(FindField('CA_CARDNO').AsString);
      Next;
      Application.ProcessMessages;
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

procedure TfmMain.btn_FileSearchClick(Sender: TObject);
begin
  ed_DBPath.Text := '';
  OpenDialog1.DefaultExt := 'csv';
  if OpenDialog1.Execute then
  begin
    ed_DBPath.Text := OpenDialog1.FileName;
  end;
end;

end.
