unit uMapAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, ExtDlgs, jpeg,ADODB,ActiveX;

type
  TfmMapAdd = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    ed_Image: TEdit;
    SpeedButton1: TSpeedButton;
    Image1: TImage;
    OpenPictureDialog: TOpenPictureDialog;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    cmb_Type: TComboBox;
    cmb_country: TComboBox;
    lb_Country: TLabel;
    cmb_Building: TComboBox;
    lb_Building: TLabel;
    cmb_Floor: TComboBox;
    lb_Floor: TLabel;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    ed_Code: TEdit;
    Label7: TLabel;
    ed_Name: TEdit;
    btn_Apply: TSpeedButton;
    btn_Cancel: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure cmb_TypeChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure ed_CodeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed_NameKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_ApplyClick(Sender: TObject);
  private
    CountryCodeList : TStringList;
    BuildingCodeList : TStringList;
    FloorCodeList : TStringList;
    FCurrentMapID: string;
    FImageName: string;
    FCurrentMapName: string;
    { Private declarations }
    procedure LoadCountry;
    procedure LoadBuilding(aCountryID:string);
    procedure LoadFloor(aCountryID,aBuildingID:string);
  public
    L_stSelectMapID : string;
    { Public declarations }
    property CurrentMapID : string read FCurrentMapID write FCurrentMapID;
    property CurrentMapName : string read FCurrentMapName write FCurrentMapName;
    property ImageName : string read FImageName write FImageName;
  end;

var
  fmMapAdd: TfmMapAdd;

implementation
uses
  uDataModule1, uMDBSql, uPostGreSql, uMssql, uFireBird;

{$R *.dfm}

procedure TfmMapAdd.SpeedButton1Click(Sender: TObject);
begin
  OpenPictureDialog.Filter := 'Jpg files (*.Jpg)|*.Jpg';
  if OpenPictureDialog.Execute then
  begin
    ed_Image.Text := OpenPictureDialog.FileName;
    Image1.Picture.LoadFromFile(ed_Image.Text);
    if (Length(ed_Code.Text) = 3) and
       (ed_Name.Text <> '') then btn_Apply.Enabled := True;
  end;
end;

procedure TfmMapAdd.btn_CancelClick(Sender: TObject);
begin
  ImageName := '';
  CurrentMapID := '';
  Close;
end;

procedure TfmMapAdd.cmb_TypeChange(Sender: TObject);
begin
  case cmb_Type.ItemIndex of
    0 :
      begin
        lb_Country.Visible := False;
        cmb_country.Visible := False;
        lb_Building.Visible := False;
        cmb_Building.Visible := False;
        lb_Floor.Visible := False;
        cmb_Floor.Visible := False;
      end;
    1 :
      begin
        lb_Country.Visible := True;
        cmb_country.Visible := True;
        lb_Building.Visible := False;
        cmb_Building.Visible := False;
        lb_Floor.Visible := False;
        cmb_Floor.Visible := False;
      end;
    2 :
      begin
        lb_Country.Visible := True;
        cmb_country.Visible := True;
        lb_Building.Visible := True;
        cmb_Building.Visible := True;
        lb_Floor.Visible := False;
        cmb_Floor.Visible := False;
      end;
    3 :
      begin
        lb_Country.Visible := True;
        cmb_country.Visible := True;
        lb_Building.Visible := True;
        cmb_Building.Visible := True;
        lb_Floor.Visible := True;
        cmb_Floor.Visible := True;
      end;
    4 :
      begin
      end;
    end;
end;

procedure TfmMapAdd.FormActivate(Sender: TObject);
begin
  if L_stSelectMapID = '' then Exit;
  case L_stSelectMapID[1] of
    'M' :
      begin
        cmb_Type.ItemIndex := 0;
        //showmessage(L_stSelectMapID);
      end;
    '0' :
      begin
        cmb_Type.ItemIndex := 1;
      end;
    '1' :
      begin
        cmb_Type.ItemIndex := 2;
      end;
    '2' :
      begin
        cmb_Type.ItemIndex := 3;
      end;
    '3' :
      begin
        cmb_Type.ItemIndex := 4;
      end;
    '4' :
      begin
        cmb_Type.ItemIndex := 5;
      end;
    end;
    cmb_TypeChange(self);
end;

procedure TfmMapAdd.LoadBuilding(aCountryID: string);
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  cmb_Building.Items.Clear;
  BuildingCodeList.Clear;

  if DBTYPE = 'MDB' then stSql := MDBSql.SelectMapBuildingCountryID(aCountryID)
  else if DBTYPE = 'PG' then stSql := PostGreSql.SelectMapBuildingCountryID(aCountryID)
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.SelectMapBuildingCountryID(aCountryID)
  else if DBTYPE = 'FB' then stSql := FireBird.SelectMapBuildingCountryID(aCountryID)
  else Exit;
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if recordcount < 1 then Exit;
      While Not Eof do
      begin
        cmb_Building.Items.Add(FindField('ML_NAME').AsString);
        BuildingCodeList.Add(FindField('ML_COUNTRY').AsString);
      end;
      cmb_Building.ItemIndex := 0;
    end;

  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TfmMapAdd.LoadCountry;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  cmb_country.Items.Clear;
  CountryCodeList.Clear;

  if DBTYPE = 'MDB' then stSql := MDBSql.SelectMapCountryAll
  else if DBTYPE = 'PG' then stSql := PostGreSql.SelectMapCountryAll
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.SelectMapCountryAll
  else if DBTYPE = 'FB' then stSql := FireBird.SelectMapCountryAll
  else Exit;
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if recordcount < 1 then Exit;
      While Not Eof do
      begin
        cmb_country.Items.Add(FindField('ML_NAME').AsString);
        CountryCodeList.Add(FindField('ML_COUNTRY').AsString);
      end;
      cmb_country.ItemIndex := 0;
    end;

  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TfmMapAdd.LoadFloor(aCountryID, aBuildingID: string);
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  cmb_Floor.Items.Clear;
  FloorCodeList.Clear;

  if DBTYPE = 'MDB' then stSql := MDBSql.SelectMapFloorBuildingID(aCountryID,aBuildingID)
  else if DBTYPE = 'PG' then stSql := PostGreSql.SelectMapFloorBuildingID(aCountryID,aBuildingID)
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.SelectMapFloorBuildingID(aCountryID,aBuildingID)
  else if DBTYPE = 'FB' then stSql := FireBird.SelectMapFloorBuildingID(aCountryID,aBuildingID)
  else Exit;
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if recordcount < 1 then Exit;
      While Not Eof do
      begin
        cmb_Floor.Items.Add(FindField('ML_NAME').AsString);
        FloorCodeList.Add(FindField('ML_FLOOR').AsString);
      end;
      cmb_Building.ItemIndex := 0;
    end;

  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMapAdd.FormCreate(Sender: TObject);
begin
  CountryCodeList := TStringList.Create;
  BuildingCodeList := TStringList.Create;
  FloorCodeList := TStringList.Create;

end;

procedure TfmMapAdd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CountryCodeList.Free;
  BuildingCodeList.Free;
  FloorCodeList.Free;
end;

procedure TfmMapAdd.FormShow(Sender: TObject);
begin
  LoadCountry;
end;

procedure TfmMapAdd.ed_CodeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (Length(ed_Code.Text) = 3) then
    begin
       if ed_Name.Text <> '' then btn_Apply.Enabled := True
       else ed_Name.SetFocus;
    end;
end;

procedure TfmMapAdd.ed_NameKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (Length(ed_Code.Text) = 3) and
       (ed_Name.Text <> '') then btn_Apply.Enabled := True;

end;

procedure TfmMapAdd.btn_ApplyClick(Sender: TObject);
var
  stCountryID : string;
  stBuildingID : string;
  stFloorID : string;
  stAreaID : string;
begin
  ImageName := ed_Image.text;
  CurrentMapName := ed_Name.Text;
  if cmb_Type.ItemIndex = 0 then
  begin
    stCountryID := ed_Code.Text;
    stBuildingID := '000';
    stFloorID := '000';
    stAreaID := '000';
  end else if cmb_Type.ItemIndex = 1 then
  begin
    if cmb_country.ItemIndex < 0 then
    begin
      showmessage('지역 코드를 선택 하셔야 합니다.');
      Exit;
    end;
    stCountryID := CountryCodeList.Strings[cmb_country.ItemIndex];
    stBuildingID := ed_Code.Text;
    stFloorID := '000';
    stAreaID := '000';
  end else if cmb_Type.ItemIndex = 2 then
  begin
    if cmb_country.ItemIndex < 0 then
    begin
      showmessage('지역 코드를 선택 하셔야 합니다.');
      Exit;
    end;
    if cmb_Building.ItemIndex < 0 then
    begin
      showmessage('빌딩 코드를 선택 하셔야 합니다.');
      Exit;
    end;
    stCountryID := CountryCodeList.Strings[cmb_country.ItemIndex];
    stBuildingID := BuildingCodeList.Strings[cmb_Building.ItemIndex];
    stFloorID := ed_Code.Text;
    stAreaID := '000';
  end else if cmb_Type.ItemIndex = 3 then
  begin
    if cmb_country.ItemIndex < 0 then
    begin
      showmessage('지역 코드를 선택 하셔야 합니다.');
      Exit;
    end;
    if cmb_Building.ItemIndex < 0 then
    begin
      showmessage('빌딩 코드를 선택 하셔야 합니다.');
      Exit;
    end;
    if cmb_Floor.ItemIndex < 0 then
    begin
      showmessage('층 코드를 선택 하셔야 합니다.');
      Exit;
    end;
    stCountryID := CountryCodeList.Strings[cmb_country.ItemIndex];
    stBuildingID := BuildingCodeList.Strings[cmb_Building.ItemIndex];
    stFloorID := FloorCodeList.Strings[cmb_Floor.ItemIndex];
    stAreaID := ed_Code.Text;
  end;
  CurrentMapID := inttostr(cmb_Type.ItemIndex) +
                  stCountryID +
                  stBuildingID +
                  stFloorID +
                  stAreaID;
  Close;

end;

end.
