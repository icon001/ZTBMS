unit uPositionSet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, DB, ADODB, uSubForm, CommandArray;

type
  TfmPositionSet = class(TfmASubForm)
    GroupBox1: TGroupBox;
    MapImage: TImage;
    DeviceImage: TImage;
    DeviceNameStaticText: TStaticText;
    btn_Set: TSpeedButton;
    btn_Close: TSpeedButton;
    ADOQuery1: TADOQuery;
    procedure DeviceImageMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure DeviceImageMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure DeviceImageMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormActivate(Sender: TObject);
    procedure btn_SetClick(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
  private
    DragOrigin: TPoint;
    MouseDowning : BOOLEAN;
    { Private declarations }
    procedure PositionMap(X_Position,Y_Position,X_Size,Y_Size:string);
  public
    DeviceType : string;
    X_Position : string;
    Y_Position : string;
    X_Size : string;
    Y_Size : string;
    BuildingCode : string;
    FloorCode : string;
    SectorCode :string;
    DeviceName : string;
    FormName : string;
    { Public declarations }

    L_nImageLeft : integer;
    L_nImageTop : integer;
    L_nImageWidth : integer;
    L_nImageHeight : integer;
    L_bSave : boolean;
  end;

var
  fmPositionSet: TfmPositionSet;

implementation

uses
  uLomosUtil,
  uDataModule1,
  uFoodAdmin;
{$R *.dfm}

procedure TfmPositionSet.DeviceImageMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    // MOUSE DOWN = TRUE CHECK
    if (MouseDowning = True) then
    begin
      if ((Sender as TImage).Top + (Sender as TImage).Height) >= (MapImage.Height) then
      begin
        (Sender as TImage).Top := (MapImage.Height) - (Sender as TImage).Height - 1;
      end
      else if ((Sender as TImage).Left + (Sender as TImage).Width) >= (MapImage.Width ) then
      begin
        (Sender as TImage).Left := (MapImage.Width) - (Sender as TImage).Width - 1;
      end
      else
      begin
        // IMAGE TOP 위치 설정
        (Sender as TImage).Top := (Sender as TImage).Top + Y - DragOrigin.Y;
        // IMAGE LEFT 위치 설정
        (Sender as TImage).Left := (Sender as TImage).Left + X - DragOrigin.X;
      end;
      DeviceNameStaticText.Top := (Sender as TImage).Top + (Sender as TImage).Height + 2;
      DeviceNameStaticText.Left := (Sender as TImage).Left;
    end;

end;

procedure TfmPositionSet.DeviceImageMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
    if (Button = mbLeft) and (MouseDowning = False) then
    begin
        // DRAG POINT 저장
        DragOrigin := Point (X,Y);
        // MOUSE DOWN = TRUE 설정
        MouseDowning := True;
    end;
end;

procedure TfmPositionSet.FormCreate(Sender: TObject);
begin
    MouseDowning := False;
    FormName := '';
end;

procedure TfmPositionSet.DeviceImageMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
    // MOUSE DOWN = FALSE 설정
    MouseDowning := False;

end;

procedure TfmPositionSet.FormActivate(Sender: TObject);
var
  stImage : string;
  stSql : string;
  stMapImage : string;
begin
  if Trim(BuildingCode) = '' then BuildingCode := '000';
  if Trim(FloorCode) = '' then FloorCode := '000';
  if Trim(SectorCode) = '' then SectorCode := '000';

  stSql := 'Select * from TB_LOCATION ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND LO_DONGCODE = ''' + BuildingCode + ''' ';
  stSql := stSql + ' AND LO_FLOORCODE = ''' + FloorCode + ''' ';
  stsql := stSql + ' AND LO_AREACODE = ''' + SectorCode +  ''' ';
  with AdoQuery1 do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      Open;
    Except
      showmessage('Table Open 실패');
      Exit;
    End;

    if RecordCount < 1 then
    begin
      showmessage('현재위치에 대한 Map이 존재하지 않습니다.');
      Exit;
    End;
    if DBType = 'MSSQL' then
    begin
      JPEGLoadFromDB(FieldByName('LO_CADIMAGE'), MapImage);
    end else
    begin
      stImage := FindField('LO_CADIMAGE').AsString;
      if FileExists(stImage) then
        MapImage.Picture.LoadFromFile(stImage);
    end;

  end;
  stImage := ExeFolder + '\..\Resource\';
  if DeviceType = '1' then stImage := stImage + MCUBMP;
  if DeviceType = '2' then stImage := stImage + ECUBMP;
  if DeviceType = '3' then stImage := stImage + DOORBMP;
  if DeviceType = '4' then stImage := stImage + ALARMBMP;
  if DeviceType = '5' then stImage := stImage + FOODBMP;
  if DeviceType = '6' then stImage := stImage + ALARMBMP;
  if DeviceType = '7' then stImage := stImage + ZONEBMP;
  if FileExists(stImage) then
  DeviceImage.Picture.LoadFromFile(stImage);
  DeviceImage.Visible := True;

  if Trim(X_Position) = '' then X_Position := '0';
  if Trim(Y_Position) = '' then Y_Position := '0';
  DeviceImage.Top := 0;
  DeviceImage.Left := 0;
  DeviceNameStaticText.Caption := DeviceName + '  ';
  DeviceNameStaticText.Top := DeviceImage.Top + DeviceImage.Height + 2;
  DeviceNameStaticText.Left := DeviceImage.Left;
  DeviceNameStaticText.Visible := True;
  if (X_Position = '0') AND (Y_Position = '0') then Exit;

  PositionMap(X_Position,Y_Position,X_Size,Y_Size);
  DeviceNameStaticText.Top := DeviceImage.Top + DeviceImage.Height + 2;
  DeviceNameStaticText.Left := DeviceImage.Left;

end;

procedure TfmPositionSet.PositionMap(X_Position, Y_Position, X_Size,
  Y_Size: string);
var
  nCurTotWidth,nCurTotHeight : integer;
  nCurX,nCurY :integer;
begin
  nCurTotWidth := MapImage.Width;
  nCurTotHeight := MapImage.Height;

  nCurX := (strtoint(X_Position) * nCurTotWidth ) Div  strtoint(X_Size) ;
  nCurY := (strtoint(Y_Position) * nCurTotHeight ) Div strtoint(Y_Size);

  DeviceImage.Top := nCurY;
  DeviceImage.Left := nCurX;

end;

procedure TfmPositionSet.btn_SetClick(Sender: TObject);
begin
  L_bSave := True;
  L_nImageLeft := DeviceImage.Left;
  L_nImageTop := DeviceImage.top;
  L_nImageWidth := MapImage.Width;
  L_nImageHeight := MapImage.Height;

  if FormName = 'fmMDIDoorAdmin' then
  begin
    Close;
    Exit;
  end else if FormName = 'fmAlarmDeviceAdmin' then
  begin
    Close;
    Exit;
  end else if FormName = 'fmAlarmZoneAdmin' then
  begin
    Close;
    Exit;
  end else if FormName = 'fmFoodAdmin' then
  begin
    fmFoodAdmin.ed_CurX.Text := inttostr(DeviceImage.Left);
    fmFoodAdmin.ed_CurY.Text := inttostr(DeviceImage.Top);
    fmFoodAdmin.ed_TotWidth.Text  := inttostr(MapImage.Width);
    fmFoodAdmin.ed_TotHeight.Text := inttostr(MapImage.Height);
    fmFoodAdmin.chk_FoodReg.Checked := True;
    Close;
    Exit;
  end;
  Close;
end;

procedure TfmPositionSet.btn_CloseClick(Sender: TObject);
begin
  L_bSave := False;
  if isDigit(X_Position) then
    L_nImageLeft := strtoint(X_Position)
  else L_nImageLeft := 0;
  if isDigit(Y_Position) then
    L_nImageTop := strtoint(Y_Position)
  else L_nImageTop := 0;
  if isDigit(X_Size) then
    L_nImageWidth := strtoint(X_Size)
  else L_nImageWidth := 0;
  if isDigit(Y_Size) then
    L_nImageHeight := strtoint(Y_Size)
  else L_nImageHeight := 0;
  Close;
end;

end.
