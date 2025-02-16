unit uDeviceType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, Grids, BaseGrid, AdvGrid,
  uSubForm, CommandArray,ADODB,ActiveX,ZConnection,ZAbstractRODataset,
  ZAbstractDataset, ZDataset, AdvObj;

type
  TfmDeviceType = class(TfmASubForm)
    Panel12: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    btn_Delete: TSpeedButton;
    btn_Save: TSpeedButton;
    btn_Close: TSpeedButton;
    ed_Name: TEdit;
    StatusBar1: TStatusBar;
    sg_Code: TAdvStringGrid;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btn_DeleteClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
  private
    State : string;
    { Private declarations }
    procedure FormClear;
    procedure FormEnable(aState:string);
    procedure ButtonEnable(aState:string);
  private
    procedure ShowDeviceTypeCode(aCode:string);

    Function InsertTB_QNADEVICETYPE(aName:string):Boolean;
    Function DeleteTB_QNADEVICETYPE(aName:string):Boolean;
  public
    { Public declarations }
  end;

var
  fmDeviceType: TfmDeviceType;

implementation

{$R *.dfm}
uses
  uDataModule,
  uLomosUtil;

{ TForm1 }

procedure TfmDeviceType.ButtonEnable(aState: string);
begin

end;

procedure TfmDeviceType.FormClear;
begin
  ed_Name.Text := '';

end;

procedure TfmDeviceType.FormEnable(aState: string);
begin

end;

procedure TfmDeviceType.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmDeviceType.FormActivate(Sender: TObject);
begin
   ShowDeviceTypeCode('');
end;

procedure TfmDeviceType.ShowDeviceTypeCode(aCode: string);
var
  stSql : string;
  nRow : integer;
  i : integer;
  TempAdoQuery : TZQuery;
begin
  GridInitialize(sg_Code); //스트링그리드 초기화

  State := 'SEARCH';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  stSql := 'select * from TB_QNADEVICETYPE order by QA_DEVICETYPENAME ';

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
          cells[0,nRow] := FindField('QA_DEVICETYPENAME').AsString;
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

procedure TfmDeviceType.btn_DeleteClick(Sender: TObject);
var
  bResult : boolean;
begin
  if (Application.MessageBox(PChar('데이터를 삭제하시겠습니까?'),'삭제',MB_OKCANCEL) = ID_CANCEL)  then Exit;
  DeleteTB_QNADEVICETYPE(sg_Code.Cells[0,sg_Code.Row]);
  ShowDeviceTypeCode('');
end;

procedure TfmDeviceType.btn_SaveClick(Sender: TObject);
begin
  InsertTB_QNADEVICETYPE(ed_Name.Text);
  ed_Name.Text := '';
  ShowDeviceTypeCode('');
end;

function TfmDeviceType.InsertTB_QNADEVICETYPE(aName: string): Boolean;
var
  stSql : string;
begin

  stSql := ' Insert Into TB_QNADEVICETYPE( ';
  stSql := stSql + ' QA_DEVICETYPENAME )' ;
  stSql := stSql + ' values( ';
  stSql := stSql + '''' + aName + '''';
  stSql := stSql + ')';

  result := dmDB.ProcessExecSQL(stSql);
end;

function TfmDeviceType.DeleteTB_QNADEVICETYPE(aName: string): Boolean;
var
  stSql : string;
begin

  result := False;
  stSql := 'Delete From TB_QNADEVICETYPE ';
  stSql := stSql + ' where QA_DEVICETYPENAME = ''' + aName + '''';

  result := dmDB.ProcessExecSQL(stSql);
end;

end.
