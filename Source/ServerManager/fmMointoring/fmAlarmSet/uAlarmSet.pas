unit uAlarmSet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB;

type
  TfmAlarmSet = class(TForm)
    GroupBox1: TGroupBox;
    ed_AlarmName: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    ed_AlarmCode: TEdit;
    ed_AlarmContent: TEdit;
    Label3: TLabel;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    cmb_Code: TComboBox;
    Label5: TLabel;
    mem_Msg: TMemo;
    btn_Save: TBitBtn;
    btn_Close: TBitBtn;
    ADOQuery: TADOQuery;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
  private
    { Private declarations }
    procedure LoadAlarmCode;
    Function   UpdateTB_ALARMShow(aNodeNo,aEcuID,
                    aAlarmdevicetypecode,aSubaddr,aZonecode,
                    aZoneno,aAlarmstatuscode,aAlarmCode,aAlarmMsg:string):Boolean;
    Function   UpdateTB_ALARMEvent(aNodeNo,aEcuID,
                    aAlarmdevicetypecode,aSubaddr,aZonecode,
                    aZoneno,aAlarmstatuscode,aAlarmCode,aAlarmMsg:string):Boolean;

  public
    L_stNodeNo : string;
    L_stEcuID : string;
    L_stAlarmdevicetypecode : string;
    L_stSubaddr :string;
    L_stZonecode :string;
    L_stZoneno : string;
    L_stAlarmstatuscode :string;
    { Public declarations }
  end;

var
  fmAlarmSet: TfmAlarmSet;

implementation
uses
  uDataModule1;
{$R *.dfm}

procedure TfmAlarmSet.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmAlarmSet.FormActivate(Sender: TObject);
begin
  LoadAlarmCode;
end;

procedure TfmAlarmSet.LoadAlarmCode;
var
  stSql : string;
begin
  cmb_Code.Clear;
  stSql := 'select * from TB_ALARMCHECKCODE ';
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
    While Not Eof do
    begin
      cmb_Code.Items.Add(FindField('al_alarmcheckcode').AsString + '.' + FindField('al_alarmcheckcodename').AsString );
      Next;
    end;
    if cmb_Code.Items.Count > 0  then
    begin
      cmb_Code.ItemIndex := 0;
    end;
  end;
end;

procedure TfmAlarmSet.btn_SaveClick(Sender: TObject);
var
  stAlarmCode : string;
  stAlarmMsg : string;
  nPos : integer;
begin
  nPos := Pos('.',cmb_Code.Text);
  stAlarmCode := '000';
  if nPos > 1 then stAlarmCode := copy(cmb_Code.Text,1,nPos - 1);
  stAlarmMsg := mem_Msg.Text;
  UpdateTB_ALARMShow(
                    L_stNodeNo,
                    L_stEcuID,
                    L_stAlarmdevicetypecode,
                    L_stSubaddr,
                    L_stZonecode,
                    L_stZoneno,
                    L_stAlarmstatuscode,
                    stAlarmCode,
                    stAlarmMsg);
  UpdateTB_ALARMEvent(
                    L_stNodeNo,
                    L_stEcuID,
                    L_stAlarmdevicetypecode,
                    L_stSubaddr,
                    L_stZonecode,
                    L_stZoneno,
                    L_stAlarmstatuscode,
                    stAlarmCode,
                    stAlarmMsg);

  Close;

end;

function TfmAlarmSet.UpdateTB_ALARMEvent(aNodeNo, aEcuID,
  aAlarmdevicetypecode, aSubaddr, aZonecode, aZoneno, aAlarmstatuscode,
  aAlarmCode, aAlarmMsg: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_ALARMEVENT set ';
  stSql := stSql + ' al_checkok = ''Y'',';
  stSql := stSql + ' al_checkcode = ''' + aAlarmCode + ''',';
  stSql := stSql + ' al_checkmsg = ''' + aAlarmMsg + ''',';
  stSql := stSql + ' al_updatetime = ''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',';
  stSql := stSql + ' al_updateoperator = ''' + Master_ID + ''' ';
  stSql := stSql + ' Where group_code = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' And (al_checkok <> ''Y'' or al_checkok is null) ';
  stSql := stSql + ' AND ac_NodeNo = ' + aNodeNo ;
  stSql := stSql + ' AND ac_ecuid = ''' + aEcuID + ''' ';
  stSql := stSql + ' And al_alarmdevicetypecode = ''' + aAlarmdevicetypecode + ''' ';
  stSql := stSql + ' And al_subaddr = ''' +  aSubaddr + ''' ';
  stSql := stSql + ' AND al_zonecode = ''' + aZonecode + ''' ';
  stSql := stSql + ' AND al_zoneno = ''' + aZoneno + ''' ';
  stSql := stSql + ' AND al_alarmstatuscode = ''' + aAlarmstatuscode + ''' ';

  result := DataModule1.ProcessEventExecSQL(stSql);
end;

function TfmAlarmSet.UpdateTB_ALARMShow(aNodeNo, aEcuID,
  aAlarmdevicetypecode, aSubaddr, aZonecode, aZoneno, aAlarmstatuscode,
  aAlarmCode, aAlarmMsg: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_ALARMSHOW set ';
  stSql := stSql + ' al_checkok = ''Y'',';
  stSql := stSql + ' al_checkcode = ''' + aAlarmCode + ''',';
  stSql := stSql + ' al_checkmsg = ''' + aAlarmMsg + ''',';
  stSql := stSql + ' al_updatetime = ''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',';
  stSql := stSql + ' al_updateoperator = ''' + Master_ID + ''' ';
  stSql := stSql + ' Where group_code = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' And (al_checkok <> ''Y'' or al_checkok is null)';
  stSql := stSql + ' AND ac_NodeNo = ' + aNodeNo ;
  stSql := stSql + ' AND ac_ecuid = ''' + aEcuID + ''' ';
  stSql := stSql + ' And al_alarmdevicetypecode = ''' + aAlarmdevicetypecode + ''' ';
  stSql := stSql + ' And al_subaddr = ''' +  aSubaddr + ''' ';
  stSql := stSql + ' AND al_zonecode = ''' + aZonecode + ''' ';
  stSql := stSql + ' AND al_zoneno = ''' + aZoneno + ''' ';
  stSql := stSql + ' AND al_alarmstatuscode = ''' + aAlarmstatuscode + ''' ';
//  mem_Msg.Text := stSql;
  result := DataModule1.ProcessExecSQL(stSql);
end;

end.
