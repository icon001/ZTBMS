unit uErrorList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, Grids, BaseGrid, AdvGrid,
  uSubForm, CommandArray,ADODB,ActiveX,ZConnection,ZAbstractRODataset,
  ZAbstractDataset, ZDataset, AdvObj;

type
  TfmErrorList = class(TfmASubForm)
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

    Function InsertTB_QNAERRORLIST(aName:string):Boolean;
    Function DeleteTB_QNAERRORLIST(aName:string):Boolean;
  public
    { Public declarations }
  end;

var
  fmErrorList: TfmErrorList;

implementation

{$R *.dfm}
uses
  uDataModule,
  uLomosUtil;

{ TForm1 }

procedure TfmErrorList.ButtonEnable(aState: string);
begin

end;

procedure TfmErrorList.FormClear;
begin
  ed_Name.Text := '';

end;

procedure TfmErrorList.FormEnable(aState: string);
begin

end;

procedure TfmErrorList.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmErrorList.FormActivate(Sender: TObject);
begin
   ShowDeviceTypeCode('');
end;

procedure TfmErrorList.ShowDeviceTypeCode(aCode: string);
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

  stSql := 'select * from TB_QNAERRORLIST order by QA_ERRORLIST ';

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
          cells[0,nRow] := FindField('QA_ERRORLIST').AsString;
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

procedure TfmErrorList.btn_DeleteClick(Sender: TObject);
var
  bResult : boolean;
begin
  if (Application.MessageBox(PChar('데이터를 삭제하시겠습니까?'),'삭제',MB_OKCANCEL) = ID_CANCEL)  then Exit;
  DeleteTB_QNAERRORLIST(sg_Code.Cells[0,sg_Code.Row]);
  ShowDeviceTypeCode('');
end;

procedure TfmErrorList.btn_SaveClick(Sender: TObject);
begin
  InsertTB_QNAERRORLIST(ed_Name.Text);
  ed_Name.Text := '';
  ShowDeviceTypeCode('');
end;

function TfmErrorList.InsertTB_QNAERRORLIST(aName: string): Boolean;
var
  stSql : string;
begin

  stSql := ' Insert Into TB_QNAERRORLIST( ';
  stSql := stSql + ' QA_ERRORLIST )' ;
  stSql := stSql + ' values( ';
  stSql := stSql + '''' + aName + '''';
  stSql := stSql + ')';

  result := dmDB.ProcessExecSQL(stSql);
end;

function TfmErrorList.DeleteTB_QNAERRORLIST(aName: string): Boolean;
var
  stSql : string;
begin

  result := False;
  stSql := 'Delete From TB_QNAERRORLIST ';
  stSql := stSql + ' where QA_ERRORLIST = ''' + aName + '''';

  result := dmDB.ProcessExecSQL(stSql);
end;

end.
