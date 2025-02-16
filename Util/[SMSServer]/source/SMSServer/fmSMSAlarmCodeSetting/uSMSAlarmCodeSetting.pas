unit uSMSAlarmCodeSetting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Buttons, Grids, BaseGrid, AdvGrid,
  uSubForm, CommandArray,ADODB,ActiveX, AdvObj;

type
  TfmSMSAlarmCodeSetting = class(TfmASubForm)
    pan_header: TPanel;
    StatusBar1: TStatusBar;
    sg_AlarmStateCode: TAdvStringGrid;
    procedure FormActivate(Sender: TObject);
    procedure sg_AlarmStateCodeCheckBoxClick(Sender: TObject; ACol,
      ARow: Integer; State: Boolean);
  private
    { Private declarations }
    procedure ShowAlarmStateCode(aCode:string);
    Function UpdateTB_ALARMSTATUSCODESmsSendStatus(aAlarmCode,aSMSSendState:string):Boolean;
  public
    { Public declarations }
  end;

var
  fmSMSAlarmCodeSetting: TfmSMSAlarmCodeSetting;

implementation

uses uDataModule1;

{$R *.dfm}

{ TfmSMSAlarmCodeSetting }

procedure TfmSMSAlarmCodeSetting.ShowAlarmStateCode(aCode: string);
var
  stSql : string;
  nRow : integer;
  i : integer;
  TempAdoQuery : TADOQuery;
begin
  GridInitialize(sg_AlarmStateCode); //스트링그리드 초기화

  stSql := 'select * from TB_ALARMSTATUSCODE ';
  stSql := stSql + ' where AL_GUBUN = ''001'' ';
  stSql := stSql + ' Order by AL_ALARMSTATUSCODE ';

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
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;
    if RecordCount < 1 then
    begin
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    end;

    with sg_AlarmStateCode do
    begin
      RowCount := RecordCount + 1;
      nRow := 1;
      while Not Eof do
      begin
        cells[0,nRow] := FindField('AL_ALARMSTATUSCODE').AsString;
        cells[1,nRow] := FindField('AL_ALARMNAME').AsString;
        if FindField('AL_SMSSEND').AsString = 'Y' then AddCheckBox(2,nRow,True,False)
        else AddCheckBox(2,nRow,False,False);
        nRow := nRow + 1;
        Next;
      end;
    end;

  end;
  TempAdoQuery.Free;
  CoUninitialize;

end;

procedure TfmSMSAlarmCodeSetting.FormActivate(Sender: TObject);
begin
  inherited;
  ShowAlarmStateCode('');
end;

procedure TfmSMSAlarmCodeSetting.sg_AlarmStateCodeCheckBoxClick(
  Sender: TObject; ACol, ARow: Integer; State: Boolean);
var
  stAlarmCode : string;
  stSMSSendState : string;
begin
  inherited;
  with sg_AlarmStateCode do
  begin
    if ACol = 2 then
    begin
      stAlarmCode := Cells[0,ARow];
      if State then stSMSSendState := 'Y'
      else stSMSSendState := 'N';
      UpdateTB_ALARMSTATUSCODESmsSendStatus(stAlarmCode,stSMSSendState);
    end;
  end;
end;

function TfmSMSAlarmCodeSetting.UpdateTB_ALARMSTATUSCODESmsSendStatus(
  aAlarmCode, aSMSSendState: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_ALARMSTATUSCODE set AL_SMSSEND = ''' + aSMSSendState + ''' ';
  stSql := stSql + ' Where AL_ALARMSTATUSCODE = ''' + aAlarmCode + ''' ';

  result := Datamodule1.ProcessExecSQL(stSql);
end;

end.
