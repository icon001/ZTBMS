unit uInOutGroupName;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, DB, ADODB;

type
  TfmInOutGroupName = class(TForm)
    Label1: TLabel;
    ed_GroupName: TEdit;
    btn_Apply: TSpeedButton;
    btn_Cancel: TSpeedButton;
    ADOQuery: TADOQuery;
    procedure btn_CancelClick(Sender: TObject);
    procedure btn_ApplyClick(Sender: TObject);
  private
    { Private declarations }
    function CheckInOutGroupName(aGroupName:string):Boolean;
  public
    { Public declarations }
  end;

var
  fmInOutGroupName: TfmInOutGroupName;

implementation

uses
  uInOutGroup,
  uDataModule1;
{$R *.dfm}

procedure TfmInOutGroupName.btn_CancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmInOutGroupName.btn_ApplyClick(Sender: TObject);
begin
  if CheckInOutGroupName(ed_GroupName.Text) then
  begin
    showmessage('이미 등록되어 있는 그룹명입니다.');
    ed_GroupName.SetFocus;
    Exit;
  end;
  fmInOutGroup.ed_inOutGroupName.Text := ed_GroupName.Text;
  Close;

end;

function TfmInOutGroupName.CheckInOutGroupName(
  aGroupName: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'select * from tb_inoutgroup ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND io_groupname = ''' + aGroupName + ''' ';
  with AdoQuery do
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
    result := True;
  end;
end;

end.
