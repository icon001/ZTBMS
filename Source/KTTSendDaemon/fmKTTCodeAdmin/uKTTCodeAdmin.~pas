unit uKTTCodeAdmin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, Grids, BaseGrid, AdvGrid, DB, ADODB,
  uSubForm, CommandArray,ActiveX;

type
  TfmKTTCodeAdmin = class(TfmASubForm)
    Panel12: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    sg_Code: TAdvStringGrid;
    cmb_AlarmGroup: TComboBox;
    Label2: TLabel;
    btn_Search: TSpeedButton;
    ADOQuery: TADOQuery;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    btn_Save: TSpeedButton;
    btn_Close: TSpeedButton;
    st_Code: TStaticText;
    st_Mode: TStaticText;
    st_Name: TStaticText;
    ed_kttCode: TEdit;
    cmb_KttSend: TComboBox;
    ed_deviceType: TEdit;
    ed_funcode: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    cmb_sendUse: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure cmb_AlarmGroupChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure ed_kttCodeChange(Sender: TObject);
    procedure cmb_KttSendChange(Sender: TObject);
    procedure sg_CodeClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
  private
    AlarmTypeList : TStringList;
    { Private declarations }
    procedure GetAlarmGroup(cmb_box : TComboBox);
    procedure GetAlarmType(aAlarmGroup:string);
    procedure SearchKTTCode(aCode:string;aTop :integer = 0);
  public
    { Public declarations }
  end;

var
  fmKTTCodeAdmin: TfmKTTCodeAdmin;

implementation
uses
  uLomosUtil,
  uDataModule1;

{$R *.dfm}

procedure TfmKTTCodeAdmin.FormShow(Sender: TObject);
begin
  GetAlarmGroup(cmb_AlarmGroup);
  SearchKTTCode('');

end;

procedure TfmKTTCodeAdmin.GetAlarmGroup(cmb_box: TComboBox);
var
  stSql:string;
begin
  cmb_box.Clear;
  cmb_box.Items.Add('전체');
  cmb_box.ItemIndex := 0;

  stSql := ' Select AG_CODE from TB_ALARMCODEGROUP ';
  stSql := stSql + ' Group by AG_CODE ';

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
    if RecordCount < 1 then Exit;
    First;
    While Not Eof do
    begin
      cmb_Box.Items.Add(FindField('AG_CODE').AsString);
      Next;
    end;
  end;
end;

procedure TfmKTTCodeAdmin.cmb_AlarmGroupChange(Sender: TObject);
begin
  if cmb_AlarmGroup.ItemIndex > 0 then GetAlarmType(cmb_AlarmGroup.Text);
  SearchKTTCode('');
end;

procedure TfmKTTCodeAdmin.FormCreate(Sender: TObject);
begin
  AlarmTypeList := TStringList.Create;
end;

procedure TfmKTTCodeAdmin.FormDestroy(Sender: TObject);
begin
  AlarmTypeList.Free;
end;

procedure TfmKTTCodeAdmin.GetAlarmType(aAlarmGroup: string);
var
  stSql:string;
begin
  AlarmTypeList.Clear;

  stSql := ' Select a.GROUP_CODE,a.AL_ALARMSTATUSCODE,a.AL_ALARMNAME,';
  stSql := stSql + ' a.AL_ALARMVIEW,a.AL_ALARMGRADE,a.AL_ALARMSOUND ';
  stSql := stSql + ' from TB_ALARMSTATUSCODE a';
  if Trim(aAlarmGroup) <> '' then
  begin
    stSql := stSql + ' INNER Join TB_ALARMCODEGROUP b ';
    stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.AL_ALARMSTATUSCODE = b.AL_ALARMSTATUSCODE ';
    stSql := stSql + ' AND b.AG_CODE = ''' + aAlarmGroup + ''') ';
  end;
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' order by a.AL_ALARMNAME ';

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
    if RecordCount < 1 then Exit;
    First;
    While Not Eof do
    begin
      AlarmTypeList.Add(FindField('AL_ALARMSTATUSCODE').AsString);
      Next;
    end;
  end;

end;

procedure TfmKTTCodeAdmin.btn_SearchClick(Sender: TObject);
begin
  SearchKTTCode('');
end;

procedure TfmKTTCodeAdmin.SearchKTTCode(aCode: string; aTop: integer);
var
  stSql : string;
  i : integer;
  stWhere : string;
  nRow : integer;
  TempAdoQuery : TADOQuery;
begin
{  FormClear;
  FormEnable(State);
  ButtonEnable(State); }

  GridInit(sg_Code,6); //스트링그리드 초기화
  stWhere := '';
  
  stSql := 'select a.*,b.AL_ALARMNAME from tb_kttmappingcode a ';
  stSql := stSql + ' Left Join TB_ALARMSTATUSCODE b ';
  stSql := stSql + ' ON(a.al_alarmstatuscode2 = b.AL_ALARMSTATUSCODE) ';
  if cmb_AlarmGroup.itemindex > 0 then
  begin
    if AlarmTypeList.count > 0 then
    begin
      for i := 0 to AlarmTypeList.Count - 1 do
      begin
        if stWhere = '' then stWhere := stWhere + ' Where( '
        else stWhere := stWhere + ' OR ';
        stWhere := stWhere + ' a.al_alarmstatuscode2 = ''' + AlarmTypeList.Strings[i] + ''' ' ;
      end;
      stWhere := stWhere + ') ';
    end;
  end;
  if cmb_sendUse.ItemIndex > 0 then
  begin
    if stWhere = '' then stWhere := stWhere + ' Where '
    else stWhere := stWhere + ' AND ';
    if cmb_sendUse.ItemIndex = 1 then  stWhere := stWhere + 'a.SENDUSE = ''Y'' '
    else stWhere := stWhere + 'a.SENDUSE = ''N'' ';
  end;
  if stWhere <> '' then stSql := stSql + stWhere;
  stSql := stSql + ' order by al_alarmstatuscode2 ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;

    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      if RecordCount < 1 then
      begin
        Exit;
      end;
{방범코드
방범코드명칭
관제이벤트코드
전송유무
알람타입코드
알람모드
관제FUNCODE
KTTCODE  }

      First;
      sg_Code.RowCount := RecordCount + 1;
      nRow := 1;
      while Not Eof do
      begin
        with sg_Code do
        begin
          cells[0,nRow] := FindField('al_alarmstatuscode2').AsString;
          cells[1,nRow] := FindField('AL_ALARMMODECODE').AsString;
          cells[2,nRow] := FindField('AL_ALARMNAME').AsString;
          cells[3,nRow] := FindField('KTTEVENTCODE').AsString;
          cells[4,nRow] := FindField('SENDUSE').AsString;
          cells[5,nRow] := FindField('AL_ALARMDEVICETYPECODE').AsString;
          cells[6,nRow] := FindField('KTTFUNCODE').AsString;
          cells[7,nRow] := FindField('KTTCODE').AsString;

          if FindField('al_alarmstatuscode2').AsString = aCode then
          begin
            SelectRows(nRow,1);
          end;

          nRow := nRow + 1;
        end;
        Next;
      end;
    end;
    if aTop <> 0 then
      sg_Code.topRow := aTop
    else
    begin
      if sg_Code.row > 7 then sg_Code.TopRow := sg_Code.row - 6;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  sg_CodeClick(sg_Code);
end;

procedure TfmKTTCodeAdmin.btn_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmKTTCodeAdmin.ed_kttCodeChange(Sender: TObject);
begin
  inherited;
  btn_Save.Enabled := True;
end;

procedure TfmKTTCodeAdmin.cmb_KttSendChange(Sender: TObject);
begin
  inherited;
  btn_Save.Enabled := True;
end;

procedure TfmKTTCodeAdmin.sg_CodeClick(Sender: TObject);
begin
  inherited;
  with sg_Code do
  begin
    st_Code.Caption := cells[0,Row];
    st_Mode.Caption := cells[1,Row];
    st_Name.Caption := cells[2,Row];
    ed_kttCode.Text := cells[3,Row];
    if cells[4,Row] = 'N' then cmb_KttSend.ItemIndex := 1
    else cmb_KttSend.ItemIndex := 0;
    ed_deviceType.Text := cells[5,Row];
    ed_funcode.Text := cells[6,Row];
  end;
  btn_Save.Enabled := False;
end;

procedure TfmKTTCodeAdmin.btn_SaveClick(Sender: TObject);
var
  stSql : string;
  stSendUse : string;
begin
  stSendUse := 'Y';
  if cmb_KttSend.ItemIndex = 1 then stSendUse := 'N' ;
  stSql := 'update TB_KTTMAPPINGCODE set ';
  stSql := stSql + ' KTTFUNCODE = ''' + ed_funcode.Text + ''', ';
  stSql := stSql + ' KTTEVENTCODE = ''' + ed_kttCode.Text + ''', ';
  stSql := stSql + ' SENDUSE = ''' + stSendUse + ''' ';
  stSql := stSql + ' Where AL_ALARMDEVICETYPECODE = ''' + ed_deviceType.Text + ''' ';
  stSql := stSql + ' AND AL_ALARMMODECODE = ''' + st_Mode.Caption + ''' ';
  stSql := stSql + ' AND AL_ALARMSTATUSCODE2 = ''' + st_Code.Caption + ''' ';

  if Not DataModule1.ProcessExecSQL(stSql) then
  begin
    showmessage('데이터저장에 실패하였습니다.');
    Exit;
  end;
  SearchKTTCode(st_Code.Caption);
end;

end.
