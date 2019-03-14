unit uQueryTest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, Buttons, ExtCtrls, DB, ADODB;

type
  TfmQueryTest = class(TForm)
    Panel2: TPanel;
    btn_Close: TSpeedButton;
    DBGrid1: TDBGrid;
    Memo1: TMemo;
    Button1: TButton;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    procedure btn_CloseClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FConnectNo: integer;
    { Private declarations }
  public
    { Public declarations }
    property ConnectNo : integer read FConnectNo write FConnectNo;
  end;

var
  fmQueryTest: TfmQueryTest;

implementation

uses
  udmAdoRelay;

{$R *.dfm}

procedure TfmQueryTest.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmQueryTest.Button1Click(Sender: TObject);
begin
  Try
    ADOQuery1.Close;
    if ConnectNo = 1 then ADOQuery1.Connection := dmAdoRelay.ADOConnectionTEST
    else if ConnectNo = 2 then ADOQuery1.Connection := dmAdoRelay.ADOConnectionTEST
    else if ConnectNo = 3 then ADOQuery1.Connection := dmAdoRelay.ADOConnectionTEST;
    ADOQuery1.SQL.Text := Memo1.Text;
    if UpperCase(copy(Memo1.Text,1,Length('Select'))) = 'SELECT' then
    begin
      ADOQuery1.Open;
    end else
    begin
      ADOQuery1.ExecSQL;
    end;
  Except
    ON E: Exception do
    begin
      showmessage(E.Message);
      Exit;
    end;
    //Exit;
  End;
end;

end.
