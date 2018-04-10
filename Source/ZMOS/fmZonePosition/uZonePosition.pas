unit uZonePosition;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DB, ADODB, uSubForm, CommandArray;

type
  TfmZonePosition = class(TfmASubForm)
    ImageMap: TImage;
    ADOQuery1: TADOQuery;
    DeviceNameStaticText: TStaticText;
    Image1: TImage;
    Timer1: TTimer;
    ADOTempQuery: TADOQuery;
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    bActive : Boolean;
    { Private declarations }
    procedure LoadZonePosition(aNodeNo,aEcuID,aPortNo:string);
    procedure LoadMap(aCURX,aCURY,aTOTWIDTH,aTOTHEIGHT:integer;aDeviceName:string);
    Function LoadLocationMap(aBuildingCode,aFloorCode,aAreaCode:string):Boolean;

  public
    nAL_ALARMNO : integer;
    stAC_NODENO : string;
    stAC_ECUID : string;
    stPortNo : string;
    stDeviceName : string;
    { Public declarations }
  end;

var
  fmZonePosition: TfmZonePosition;

implementation
uses
  uDataModule1;
{$R *.dfm}

function TfmZonePosition.LoadLocationMap(aBuildingCode, aFloorCode,
  aAreaCode: string): Boolean;
var
 stSql : string;
 stImage : string;
begin
  result := False;

  stSql := 'select * from TB_LOCATION ';
  stSql := stSql + ' Where LO_DONGCODE = ''' + aBuildingCode + ''' ';
  stSql := stSql + ' AND LO_FLOORCODE = ''' + aFloorCode + ''' ';
  stSql := stSql + ' AND LO_AREACODE = ''' + aAreaCode + ''' ';

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
    if recordCount < 1 then exit;
    if FindField('LO_IMAGEUSE').AsString <> 'Y' then Exit;
    if DBType = 'MSSQL' then
    begin
      JPEGLoadFromDB(FieldByName('LO_CADIMAGE'), ImageMap);
    end else
    begin
      stImage := FindField('LO_CADIMAGE').AsString;
      if FileExists(stImage) then
        ImageMap.Picture.LoadFromFile(stImage);
    end;
  end;

  result := True;
end;

procedure TfmZonePosition.Timer1Timer(Sender: TObject);
begin
  Image1.Visible := Not Image1.Visible;
  DeviceNameStaticText.Visible := Not DeviceNameStaticText.Visible;
end;

procedure TfmZonePosition.LoadMap(aCURX,aCURY,aTOTWIDTH,aTOTHEIGHT:integer;aDeviceName:string);
var
  stImage : string;
  nCurTotWidth,nCurTotHeight : integer;
  nCurX,nCurY:integer;
begin
  stImage := ExeFolder + '\..\Resource\';
  stImage := stImage + ZONEBMP;
  if FileExists(stImage) then
  Image1.Picture.LoadFromFile(stImage);
  Image1.Visible := True;
  Image1.Top := 0;
  Image1.Left := 0;

  nCurTotWidth := ImageMap.Width;
  nCurTotHeight := ImageMap.Height;

  if (aTOTWIDTH > 0) and (aTOTHEIGHT > 0) then
  begin
    nCurX := (aCURX * nCurTotWidth ) Div  aTOTWIDTH ;
    nCurY := (aCURY * nCurTotHeight ) Div aTOTHEIGHT;
  end;

  Image1.Top := nCurY;
  Image1.Left := nCurX;
  Image1.Hint := aDeviceName;
  DeviceNameStaticText.Top := Image1.Top + Image1.Height + 2;
  DeviceNameStaticText.Left := Image1.Left;
  DeviceNameStaticText.Caption := aDeviceName;
  DeviceNameStaticText.Visible := True;

end;

procedure TfmZonePosition.FormShow(Sender: TObject);
begin
  LoadZonePosition(stAC_NODENO,stAC_ECUID,stPortNo);
  {
  stSql := 'select * from TB_ZONEDEVICE ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(stAC_NODENO)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + stAC_ECUID + ''' ';
  stSql := stSql + ' AND AL_ZONENUM = ''' + inttostr(strtoint(stPortNo)) + ''' ';
  with ADOQuery1 do
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
    LoadLocationMap(FindField('LO_DONGCODE').AsString,FindField('LO_FLOORCODE').AsString,FindField('LO_AREACODE').AsString);
    LoadMap(FindField('AL_CURX').AsInteger,FindField('AL_CURY').AsInteger,FindField('AL_TOTWIDTH').AsInteger,FindField('AL_TOTHEIGHT').AsInteger,stDeviceName);
  end;    }

end;

procedure TfmZonePosition.LoadZonePosition(aNodeNo, aEcuID,
  aPortNo: string);
var
  stSql : string;
begin
  stSql := 'select * from TB_ZONEDEVICE ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND AL_ZONENUM = ''' + inttostr(strtoint(aPortNo)) + ''' ';
  with ADOQuery1 do
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
    LoadLocationMap(FindField('LO_DONGCODE').AsString,FindField('LO_FLOORCODE').AsString,FindField('LO_AREACODE').AsString);
    LoadMap(FindField('AL_CURX').AsInteger,FindField('AL_CURY').AsInteger,FindField('AL_TOTWIDTH').AsInteger,FindField('AL_TOTHEIGHT').AsInteger,stDeviceName);
  end;

end;

procedure TfmZonePosition.FormCreate(Sender: TObject);
begin
  bActive := False;

end;

procedure TfmZonePosition.FormActivate(Sender: TObject);
begin
  bActive := True;
end;

procedure TfmZonePosition.FormResize(Sender: TObject);
begin

  if bActive then
  begin
    LoadZonePosition(stAC_NODENO,stAC_ECUID,stPortNo);
  end;

end;

end.
