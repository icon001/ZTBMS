unit uDeviceModelCode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BaseGrid, AdvGrid, ComCtrls, StdCtrls, Buttons, ExtCtrls,
  uSubForm, CommandArray,ADODB,ActiveX,ZConnection,ZAbstractRODataset,
  ZAbstractDataset, ZDataset, AdvObj;

type
  TfmDeviceModelCode = class(TfmASubForm)
    Panel12: TPanel;
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    Label3: TLabel;
    cmb_DeviceType: TComboBox;
    sg_Code: TAdvStringGrid;
    Panel1: TPanel;
    Label1: TLabel;
    btn_Delete: TSpeedButton;
    btn_Save: TSpeedButton;
    btn_Close: TSpeedButton;
    ed_Name: TEdit;
    procedure btn_CloseClick(Sender: TObject);
    procedure cmb_DeviceTypeChange(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure btn_DeleteClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    State : string;
    { Private declarations }
  private
    procedure LoadDeviceTypeCode;
    procedure ShowModelTypeCode;
    Function InsertTB_QNAMODELTYPE(aDeviceName,aModelName:string):Boolean;
    Function DeleteTB_QNAMODELTYPE(aDeviceName,aModelName:string):Boolean;
  public
    { Public declarations }
  end;

var
  fmDeviceModelCode: TfmDeviceModelCode;

implementation
uses
  uDataModule,
  uLomosUtil;

{$R *.dfm}


procedure TfmDeviceModelCode.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmDeviceModelCode.LoadDeviceTypeCode;
var
  stSql : string;
  TempAdoQuery : TZQuery;
begin
  cmb_DeviceType.Items.Clear;
  stSql := 'select * from TB_QNADEVICENAME order by QA_DEVICENAME ';
  
  Try
    CoInitialize(nil);
    TempAdoQuery := TZQuery.Create(nil);
    TempAdoQuery.Connection := dmDB.ZConnection1;

    with TempAdoQuery do
    begin
      close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      While Not Eof do
      begin
        cmb_DeviceType.Items.Add(FindField('QA_DEVICENAME').AsString);
        Next;
      end;
    end;
    if cmb_DeviceType.Items.Count > 0 then cmb_DeviceType.ItemIndex := 0;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  ShowModelTypeCode;
end;

procedure TfmDeviceModelCode.cmb_DeviceTypeChange(Sender: TObject);
begin
  inherited;
  ShowModelTypeCode;
end;

procedure TfmDeviceModelCode.btn_SaveClick(Sender: TObject);
begin
  inherited;
  InsertTB_QNAMODELTYPE(cmb_DeviceType.Text,ed_Name.Text);
  ed_Name.Text := '';
  ShowModelTypeCode;

end;

procedure TfmDeviceModelCode.ShowModelTypeCode;
var
  stSql : string;
  nRow : integer;
  TempAdoQuery : TZQuery;
begin
  inherited;
  GridInitialize(sg_Code); //스트링그리드 초기화

  stSql := 'select * from TB_QNAMODELTYPE ';
  stSql := stSql + ' Where QA_DEVICENAME =  ''' + cmb_DeviceType.Text + ''' ';
  stSql := stSql + ' order by QA_MODELNAME ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TZQuery.Create(nil);
    TempAdoQuery.Connection := dmDB.ZConnection1;

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

      with sg_Code do
      begin
        RowCount := RecordCount + 1;
        nRow := 1;
        while Not Eof do
        begin
          cells[0,nRow] := FindField('QA_MODELNAME').AsString;
          nRow := nRow + 1;
          Next;
        end;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmDeviceModelCode.InsertTB_QNAMODELTYPE(aDeviceName,
  aModelName: string): Boolean;
var
  stSql : string;
begin

  stSql := ' Insert Into TB_QNAMODELTYPE( ';
  stSql := stSql + ' QA_DEVICENAME ,' ;
  stSql := stSql + ' QA_MODELNAME )' ;
  stSql := stSql + ' values( ';
  stSql := stSql + '''' + aDeviceName + ''',';
  stSql := stSql + '''' + aModelName + '''';
  stSql := stSql + ')';

  result := dmDB.ProcessExecSQL(stSql);
end;

procedure TfmDeviceModelCode.btn_DeleteClick(Sender: TObject);
var
  bResult : boolean;
begin
  if (Application.MessageBox(PChar('데이터를 삭제하시겠습니까?'),'삭제',MB_OKCANCEL) = ID_CANCEL)  then Exit;
  DeleteTB_QNAMODELTYPE(cmb_DeviceType.Text,sg_Code.Cells[0,sg_Code.Row]);
  ShowModelTypeCode;

end;

function TfmDeviceModelCode.DeleteTB_QNAMODELTYPE(aDeviceName,
  aModelName: string): Boolean;
var
  stSql : string;
begin

  result := False;
  stSql := 'Delete From TB_QNAMODELTYPE ';
  stSql := stSql + ' where QA_DEVICENAME = ''' + aDeviceName + '''';
  stSql := stSql + ' AND QA_MODELNAME = ''' + aModelName + '''';

  result := dmDB.ProcessExecSQL(stSql);
end;

procedure TfmDeviceModelCode.FormActivate(Sender: TObject);
begin
  inherited;
  LoadDeviceTypeCode;
end;

end.
