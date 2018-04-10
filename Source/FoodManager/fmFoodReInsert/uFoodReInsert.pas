unit uFoodReInsert;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, Gauges, ComCtrls, StdCtrls,ADODB,ActiveX;

type
  TfmFoodReInsert = class(TForm)
    StaticText1: TStaticText;
    dt_Fromdate: TDateTimePicker;
    StaticText2: TStaticText;
    dt_todate: TDateTimePicker;
    Gauge1: TGauge;
    btn_FoodReInsert: TSpeedButton;
    btn_Close: TSpeedButton;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_FoodReInsertClick(Sender: TObject);
  private
    { Private declarations }
    L_stFoodDevicType : string;
    function GetFoodDeviceType:Boolean;
  public
    { Public declarations }
  end;

var
  fmFoodReInsert: TfmFoodReInsert;

implementation

uses
udmAdoQuery,
uFoodEventInsert, uDataModule1;
{$R *.dfm}

procedure TfmFoodReInsert.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmFoodReInsert.FormCreate(Sender: TObject);
begin
  dt_Fromdate.Date := now;
  dt_todate.Date := now;
  GetFoodDeviceType;
end;

procedure TfmFoodReInsert.btn_FoodReInsertClick(Sender: TObject);
var
  stSql : string;
  stFromDate,stToDate : string;
  TempAdoQuery : TAdoQuery;
begin
  stFromDate := formatDateTime('yyyymmdd',dt_Fromdate.Date);
  stToDate := formatDateTime('yyyymmdd',dt_todate.Date);
  dmAdoQuery.DeleteTB_FOODEVENT_D2D(stFromDate,stToDate);

  stSql := 'Select a.* from TB_ACCESSEVENT a ';
  stSql := stSql + ' Inner Join (select * from TB_ACCESSDEVICE where AC_FDTYPE = ''1'') b ';
  stSql := stSql + ' ON(a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ) ';
  stSql := stSql + ' where a.AC_DATE between ''' + stFromDate + ''' and ''' +  stToDate + ''' ';

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
        Exit;
      End;
      if recordcount < 1 then Exit;
      Gauge1.Progress := 0;
      Gauge1.MaxValue := recordcount;
      Gauge1.Visible := True;
      While Not Eof do
      begin
        if Uppercase(L_stFoodDevicType) = 'READER' then
        begin
          dmDBFoodEvent.ProcessFoodData(FindField('AC_DATE').AsString + FindField('AC_TIME').AsString,
                                        FindField('CA_CARDNO').AsString, FindField('AC_ECUID').AsString,FindField('AC_NODENO').AsInteger,
                                        FindField('AC_READERNO').AsString[1],FindField('PE_PERMITCODE').AsString[1],
                                        FindField('CO_JIJUMCODE').AsString,FindField('CO_DEPARTCODE').AsString,
                                        FindField('CO_COMPANYCODE').AsString,FindField('EM_CODE').AsString,FindField('EM_NAME').AsString)   //리더
        end else
        begin
          dmDBFoodEvent.ProcessFoodData(FindField('AC_DATE').AsString + FindField('AC_TIME').AsString,
                                        FindField('CA_CARDNO').AsString, FindField('AC_ECUID').AsString,FindField('AC_NODENO').AsInteger,
                                        FindField('DO_DOORNO').AsString[1],FindField('PE_PERMITCODE').AsString[1],
                                        FindField('CO_JIJUMCODE').AsString,FindField('CO_DEPARTCODE').AsString,
                                        FindField('CO_COMPANYCODE').AsString,FindField('EM_CODE').AsString,FindField('EM_NAME').AsString)   //리더
        end;
        Gauge1.Progress := Gauge1.Progress + 1;
        Application.ProcessMessages;
        Next;
      end;
      Gauge1.Visible := False;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmFoodReInsert.GetFoodDeviceType: Boolean;
var
  stSql : string;
  TempAdoQuery : TAdoQuery;
begin
  L_stFoodDevicType := 'DOOR';
  stSql := ' Select * from TB_CONFIG where CO_CONFIGGROUP = ''FOOD'' and CO_CONFIGCODE = ''FOODDEVICE'' ';

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
        Exit;
      End;
      if recordcount < 1 then Exit;
      L_stFoodDevicType := FindField('CO_CONFIGVALUE').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

end.
