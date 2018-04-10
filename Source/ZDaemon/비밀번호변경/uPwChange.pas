unit uPwChange;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls,ADODB,ActiveX;

type
  TfmPwChange = class(TForm)
    Label1: TLabel;
    edOrgpw: TEdit;
    Bevel1: TBevel;
    sbSave: TSpeedButton;
    sbCancel: TSpeedButton;
    Label2: TLabel;
    edNewPw1: TEdit;
    Label3: TLabel;
    edNewPw2: TEdit;
    procedure sbCancelClick(Sender: TObject);
    procedure sbSaveClick(Sender: TObject);
    procedure edOrgpwKeyPress(Sender: TObject; var Key: Char);
    procedure edNewPw1KeyPress(Sender: TObject; var Key: Char);
    procedure edNewPw2KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmPwChange: TfmPwChange;

implementation

uses
  uDataModule1,DiMime;

{$R *.dfm}

procedure TfmPwChange.sbCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmPwChange.sbSaveClick(Sender: TObject);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;

    with TempAdoQuery do
    begin
      stSql := 'select * from TB_CURRENTDAEMON ';
      stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + '''';
      stSql := stSql + ' and CU_STATECODE = ''Password''';
      stSql := stSql + ' and CU_STATEVALUE = ''' + MimeEncodeString(edOrgPw.Text) + '''';

      Close;
      Sql.Clear;
      Sql.Text := stSql;
      Try
        Open;
      Except
        showmessage('�����ͺ��̽� ���� ����');
        Exit;
      End;

      if RecordCount < 1 then
      begin
        showmessage('���� ��� ��й�ȣ�� Ʋ���ϴ�.');
        Exit;
      end;

      if edNewPw1.Text <> edNewPw2.Text then
      begin
        showmessage('�ű� ��й�ȣ�� �ùٸ��� �ʽ��ϴ�.');
        Exit;
      end;

      if (length(edNewPw1.Text) < 6) or (length(edNewPw1.Text) > 12) then
      begin
        showmessage('��й�ȣ �ڸ����� 6~12�ڸ� �Դϴ�.');
        Exit;
      end;


      stSql := 'Update TB_CURRENTDAEMON Set CU_STATEVALUE = ''' + MimeEncodeString(edNewPw1.Text) + '''' ;
      stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + '''';
      stSql := stSql + ' and CU_STATECODE = ''Password''';

      if   Not DataModule1.ProcessExecSql(stSql) then
      begin
        Showmessage('������Ʈ�� �����߽��ϴ�.');
        Exit;
      end;

    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;

  Close;

end;

procedure TfmPwChange.edOrgpwKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    edNewPw1.SetFocus;
  end;
end;

procedure TfmPwChange.edNewPw1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    edNewPw2.SetFocus;
  end;

end;

procedure TfmPwChange.edNewPw2KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    sbSaveClick(Self);
  end;

end;

end.
