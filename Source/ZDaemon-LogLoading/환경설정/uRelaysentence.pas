unit uRelaysentence;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB;

type
  TfmRelaysentence = class(TForm)
    GroupBox1: TGroupBox;
    chk_serial: TCheckBox;
    chk_companycode: TCheckBox;
    chk_empno: TCheckBox;
    chk_empname: TCheckBox;
    chk_changestate: TCheckBox;
    chk_cardstate: TCheckBox;
    chk_cardNo: TCheckBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    ed_Delimiter: TEdit;
    sbSave: TSpeedButton;
    sbCancel: TSpeedButton;
    ADOQuery: TADOQuery;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    ed_relayserverIP: TEdit;
    ed_relayserverPort: TEdit;
    Label3: TLabel;
    procedure sbCancelClick(Sender: TObject);
    procedure sbSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    Function InsertTB_PERRELAYCONFIG(aCode,aValue,aDetail:string):Boolean;
    Function UpdateTB_PERRELAYCONFIG(aCode,aValue,aDetail:string):Boolean;

    procedure SearchConfig;
  public
    { Public declarations }
  end;

var
  fmRelaysentence: TfmRelaysentence;

implementation
uses
  uDataModule1,
  uLomosUtil;

{$R *.dfm}

function TfmRelaysentence.InsertTB_PERRELAYCONFIG(aCode, aValue,
  aDetail: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_PERRELAYCONFIG (';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'PC_CONFIGCODE,';
  stSql := stSql + 'PC_CONFIGVALUE,';
  stSql := stSql + 'PC_CONFIGDETAIL)';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aCode + ''',';
  stSql := stSql + '''' + aValue + ''',';
  stSql := stSql + '''' + aDetail + ''')';

  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmRelaysentence.sbCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmRelaysentence.SearchConfig;
var
  stSql : string;
begin
  stSql := 'select * from TB_PERRELAYCONFIG ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';

  with AdoQuery do
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
      if FindField('PC_CONFIGCODE').AsString = 'SCARDNO' then
      begin
        if strtoint(FindField('PC_CONFIGVALUE').AsString) = 1 then
          chk_cardNo.Checked := True
        else chk_cardNo.Checked := False;
      end;
      if FindField('PC_CONFIGCODE').AsString = 'SSERIAL' then
      begin
        if strtoint(FindField('PC_CONFIGVALUE').AsString) = 1 then
          chk_serial.Checked := True
        else chk_serial.Checked := False;
      end;
      if FindField('PC_CONFIGCODE').AsString = 'SCOMPANYCODE' then
      begin
        if strtoint(FindField('PC_CONFIGVALUE').AsString) = 1 then
          chk_companycode.Checked := True
        else chk_companycode.Checked := False;
      end;
      if FindField('PC_CONFIGCODE').AsString = 'SEMPNO' then
      begin
        if strtoint(FindField('PC_CONFIGVALUE').AsString) = 1 then
          chk_empno.Checked := True
        else chk_empno.Checked := False;
      end;
      if FindField('PC_CONFIGCODE').AsString = 'SEMPNAME' then
      begin
        if strtoint(FindField('PC_CONFIGVALUE').AsString) = 1 then
          chk_empname.Checked := True
        else chk_empname.Checked := False;
      end;
      if FindField('PC_CONFIGCODE').AsString = 'SCARDSTATE' then
      begin
        if strtoint(FindField('PC_CONFIGVALUE').AsString) = 1 then
          chk_cardstate.Checked := True
        else chk_cardstate.Checked := False;
      end;
      if FindField('PC_CONFIGCODE').AsString = 'SCHANGESTATE' then
      begin
        if strtoint(FindField('PC_CONFIGVALUE').AsString) = 1 then
          chk_changestate.Checked := True
        else chk_changestate.Checked := False;
      end;
      if FindField('PC_CONFIGCODE').AsString = 'SDELIMITER' then
        ed_Delimiter.Text := FindField('PC_CONFIGVALUE').AsString;
      if FindField('PC_CONFIGCODE').AsString = 'SRELAYIP' then
        ed_relayserverIP.Text := FindField('PC_CONFIGVALUE').AsString;
      if FindField('PC_CONFIGCODE').AsString = 'SRELAYPORT' then
        ed_relayserverPort.Text := FindField('PC_CONFIGVALUE').AsString;

      Next;
    end;
  end;
end;

function TfmRelaysentence.UpdateTB_PERRELAYCONFIG(aCode, aValue,
  aDetail: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_PERRELAYCONFIG Set ';
  stSql := stSql + 'PC_CONFIGVALUE = ''' + aValue + ''',';
  stSql := stSql + 'PC_CONFIGDETAIL = ''' + aDetail + ''' ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND PC_CONFIGCODE = ''' + aCode + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmRelaysentence.sbSaveClick(Sender: TObject);
var
  stCardUse : string;
  stSerialUse : string;
  stCompanyCodeUse : string;
  stEmpnoUse : string;
  stEmpNameUse : string;
  stCardStateUse : string;
  stChangStateUse : string;
begin
  if chk_cardNo.Checked then stCardUse := '1'
  else stCardUse := '0';
  if chk_serial.Checked then stSerialUse := '1'
  else stSerialUse := '0';
  if chk_companycode.Checked then stCompanyCodeUse := '1'
  else stCompanyCodeUse := '0';
  if chk_empno.Checked then stEmpnoUse := '1'
  else stEmpnoUse := '0';
  if chk_empname.Checked then stEmpNameUse := '1'
  else stEmpNameUse := '0';
  if chk_cardstate.Checked then stCardStateUse := '1'
  else stCardStateUse := '0';
  if chk_changestate.Checked then stChangStateUse := '1'
  else stChangStateUse := '0';

  if Not InsertTB_PERRELAYCONFIG('SCARDNO',
                                 stCardUse,
                                 '0:미사용,1:사용') then
          UpdateTB_PERRELAYCONFIG('SCARDNO',
                                 stCardUse,
                                 '0:미사용,1:사용');

  if Not InsertTB_PERRELAYCONFIG('SSERIAL',
                                 stSerialUse,
                                 '0:미사용,1:사용') then
          UpdateTB_PERRELAYCONFIG('SSERIAL',
                                 stSerialUse,
                                 '0:미사용,1:사용');

  if Not InsertTB_PERRELAYCONFIG('SCOMPANYCODE',
                                 stCompanyCodeUse,
                                 '0:미사용,1:사용') then
          UpdateTB_PERRELAYCONFIG('SCOMPANYCODE',
                                 stCompanyCodeUse,
                                 '0:미사용,1:사용');

  if Not InsertTB_PERRELAYCONFIG('SEMPNO',
                                 stEmpnoUse,
                                 '0:미사용,1:사용') then
          UpdateTB_PERRELAYCONFIG('SEMPNO',
                                 stEmpnoUse,
                                 '0:미사용,1:사용');

  if Not InsertTB_PERRELAYCONFIG('SEMPNAME',
                                 stEmpNameUse,
                                 '0:미사용,1:사용') then
          UpdateTB_PERRELAYCONFIG('SEMPNAME',
                                 stEmpNameUse,
                                 '0:미사용,1:사용');

  if Not InsertTB_PERRELAYCONFIG('SCARDSTATE',
                                 stCardStateUse,
                                 '0:미사용,1:사용') then
          UpdateTB_PERRELAYCONFIG('SCARDSTATE',
                                 stCardStateUse,
                                 '0:미사용,1:사용');

  if Not InsertTB_PERRELAYCONFIG('SCHANGESTATE',
                                 stChangStateUse,
                                 '0:미사용,1:사용') then
          UpdateTB_PERRELAYCONFIG('SCHANGESTATE',
                                 stChangStateUse,
                                 '0:미사용,1:사용');

  if Not InsertTB_PERRELAYCONFIG('SDELIMITER',
                                 ed_Delimiter.Text,
                                 '0:미사용,1:사용') then
          UpdateTB_PERRELAYCONFIG('SDELIMITER',
                                 ed_Delimiter.Text,
                                 '0:미사용,1:사용');

  if Not InsertTB_PERRELAYCONFIG('SRELAYIP',
                                 ed_relayserverIP.Text,
                                 '') then
          UpdateTB_PERRELAYCONFIG('SRELAYIP',
                                 ed_relayserverIP.Text,
                                 '');
                                 
  if Not InsertTB_PERRELAYCONFIG('SRELAYPORT',
                                 ed_relayserverPort.Text,
                                 '') then
          UpdateTB_PERRELAYCONFIG('SRELAYPORT',
                                 ed_relayserverPort.Text,
                                 '');

  Close;

end;

procedure TfmRelaysentence.FormShow(Sender: TObject);
begin
  SearchConfig;
end;

end.
