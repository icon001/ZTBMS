unit uDeviceTimeCode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DB, ADODB;

type
  TfmDeviceTimeCode = class(TForm)
    Panel12: TPanel;
    gb_1: TGroupBox;
    Label1: TLabel;
    ed_Time11Start: TEdit;
    ed_Time11End: TEdit;
    Label2: TLabel;
    ed_Time12Start: TEdit;
    Label3: TLabel;
    ed_Time12End: TEdit;
    Label4: TLabel;
    ed_Time13Start: TEdit;
    Label5: TLabel;
    ed_Time13End: TEdit;
    Label6: TLabel;
    ed_Time14Start: TEdit;
    Label7: TLabel;
    ed_Time14End: TEdit;
    Label8: TLabel;
    GroupBox1: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    ed_Time21Start: TEdit;
    ed_Time21End: TEdit;
    ed_Time22Start: TEdit;
    ed_Time22End: TEdit;
    ed_Time23Start: TEdit;
    ed_Time23End: TEdit;
    ed_Time24Start: TEdit;
    ed_Time24End: TEdit;
    btn_Save: TSpeedButton;
    btn_Close: TSpeedButton;
    ADOQuery: TADOQuery;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
  private
    FNodeNo: String;
    FECUID: String;
    { Private declarations }
    function CheckTB_TIMECODEDEVICE_Group(aGroupCode:string):Boolean;
  public
    { Public declarations }
    Property NodeNo : String read FNodeNo write FNodeNo;
    Property ECUID : String read FECUID write FECUID;
  end;

var
  fmDeviceTimeCode: TfmDeviceTimeCode;

implementation
uses
  uDataModule1,
  uLomosUtil,
  uCommonSql;

{$R *.dfm}

procedure TfmDeviceTimeCode.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmDeviceTimeCode.FormShow(Sender: TObject);
var
  stSql : string;
begin
  stSql := 'Select * from TB_TIMECODEDEVICE ';
  stSql := stSql + ' Where AC_NODENO = ' + NODENO ;
  stSql := stSql + ' AND AC_ECUID = ''' + ECUID + ''' ';
  with ADOQuery do
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
      if FindField('TC_GROUP').AsString = '0' then
      begin
        ed_Time11Start.Text := copy(FindField('TC_TIME1').AsString,1,4);
        ed_Time11End.Text := copy(FindField('TC_TIME1').AsString,5,4);
        ed_Time12Start.Text := copy(FindField('TC_TIME2').AsString,1,4);
        ed_Time12End.Text := copy(FindField('TC_TIME2').AsString,5,4);
        ed_Time13Start.Text := copy(FindField('TC_TIME3').AsString,1,4);
        ed_Time13End.Text := copy(FindField('TC_TIME3').AsString,5,4);
        ed_Time14Start.Text := copy(FindField('TC_TIME4').AsString,1,4);
        ed_Time14End.Text := copy(FindField('TC_TIME4').AsString,5,4);
      end else if FindField('TC_GROUP').AsString = '1' then
      begin
        ed_Time21Start.Text := copy(FindField('TC_TIME1').AsString,1,4);
        ed_Time21End.Text := copy(FindField('TC_TIME1').AsString,5,4);
        ed_Time22Start.Text := copy(FindField('TC_TIME2').AsString,1,4);
        ed_Time22End.Text := copy(FindField('TC_TIME2').AsString,5,4);
        ed_Time23Start.Text := copy(FindField('TC_TIME3').AsString,1,4);
        ed_Time23End.Text := copy(FindField('TC_TIME3').AsString,5,4);
        ed_Time24Start.Text := copy(FindField('TC_TIME4').AsString,1,4);
        ed_Time24End.Text := copy(FindField('TC_TIME4').AsString,5,4);
      end;
      Next;
    end;
  end;

end;

procedure TfmDeviceTimeCode.btn_SaveClick(Sender: TObject);
var
  stSql : string;
begin

  if CheckTB_TIMECODEDEVICE_Group('0') then
  begin
    stSql := CommonSql.UpdateTB_TIMECODEDEVICE_Value(
                                               NODENO,
                                               ECUID,
                                               '0',
                                               FillZeroStrNum(ed_Time11Start.Text,4) + FillZeroStrNum(ed_Time11End.Text,4),
                                               FillZeroStrNum(ed_Time12Start.Text,4) + FillZeroStrNum(ed_Time12End.Text,4),
                                               FillZeroStrNum(ed_Time13Start.Text,4) + FillZeroStrNum(ed_Time13End.Text,4),
                                               FillZeroStrNum(ed_Time14Start.Text,4) + FillZeroStrNum(ed_Time14End.Text,4),
                                               'N',
                                               'Y');
    DataModule1.ProcessExecSQL(stSql);
  end else
  begin
    stSql := CommonSql.InsertIntoTB_TIMECODEDEVICE_Value(
                                               NODENO,
                                               ECUID,
                                               '0',
                                               FillZeroStrNum(ed_Time11Start.Text,4) + FillZeroStrNum(ed_Time11End.Text,4),
                                               FillZeroStrNum(ed_Time12Start.Text,4) + FillZeroStrNum(ed_Time12End.Text,4),
                                               FillZeroStrNum(ed_Time13Start.Text,4) + FillZeroStrNum(ed_Time13End.Text,4),
                                               FillZeroStrNum(ed_Time14Start.Text,4) + FillZeroStrNum(ed_Time14End.Text,4),
                                               'N',
                                               'Y');
    DataModule1.ProcessExecSQL(stSql);
  end;
  if CheckTB_TIMECODEDEVICE_Group('1') then
  begin
    stSql := CommonSql.UpdateTB_TIMECODEDEVICE_Value(NODENO,
                                               ECUID,
                                               '1',
                                               FillZeroStrNum(ed_Time21Start.Text,4) + FillZeroStrNum(ed_Time21End.Text,4),
                                               FillZeroStrNum(ed_Time22Start.Text,4) + FillZeroStrNum(ed_Time22End.Text,4),
                                               FillZeroStrNum(ed_Time23Start.Text,4) + FillZeroStrNum(ed_Time23End.Text,4),
                                               FillZeroStrNum(ed_Time24Start.Text,4) + FillZeroStrNum(ed_Time24End.Text,4),
                                               'N',
                                               'Y');
    DataModule1.ProcessExecSQL(stSql);
  end else
  begin
    stSql := CommonSql.InsertIntoTB_TIMECODEDEVICE_Value(
                                               NODENO,
                                               ECUID,
                                               '1',
                                               FillZeroStrNum(ed_Time21Start.Text,4) + FillZeroStrNum(ed_Time21End.Text,4),
                                               FillZeroStrNum(ed_Time22Start.Text,4) + FillZeroStrNum(ed_Time22End.Text,4),
                                               FillZeroStrNum(ed_Time23Start.Text,4) + FillZeroStrNum(ed_Time23End.Text,4),
                                               FillZeroStrNum(ed_Time24Start.Text,4) + FillZeroStrNum(ed_Time24End.Text,4),
                                               'N',
                                               'Y');
    DataModule1.ProcessExecSQL(stSql);
  end; 
  Close;
end;

function TfmDeviceTimeCode.CheckTB_TIMECODEDEVICE_Group(aGroupCode: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Select * from TB_TIMECODEDEVICE ';
  stSql := stSql + ' Where TC_GROUP = ''' + aGroupCode + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + NODENO ;
  stSql := stSql + ' AND AC_ECUID = ''' + ECUID + ''' ';
  with ADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    result := True;
  end;

end;



end.
