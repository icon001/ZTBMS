unit uSound;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Buttons, Grids, BaseGrid, AdvGrid, Mask, RzEdit,
  RzSpnEdt, StdCtrls, Spin, ExtCtrls, RzCmboBx, DB, ADODB,ActiveX,
  uSubForm, CommandArray;

type
  TfmSound = class(TfmASubForm)
    pan_header: TPanel;
    GroupBox4: TGroupBox;
    Splitter2: TSplitter;
    Panel6: TPanel;
    GroupBox10: TGroupBox;
    Label22: TLabel;
    ed_soundNo: TEdit;
    Panel5: TPanel;
    sg_code: TAdvStringGrid;
    Panel1: TPanel;
    btn_Update: TSpeedButton;
    btn_Save: TSpeedButton;
    btn_Close: TSpeedButton;
    btn_Cancel: TSpeedButton;
    StatusBar1: TStatusBar;
    ADOQuery: TADOQuery;
    ed_SoundName: TEdit;
    Label1: TLabel;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure sg_codeClick(Sender: TObject);
    procedure btn_UpdateClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
  private
    State : string;
    ALARMIDList : TStringList;
    sBuildingCodeList : TStringList;
    sFloorCodeList : TStringList;
    sAreaCodeList : TStringList;
    { Private declarations }
    procedure SoundCodeSearch(aSoundCode:string;aTop :integer = 0);
    procedure FormClear;
    procedure FormEnable(aState:string);
    procedure ButtonEnable(aState:string);
  public
    { Public declarations }
  end;

var
  fmSound: TfmSound;

implementation
uses
  uDataModule1,
  uLomosUtil,
  uPositionSet;

{$R *.dfm}

procedure TfmSound.btn_CloseClick(Sender: TObject);
begin
  Close;
end;


procedure TfmSound.FormCreate(Sender: TObject);
begin
  ALARMIDList := TStringList.Create;
  sBuildingCodeList := TStringList.Create;
  sFloorCodeList := TStringList.Create;
  sAreaCodeList := TStringList.Create;
end;

procedure TfmSound.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ALARMIDList.Free;
  sBuildingCodeList.Free;
  sFloorCodeList.Free;
  sAreaCodeList.Free;
end;

procedure TfmSound.FormShow(Sender: TObject);
begin
  
  SoundCodeSearch('');
end;

procedure TfmSound.SoundCodeSearch(aSoundCode: string;aTop :integer = 0);
var
  stSql : string;
  nRow : integer;
  TempAdoQuery : TADOQuery;
begin
  State := 'SEARCH';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  GridInitialize(sg_code); //스트링그리드 초기화

  stSql := 'select * from TB_SOUNDCODE ';
  stSql := stSql + ' order by SO_CODE';

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

      First;
      sg_code.RowCount := RecordCount + 1;
      nRow := 1;
      while Not Eof do
      begin
        with sg_code do
        begin
          cells[0,nRow] := FindField('SO_CODE').AsString;
          cells[1,nRow] := FindField('SO_NAME').AsString;

          if FindField('SO_CODE').AsString = aSoundCode then
          begin
            SelectRows(nRow,1);
          end;

          nRow := nRow + 1;
        end;
        Next;
      end;
      if aTop <> 0 then
        sg_code.topRow := aTop
      else
      begin
        if sg_code.row > 11 then sg_code.TopRow := sg_code.row - 10;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  sg_codeClick(sg_code);
end;

procedure TfmSound.ButtonEnable(aState: string);
begin
  if upperCase(aState) = 'INSERT'  then
  begin
    btn_update.Enabled := false;
    btn_Save.Enabled := True;
    btn_Cancel.Enabled := True;
  end else if upperCase(aState) = 'SEARCH' then
  begin
    btn_Update.Enabled := False;
    btn_Save.Enabled := False;
    btn_Cancel.Enabled := False;
  end else if upperCase(aState) = 'UPDATE' then
  begin
    btn_Update.Enabled := False;
    btn_Save.Enabled := True;
    btn_Cancel.Enabled := True;
  end else if upperCase(aState) = 'CLICK' then
  begin
    btn_Update.Enabled := True;
    btn_Save.Enabled := False;
    btn_Cancel.Enabled := False;
  end;
end;

procedure TfmSound.FormClear;
begin
  ed_soundno.Text := '';
  ed_soundName.Text := '';
end;

procedure TfmSound.FormEnable(aState: string);
begin
  if upperCase(aState) = 'INSERT'  then
  begin
    sg_code.Enabled := False;
    ed_soundno.Enabled := True;
    ed_soundName.Enabled := True;
  end else if UpperCase(aState) = 'UPDATE' then
  begin
    sg_code.Enabled := False;
    ed_soundno.Enabled := False;
    ed_soundName.Enabled := True;
  end else if UpperCase(aState) = 'SEARCH' then
  begin
    sg_code.Enabled := True;
    ed_soundno.Enabled := False;
    ed_soundName.Enabled := False;
  end;
end;

procedure TfmSound.sg_codeClick(Sender: TObject);
var
  stAlarmNo : string;
  stBuildingCode,stFloorCode : string;
begin
  with (Sender as TStringGrid) do
  begin
    if cells[0,Row] = '' then exit;

    State := 'CLICK';
    FormClear;
    FormEnable(State);
    ButtonEnable(State);
    ed_soundNo.Text := cells[0,row];
    ed_soundName.Text := cells[1,row];
  end;

end;

procedure TfmSound.btn_UpdateClick(Sender: TObject);
begin
  State := 'UPDATE';
  FormEnable(State);
  ed_SoundName.SetFocus;
  ButtonEnable(State);
end;

procedure TfmSound.btn_CancelClick(Sender: TObject);
var
  stAlarmNo : string;
begin
  SoundCodeSearch(ed_soundNo.Text,sg_code.TopRow);
end;

procedure TfmSound.btn_SaveClick(Sender: TObject);
var
  stSql : string;
  bResult : Boolean;
begin
  inherited;
  ed_SoundName.Text := StringReplace(UpperCase(ed_SoundName.Text),'.MP3','',[rfReplaceAll]);
  if Length(ed_SoundName.Text) > 8 then ed_SoundName.Text := copy(ed_SoundName.Text,1,6) + '~1';
  
  stSql := ' Update TB_SOUNDCODE set SO_NAME = ''' + ed_SoundName.Text + ''' ';
  stSql := stSql + ' Where SO_CODE = ''' + ed_soundNo.Text + ''' ';

  bResult := DataModule1.ProcessExecSQL(stSql);

  if bResult then
    SoundCodeSearch(ed_soundNo.Text,sg_code.TopRow)
  else
    showmessage('데이터 저장실패');

end;

end.
