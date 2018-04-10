unit uZipCode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uSubForm, ComCtrls, StdCtrls, Buttons, CommandArray, Grids,
  BaseGrid, AdvGrid;

type
  TfmZipCode = class(TfmASubForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    ed_Dong: TEdit;
    btn_Search: TBitBtn;
    StatusBar1: TStatusBar;
    sg_ZipCode: TAdvStringGrid;
    procedure btn_SearchClick(Sender: TObject);
    procedure ed_DongKeyPress(Sender: TObject; var Key: Char);
    procedure sg_ZipCodeDblClick(Sender: TObject);
  private
    { Private declarations }
    Procedure sg_ZipCodeInit;
  public
    { Public declarations }
    CallingModuleID : string;
  end;

var
  fmZipCode: TfmZipCode;

implementation
uses
  uDataModule1;

{$R *.dfm}

procedure TfmZipCode.btn_SearchClick(Sender: TObject);
var
  stSql : string;
  nRow : integer;
begin
  sg_ZipCodeInit;

  stSql := ' Select * from TB_ZIPCODE ';
  stSql := stSql + ' Where ZI_DONG LIKE ''' + ed_Dong.Text + '%'' ';

  with DataModule1.ADOTmpQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      Open;
    Except
      Exit;
    End;

    if RecordCount < 1 then Exit;
    First;
    sg_ZipCode.RowCount := RecordCount + 1;
    nRow := 1;
    While Not Eof do
    begin
      with sg_ZipCode do
      begin
        Cells[0,nRow] := FindField('ZI_ZIPCODE').AsString ;
        Cells[1,nRow] := FindField('ZI_SIDO').AsString ;
        Cells[2,nRow] := FindField('ZI_GUGUN').AsString ;
        Cells[3,nRow] := FindField('ZI_DONG').AsString ;
        Cells[4,nRow] := FindField('ZI_BUNJI').AsString ;
      end;

      inc(nRow);
      Next;
    end;
  end;
end;

procedure TfmZipCode.sg_ZipCodeInit;
var
  i : integer;
begin
  with sg_ZipCode do
  begin
    RowCount := 2;
    for i:=0 to ColCount - 1 do
    begin
      Cells[i,1] := '';
    end;
  end;
end;

procedure TfmZipCode.ed_DongKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    btn_SearchClick(Self);
  end;
end;

procedure TfmZipCode.sg_ZipCodeDblClick(Sender: TObject);
begin
  with sg_ZipCode do
  begin
    self.FindClassForm(CallingModuleID).FindCommand('ZipCode').Params.Values['Code'] := Cells[0,Row];
    self.FindClassForm(CallingModuleID).FindCommand('ZipCode').Params.Values['Sido'] := Cells[1,Row];
    self.FindClassForm(CallingModuleID).FindCommand('ZipCode').Params.Values['Gugun'] := Cells[2,Row];
    self.FindClassForm(CallingModuleID).FindCommand('ZipCode').Params.Values['Dong'] := Cells[3,Row];
    self.FindClassForm(CallingModuleID).FindCommand('ZipCode').Params.Values['Bunji'] := Cells[4,Row];
    self.FindClassForm(CallingModuleID).FindCommand('ZipCode').Execute;
  end;
  Close;
end;

end.
