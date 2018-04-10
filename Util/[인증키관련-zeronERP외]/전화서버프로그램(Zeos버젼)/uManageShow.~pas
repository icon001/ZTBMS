unit uManageShow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Menus;

type
  TfmManageShow = class(TForm)
    Label1: TLabel;
    edit_recvTelno: TEdit;
    Label2: TLabel;
    ed_recvTime: TEdit;
    Label3: TLabel;
    ed_recvname: TEdit;
    Label4: TLabel;
    mem_Etc: TMemo;
    Label5: TLabel;
    ed_Question: TEdit;
    mem_Process: TMemo;
    Label6: TLabel;
    SpeedButton3: TSpeedButton;
    Label7: TLabel;
    ed_PCIP: TEdit;
    btn_save: TSpeedButton;
    PopupMenu1: TPopupMenu;
    mn_F4: TMenuItem;
    procedure SpeedButton3Click(Sender: TObject);
    procedure mn_F4Click(Sender: TObject);
    procedure btn_saveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmManageShow: TfmManageShow;

implementation

uses uDataModule1,
     uLomosUtil;

{$R *.dfm}

procedure TfmManageShow.SpeedButton3Click(Sender: TObject);
begin
  Close;
end;

procedure TfmManageShow.mn_F4Click(Sender: TObject);
begin
  btn_saveClick(self);
end;

procedure TfmManageShow.btn_saveClick(Sender: TObject);
var
  stSql : string;
  stDate : string;
begin
  if edit_recvTelno.Text ='' then Exit;
  if ed_recvTime.Text = '' then Exit;
  stDate := StringReplace(ed_recvTime.Text,'-','',[rfReplaceAll]);
  stDate := StringReplace(stDate,' ','',[rfReplaceAll]);
  stDate := StringReplace(stDate,':','',[rfReplaceAll]);
  stSql := ' Update TB_MANAGELIST set ';
  stSql := stSql + 'MA_DATA = ''' + mem_Process.Text + ''',';
  stSql := stSql + 'MA_PCIP = ''' + Get_Local_IPAddr + ''',';
  stSql := stSql + 'MA_QUESTION = ''' + ed_Question.Text + ''' ';
  stSql := stSql + ' Where MA_DATE = ''' + copy(stDate,1,8) + ''' ';
  stSql := stSql + ' AND MA_TIME = ''' + copy(stDate,9,4) + ''' ';
  stsql := stSql + ' AND CU_TELNO = ''' + edit_recvTelno.Text + ''' ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := 'Update TB_CUSTOMER set ';
  stSql := stSql + ' CU_NAME = ''' + ed_recvName.Text + ''',';
  stSql := stSql + ' CU_ETC = ''' + mem_etc.Text + ''' ';
  stSql := stSql + ' WHERE CU_TELNO = ''' + edit_recvTelno.Text + ''' ';

  DataModule1.ProcessExecSQL(stSql);
end;

end.
