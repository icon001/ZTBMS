unit uImageTest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, Grids, BaseGrid, AdvGrid, uSubForm,
  CommandArray;

type
  TfmImageTest = class(TfmASubForm)
    sg_Access: TAdvStringGrid;
    AdoQuery: TADOQuery;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmImageTest: TfmImageTest;

implementation

{$R *.dfm}

procedure TfmImageTest.Button1Click(Sender: TObject);
var
stSql : string;
nRow : integer;
begin
      sg_Access.Cells[1,1] := 'Test';
      sg_Access.CreateFilePicture(1,1,True,ShrinkWithAspectRatio,20,haCenter,vaAboveText).Filename := 'E:\[프로젝트]\[IMAGE]\운영모드.bmp';
{  stSql := 'select * from TB_LOCATIOIN Where LO_IMAGEUSE = ''Y''';
  with AdoQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text:= stSql;
    Try
      open;
    Except
      Exit;
    End;
    if recordcount < 0 then Exit;

    sg_Access.RowCount := recordCount;
    nRow := 1;
    While Not Eof do
    begin
      sg_Access.Cells[1,nRow] := 'Test';
      sg_Access.CreateFilePicture(1,nRow,True,ShrinkWithAspectRatio,20,haCenter,vaAboveText).Filename := 'E:\프로젝트\KT프로젝트\Image\운영모드.bmp';
      //sg_Access.CreatePicture(1,nRow,True,ShrinkWithAspectRatio,20,haCenter,vaAboveText):= GetJPEGFromDB(FieldByName('LO_CADIMAGE'));
      Inc(nRow);
      Next;
    end;

  end;
  //sg_Access.CreatePicture()
  sg_Access.CreateIcon(1,1,haCenter,vaCenter);  }
end;

end.
