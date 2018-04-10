unit uQuery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Grids, DBGrids;

type
  TfmQuery = class(TForm)
    Memo1: TMemo;
    Label1: TLabel;
    Button1: TButton;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmQuery: TfmQuery;

implementation

uses
  udmAdoRelay;
  
{$R *.dfm}

procedure TfmQuery.Button1Click(Sender: TObject);
begin
  with ADOQuery1 do
  begin
    Close;
    Sql.Text := memo1.Text;
    Try
      Open;
    Except
      Exit;
    End;
  end;
end;

end.
