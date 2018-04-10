unit uAtFileSave;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, Gauges, ComCtrls, StdCtrls,ADODB,ActiveX;

type
  TfmAtFileSave = class(TForm)
    StaticText1: TStaticText;
    dt_Fromdate: TDateTimePicker;
    Gauge1: TGauge;
    btn_AtFileSave: TSpeedButton;
    btn_Close: TSpeedButton;
    SaveDialog1: TSaveDialog;
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_AtFileSaveClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmAtFileSave: TfmAtFileSave;

implementation

uses
  uLomosUtil, uDataModule1;

{$R *.dfm}

procedure TfmAtFileSave.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmAtFileSave.btn_AtFileSaveClick(Sender: TObject);
var
  ATList : TStringList;
  stSql : string;
  stSaveFileName : string;
  TempAdoQuery : TADOQuery;
  stATData : string;
begin
  stSaveFileName := '';
  SaveDialog1.FileName := FormatDateTime('yyyymmdd',dt_Fromdate.DateTime)+'.txt';
  if SaveDialog1.Execute then
  begin
    stSaveFileName := SaveDialog1.FileName;
  end else Exit;

  if stSaveFileName = '' then Exit;
  Try
    ATList := TStringList.Create;
    ATList.Clear;

    stSql := 'Select a.*,c.CO_COMPANYCODE,c.EM_CODE as emcode1 from TB_ACCESSEVENT a ';
    stSql := stSql + ' Inner Join TB_ACCESSDEVICE b ';
    stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
    stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ';
    stSql := stSql + ' AND b.AC_ATTYPE = ''1'') ';
    stSql := stSql + ' Inner Join TB_CARD c ';
    stSql := stSql + ' ON( a.CA_CARDNO = c.CA_CARDNO)';
    stSql := stSql + ' Where a.AC_DATE = ''' + FormatDateTime('yyyymmdd',dt_Fromdate.DateTime) + ''' ';
    stSql := stSql + ' Order by AC_TIME ';
    Try
      CoInitialize(nil);
      TempAdoQuery := TADOQuery.Create(nil);
      TempAdoQuery.Connection := DataModule1.ADOConnection;
      TempAdoQuery.DisableControls;
      with TempAdoQuery do
      begin
        Close;
        //Sql.Clear;
        Sql.Text := stSql;
        Try
          Open;
        Except
          showmessage('데이터 조회 오류.');
          Exit;
        End;
        if recordCount < 1 then
        begin
          showmessage('해당 일자의 근태 테이터가 없습니다.');
          Exit;
        end;
        Gauge1.Visible := True;
        Gauge1.Progress := 0;
        Gauge1.MaxValue := recordCount + 1;
        First;
        while Not Eof do
        begin
          stATData := '';
          if isDigit(FindField('AC_READERNO').Asstring) then
          begin
            stATData := stATData + FillZeroNumber(strtoint(FindField('AC_READERNO').Asstring),2);
          end else stATData := stATData + '00';
          stATData := stATData + ' ';
          stATData := stATData + FindField('emcode1').asstring;
          stATData := stATData + '00';
          stATData := stATData + FindField('AC_DATE').asstring;
          stATData := stATData + FindField('AC_TIME').asstring;

          if FindField('AC_READERNO').Asstring = '1' then stATData := stATData + '0'
          else if FindField('AC_READERNO').Asstring = '2' then stATData := stATData + '1'
          else stATData := stATData + ' ';

          ATList.Add(stATData);
          Gauge1.Progress := Gauge1.Progress + 1;
          Next;
        end;
        ATList.SaveToFile(stSaveFileName);
        showmessage('파일생성 완료.');
      end;
    Finally
      TempAdoQuery.EnableControls;
      TempAdoQuery.Free;
      CoUninitialize;
    End;
  Finally
    Gauge1.Visible := False;
    ATList.Free;
  End;

end;

procedure TfmAtFileSave.FormActivate(Sender: TObject);
begin
  dt_Fromdate.DateTime := Now - 1;
end;

end.
