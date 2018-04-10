unit uLink;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, RzEdit, RzButton, ExtCtrls, Buttons,iniFiles;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    edLink: TRzEdit;
    Label2: TLabel;
    edPasswd: TRzEdit;
    RzOpenDialog1: TOpenDialog;
    btFileSearch: TRzBitBtn;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    edserverip: TEdit;
    Label4: TLabel;
    edPort: TEdit;
    edUserID: TEdit;
    Label5: TLabel;
    edPass: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    ed_DataBase: TEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    L_DBTYPE :string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses
  DIMime,
  uLomosUtil;
{$R *.dfm}

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var
  ini_fun : TiniFile;
  ExeFolder : string;
  FileList:TStringList;
begin

    ExeFolder  := ExtractFileDir(Application.ExeName);
    ini_fun := TiniFile.Create(ExeFolder + '\ZMOS.INI');

    with ini_fun do
    begin
      Writestring('DBConfig','Host',Trim(edserverip.Text));
      Writestring('DBConfig','Port',Trim(edPort.Text));
      Writestring('DBConfig','UserID',Trim(edUserID.Text));
      Writestring('DBConfig','UserPW',MimeEncodeString(Trim(edPass.Text)));
      Writestring('DBConfig','DBNAME',Trim(ed_DataBase.Text));

      Writestring('EVENTDBConfig','Host',Trim(edserverip.Text));
      Writestring('EVENTDBConfig','Port',Trim(edPort.Text));
      Writestring('EVENTDBConfig','UserID',Trim(edUserID.Text));
      Writestring('EVENTDBConfig','UserPW',MimeEncodeString(Trim(edPass.Text)));
      Writestring('EVENTDBConfig','DBNAME',Trim(ed_DataBase.Text));

      Writestring('LOGDBConfig','Host',Trim(edserverip.Text));
      Writestring('LOGDBConfig','Port',Trim(edPort.Text));
      Writestring('LOGDBConfig','UserID',Trim(edUserID.Text));
      Writestring('LOGDBConfig','UserPW',MimeEncodeString(Trim(edPass.Text)));
      Writestring('LOGDBConfig','DBNAME',Trim(ed_DataBase.Text));
    end;

    ini_fun.Free;

    showmessage('적용이 완료되었습니다.');
    Close;

end;

procedure TForm1.FormShow(Sender: TObject);
var
  ini_fun : TiniFile;
  ExeFolder : string;
begin
    ExeFolder  := ExtractFileDir(Application.ExeName);
    ini_fun := TiniFile.Create(ExeFolder + '\ZMOS.INI');

    L_DBTYPE := ini_fun.ReadString('DBConfig','TYPE','');

    if UpperCase(L_DBTYPE) = 'PG' then
    begin
      Label4.Visible := False;
      edPort.Visible := False;
      Label5.Visible := True;
      edUserID.Visible := True;
      edServerIp.Text := ini_fun.ReadString('DBConfig','Host','127.0.0.1');
      edPort.Text := ini_fun.ReadString('DBConfig','Port','5432');
      ed_DataBase.Text := ini_fun.ReadString('DBConfig','DBNAME','zmos');
      edUserID.Text := ini_fun.ReadString('DBConfig','UserID','postgres');
      edPass.Text := MimeDecodeString(ini_fun.ReadString('DBConfig','UserPW','1'));
    end else if UpperCase(L_DBTYPE) = 'MSSQL' then
    begin
      Label4.Visible := True;
      edPort.Visible := True;
      Label5.Visible := True;
      edUserID.Visible := True;
      edServerIp.Text := ini_fun.ReadString('DBConfig','Host','127.0.0.1');
      edPort.Text := ini_fun.ReadString('DBConfig','Port','1433');
      ed_DataBase.Text := ini_fun.ReadString('DBConfig','DBNAME','zmos');
      edUserID.Text := ini_fun.ReadString('DBConfig','UserID','sa');
      edPass.Text := MimeDecodeString(ini_fun.ReadString('DBConfig','UserPW','sapasswd'));
    end;
    ini_fun.Free;

end;

end.
