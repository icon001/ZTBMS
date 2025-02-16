unit uFingerReaderSetting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvSmoothPanel, StdCtrls, AdvEdit, AdvSmoothLabel, Buttons,
  Grids, AdvObj, BaseGrid, AdvGrid, uSubForm, CommandArray,ADODB,ActiveX;

type
  TfmFingerReaderSetting = class(TfmASubForm)
    AdvSmoothPanel1: TAdvSmoothPanel;
    lb_FingerReaderIP: TAdvSmoothLabel;
    lb_FingerReaderName: TAdvSmoothLabel;
    ed_ReaderIP: TAdvEdit;
    ed_SearchName: TAdvEdit;
    btn_Image: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    sg_List: TAdvStringGrid;
    SpeedButton5: TSpeedButton;
    procedure btn_ImageClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
  private
    L_nCheckCount : integer;
    L_nPageListMaxCount : integer;
    { Private declarations }
    procedure SearchList(aCode:string;aTopRow:integer = 0);
  public
    { Public declarations }
  end;

var
  fmFingerReaderSetting: TfmFingerReaderSetting;

implementation
uses
  uDataModule1,
  uLomosUtil;

{$R *.dfm}

procedure TfmFingerReaderSetting.btn_ImageClick(Sender: TObject);
begin
  SearchList('');
end;

procedure TfmFingerReaderSetting.SearchList(aCode: string;
  aTopRow: integer);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
begin
  GridInit(sg_List,7,2,true);

  stSql := 'select * from TB_FINGERDEVICE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  if ed_ReaderIP.Text <> '' then stSql := stSql + ' and FN_DEVICEIP Like ''' + ed_ReaderIP.Text + '%'' ';
  if ed_SearchName.Text <> '' then stSql := stSql + ' and FN_DEVICENAME Like ''' + ed_SearchName.Text + '%'' ';

  L_nCheckCount := 0;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if recordcount < 1 then Exit;
      with sg_List do
      begin
        nRow := 1;
        RowCount := RecordCount + 1;
        while Not Eof do
        begin
          AddCheckBox(0,nRow,False,False);
          cells[1,nRow] := FindField('FN_DEVICEIP').AsString;
          cells[2,nRow] := FindField('FN_DEVICENAME').AsString;
          cells[3,nRow] := FindField('FN_DEVICESEQ').AsString;
          cells[4,nRow] := FillZeroNumber(FindField('AC_NODENO').AsInteger,G_nNodeCodeLength) + FindField('AC_ECUID').AsString ;
          cells[5,nRow] := FindField('FN_DEVICEPORT').AsString;
          cells[6,nRow] := FindField('FN_FINGERDEVICEID').AsString;
          cells[7,nRow] := FindField('FN_DEVICETYPE').AsString;
          if cells[3,nRow] = aCode then
          begin
            SelectRows(nRow,1);
          end;

          nRow := nRow + 1;
          Next;
        end;
        if aTopRow = 0 then
        begin
          if Row > (L_nPageListMaxCount - 1) then TopRow := Row - L_nPageListMaxCount;
        end else
        begin
          TopRow := aTopRow;
        end;
      end;

    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmFingerReaderSetting.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  Close;
end;

end.
