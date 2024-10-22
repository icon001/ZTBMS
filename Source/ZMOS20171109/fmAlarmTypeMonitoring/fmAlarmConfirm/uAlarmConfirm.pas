unit uAlarmConfirm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, Grids, BaseGrid, AdvGrid,ADODB,ActiveX,
  uSubForm, CommandArray, AdvObj;

type
  TfmAlarmConfirm = class(TfmASubForm)
    Panel12: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    st_AlarmName: TStaticText;
    btn_AlarmConfirm: TSpeedButton;
    btn_Close: TSpeedButton;
    sg_AlarmReport: TAdvStringGrid;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    cmb_AlarmCheckCode: TComboBox;
    Label3: TLabel;
    ed_userName: TEdit;
    Label4: TLabel;
    ed_Message: TEdit;
    Image1: TImage;
    Label5: TLabel;
    Panel2: TPanel;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    st_AlarmName1: TStaticText;
    st_TelNo: TStaticText;
    mem_etc: TMemo;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure sg_AlarmReportCheckBoxClick(Sender: TObject; ACol,
      ARow: Integer; State: Boolean);
    procedure ed_userNameKeyPress(Sender: TObject; var Key: Char);
    procedure ed_MessageKeyPress(Sender: TObject; var Key: Char);
    procedure btn_AlarmConfirmClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure sg_AlarmReportClick(Sender: TObject);
  private
    AlarmCheckCodeList : TStringList;
    FAlarmName: string;
    { Private declarations }
    procedure LoadAlarmCheckCode;
    procedure LoadAlarmEvent;
    procedure LoadAlarmAreaInfoLoad;
    procedure SetAlarmName(const Value: string);
    Function updateTB_AlarmEventAlarmCheck(aDate,aTime,aNodeNo,aEcuID,aMsgNo,aCheckOk,aCheckCode,aCheckUser,aCheckMessage:string):Boolean;

  public
    AlarmID : string;
    bAlarmConfirm : Boolean;

    { Public declarations }
    procedure AdvStrinGridSetAllCheck(Sender: TObject;bchkState:Boolean);
  public
    property AlarmName : string read FAlarmName  write SetAlarmName;
  end;

var
  fmAlarmConfirm: TfmAlarmConfirm;

implementation
uses
  uLomosUtil,
  uDataModule1;

{$R *.dfm}

procedure TfmAlarmConfirm.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmAlarmConfirm.LoadAlarmCheckCode;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  stSql := ' Select * from TB_ALARMCHECKCODE ';
  cmb_AlarmCheckCode.Clear;
  AlarmCheckCodeList.Clear;
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;
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
      if recordCount < 1  then Exit;

      while Not Eof do
      begin
        cmb_AlarmCheckCode.Items.Add(FindField('AL_ALARMCHECKCODENAME').AsString);
        AlarmCheckCodeList.Add(FindField('AL_ALARMCHECKCODE').AsString);
        Next;
      end;
      cmb_AlarmCheckCode.ItemIndex := 0;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TfmAlarmConfirm.FormCreate(Sender: TObject);
begin
  AlarmCheckCodeList := TStringList.Create;
  bAlarmConfirm := False;
end;

procedure TfmAlarmConfirm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  AlarmCheckCodeList.Free;
end;

procedure TfmAlarmConfirm.FormShow(Sender: TObject);
begin
  LoadAlarmCheckCode;
  LoadAlarmEvent;
  LoadAlarmAreaInfoLoad;
end;

procedure TfmAlarmConfirm.SetAlarmName(const Value: string);
begin
  FAlarmName := Value;
  st_AlarmName.Caption := Value;
  st_AlarmName1.Caption := Value;
end;

procedure TfmAlarmConfirm.LoadAlarmEvent;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
  nRow : integer;
begin
  GridInit(sg_AlarmReport,7,2,True);


  stSql := ' Select a.*,b.AL_ALARMNAME,c.AR_NAME,c.AR_TELNO,c.AR_MEMO from TB_ALARMEVENT a';
  stSql := stSql + ' Left Join TB_ALARMSTATUSCODE b ';
  stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AL_ALARMSTATUSCODE = b.AL_ALARMSTATUSCODE )';
  stSql := stSql + ' Left Join TB_ARMAREA c ';
  stSql := stSql + ' ON ( a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = c.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = c.AC_ECUID  ';
  stSql := stSql + ' AND a.AL_ZONECODE = c.AR_AREANO ) ';
  stSql := stSql + ' Where a.AL_CHECKOK = ''N'' ';
  stSql := stSql + ' AND ( ( b.AL_ALARMVIEW = 1 ';
  if Not PTAlarmConfirmEvent then stSql := stSql + ' AND b.AL_ALARMSOUND = 1 ';  //알람이벤트가 조회 안됨
  stSql := stSql + ' ) OR ';
  stSql := stSql + ' ( a.AL_ISALARM = ''1'' ';
  if Not PTAlarmConfirmEvent then stSql := stSql + ' AND a.AL_SOUND = ''1'' ';     //통신데몬에서 침입인 경우 강제로 셋트함... 단,방범코드에서 적용하는 경우 반드시 통신데몬을 재시작 해주어야 적용되는 부분이 있음
  stSql := stSql + ' ) ) ';
  if AlarmID <> '' then
  begin
    stSql := stSql + ' AND a.AC_NODENO = ' + inttostr(strtoint(copy(AlarmID,1,3))) ;
    stSql := stSql + ' AND a.AC_ECUID = ''' +  copy(AlarmID,4,2) + ''' ';
    if copy(AlarmID,6,1) <> '' then stSql := stSql + ' AND a.AL_ZONECODE = ''' + fillZeroStrNum(copy(AlarmID,6,1),2) + ''' ';
  end;
  stSql := stSql + ' Order by a.AL_DATE DESC,a.AL_TIME DESC ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;
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
      if recordCount < 1  then
      begin
        Exit;
      end;
      First;
      nRow := 1;
      sg_AlarmReport.RowCount := RecordCount + 1;

      while Not Eof do
      begin
        with sg_AlarmReport  do
        begin
          cells[0,nRow] := FindField('AR_NAME').AsString;
          cells[1,nRow] := copy(FindField('AL_DATE').AsString,1,4) + '-' + copy(FindField('AL_DATE').AsString,5,2)
                           + '-' + copy(FindField('AL_DATE').AsString,7,2)
                           + ' ' + copy(FindField('AL_TIME').AsString,1,2)
                           + ':' + copy(FindField('AL_TIME').AsString,3,2)
                           + ':' + copy(FindField('AL_TIME').AsString,5,2);   //발생시각
          cells[2,nRow] := FindField('AL_ZONENO').AsString;
          cells[3,nRow] := FindField('AL_ALARMDEVICETYPECODE').AsString;
          cells[4,nRow] := FindField('AL_SUBADDR').AsString;
          if FindField('AL_ALARMMODECODE').AsString = 'D' then cells[5,nRow] := '해제모드'
          else if FindField('AL_ALARMMODECODE').AsString = 'A' then cells[5,nRow] := '경계모드';
          if FindField('AL_ALARMNAME').AsString <> '' then
            cells[6,nRow] := FindField('AL_ALARMNAME').AsString + '(' + FindField('AL_OPERATOR').AsString + ')'
          else cells[6,nRow] := FindField('AL_ALARMSTATUSCODE').AsString + '(' + FindField('AL_OPERATOR').AsString + ')';
          cells[7,nRow] := FindField('AL_MSGNO').AsString;
          cells[8,nRow] := FindField('AC_NODENO').AsString;
          cells[9,nRow] := FindField('AC_ECUID').AsString;
          cells[10,nRow] := FindField('AR_TELNO').AsString;
          cells[11,nRow] := FindField('AR_MEMO').AsString;
          AddCheckBox(0,nRow,True,False);
        end;
        nRow := nRow + 1;
        Next;
      end;
      sg_AlarmReportClick(sg_AlarmReport);
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmAlarmConfirm.sg_AlarmReportCheckBoxClick(Sender: TObject;
  ACol, ARow: Integer; State: Boolean);
begin
  if ARow = 0 then //전체선택 또는 해제
  begin
    AdvStrinGridSetAllCheck(Sender,State);
  end;

end;

procedure TfmAlarmConfirm.AdvStrinGridSetAllCheck(Sender: TObject;
  bchkState: Boolean);
var
  i : integer;
begin
    for i:= 1 to (Sender as TAdvStringGrid).RowCount - 1  do
    begin
      (Sender as TAdvStringGrid).SetCheckBoxState(0,i,bchkState);
    end;

end;

procedure TfmAlarmConfirm.ed_userNameKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    Key := #0;
    ed_Message.SetFocus;
  end;
end;

procedure TfmAlarmConfirm.ed_MessageKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    Key := #0;
    btn_AlarmConfirmClick(self);
  end;

end;

procedure TfmAlarmConfirm.btn_AlarmConfirmClick(Sender: TObject);
var
  nLoop : integer;
  bchkState : boolean;
  stDate : string;
  stTime : string;
  stNodeNo : string;
  stEcuID : string;
  stMsgNo : string;
  stCheckCode : string;
  stCheckUser : string;
  stCheckMessage : string;
begin
  if ed_userName.Text = '' then
  begin
    showmessage('확인자를 입력해 주세요.');
    ed_userName.SetFocus;
    Exit;
  end;

  btn_AlarmConfirm.Enabled := False;
  with sg_AlarmReport do
  begin
    stCheckCode := AlarmCheckCodeList.strings[cmb_AlarmCheckCode.itemIndex];
    stCheckUser := ed_userName.Text;
    stCheckMessage := ed_Message.Text;
    for nLoop := 1 to RowCount - 1 do   //체크되어 있는 알람을 모두 확인 함.
    begin
      GetCheckBoxState(0,nLoop, bchkState);
      if bchkState then  //체크 되어 있으면
      begin
        bAlarmConfirm := True;
        stTime := Cells[1,nLoop];
        stTime := stringReplace(stTime,':','',[rfReplaceAll]);
        stTime := stringReplace(stTime,'-','',[rfReplaceAll]);
        stTime := stringReplace(stTime,' ','',[rfReplaceAll]);
        stDate := copy(stTime,1,8);
        Delete(stTime,1,8);
        stMsgNo := Cells[7,nLoop];
        stNodeNo := Cells[8,nLoop];
        stEcuID := Cells[9,nLoop];

        updateTB_AlarmEventAlarmCheck(stDate,stTime,stNodeNo,stEcuID,stMsgNo,'Y',stCheckCode,stCheckUser,stCheckMessage);


        Application.ProcessMessages;
      end;
      Label5.Caption := inttostr(nLoop) + '/' + inttostr(RowCount - 1);
    end;
  end;
  btn_AlarmConfirm.Enabled := True;
  if Not bAlarmConfirm then
  begin
    showmessage('처리 할 알람을 선택 해 주세요.');
    Exit;
  end;
  LoadAlarmEvent;

  
end;

function TfmAlarmConfirm.updateTB_AlarmEventAlarmCheck(aDate, aTime,
  aNodeNo, aEcuID, aMsgNo, aCheckOk, aCheckCode, aCheckUser,
  aCheckMessage: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_ALARMEVENT set ';
  stSql := stSql + ' AL_CHECKOK = ''' + aCheckOk + ''',';
  stSql := stSql + ' AL_CHECKCODE = ''' + aCheckCode + ''',';
  stSql := stSql + ' AL_CHECKMSG = ''' + aCheckMessage + ''',';
  stSql := stSql + ' al_updatetime = ''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',';
  stSql := stSql + ' AL_CHECKUSER = ''' + aCheckUser + ''' ';
  stSql := stSql + ' Where AL_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND AL_TIME = ''' + aTime + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo;
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND AL_MSGNO = ''' + aMsgNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

procedure TfmAlarmConfirm.Image1Click(Sender: TObject);
begin
  LoadAlarmEvent;
end;

procedure TfmAlarmConfirm.sg_AlarmReportClick(Sender: TObject);
begin
{  with sg_AlarmReport do
  begin
    st_AlarmName1.Caption := Cells[0,Row];
    st_TelNo.Caption := Cells[10,Row];
    mem_etc.Text := Cells[11,Row];
  end;
}
end;

procedure TfmAlarmConfirm.LoadAlarmAreaInfoLoad;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  if Length(AlarmID) < 5 then exit;
  stSql := ' Select AR_NAME,AR_TELNO,AR_MEMO from TB_ARMAREA ';
  stSql := stSql + ' Where AC_NODENO = ' + inttostr(strtoint(copy(AlarmID,1,3))) ;
  stSql := stSql + ' AND AC_ECUID = ''' +  copy(AlarmID,4,2) + ''' ';
  stSql := stSql + ' AND AR_AREANO = ''' +  FillZeroStrNum(copy(AlarmID,6,1),2) + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;
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
      if recordCount < 1  then Exit;
      First;
      st_TelNo.Caption := FindField('AR_TELNO').AsString;
      mem_etc.Text := FindField('AR_MEMO').AsString;
    End;

  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

end.
