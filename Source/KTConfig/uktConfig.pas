unit uktConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    L_bClose : Boolean;
    { Private declarations }
    procedure SetKTConfig;
    Function InsertTB_CONFIG(aCONFIGGROUP,aCONFIGCODE,aCONFIGVALUE:string;aConfigDetail:string=''):Boolean;
    Function UpdateTB_CONFIG(aCONFIGGROUP,aCONFIGCODE,aCONFIGVALUE:string;aConfigDetail:string=''):Boolean;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  uDataBaseConfig, uDataModule1;
  
{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  L_bClose := False;
  
  TDataBaseConfig.GetObject.DataBaseConnect;
  while Not TDataBaseConfig.GetObject.DBConnected do
  begin
    if TDataBaseConfig.GetObject.Cancel then
    begin
      L_bClose := True;
      Application.Terminate;
      Exit;
    End;
    TDataBaseConfig.GetObject.ShowDataBaseConfig;
  end;

end;

procedure TForm1.FormShow(Sender: TObject);
begin
  SetKTConfig;
  Close;
end;

function TForm1.InsertTB_CONFIG(aCONFIGGROUP, aCONFIGCODE, aCONFIGVALUE,
  aConfigDetail: string): Boolean;
var
  stSql : string;
begin
  Result := False;

  stSql := 'Insert Into TB_CONFIG (';
  stSql := stSql + ' GROUP_CODE ,';
  stSql := stSql + ' CO_CONFIGGROUP ,';
  stSql := stSql + ' CO_CONFIGCODE ,';
  stSql := stSql + ' CO_CONFIGVALUE,';
  stSql := stSql + ' CO_CONFIGDETAIL ) ';
  stSql := stSql + ' Values ( ';
  stSql := stSql + ' ''' + GROUPCODE + ''', ';
  stSql := stSql + ' ''' + aCONFIGGROUP + ''', ';
  stSql := stSql + ' ''' + aCONFIGCODE + ''', ';
  stSql := stSql + ' ''' + aCONFIGVALUE + ''', ';
  stSql := stSql + ' ''' + aConfigDetail + ''' ) ';

  result :=  DataModule1.ProcessExecSQL(stSql);

end;

procedure TForm1.SetKTConfig;
begin
  if Not InsertTB_CONFIG('COMMON','CARDNOTYPE','2','카드번호Type(고정/가변)') then
  begin
    UpdateTB_CONFIG('COMMON','CARDNOTYPE','2','카드번호Type(고정/가변)');
  end;
  if Not InsertTB_CONFIG('FIRE','FIRERECUSE','1','화재복구사용유무') then
  begin
    UpdateTB_CONFIG('FIRE','FIRERECUSE','1','화재복구사용유무');
  end;
  UpdateTB_CONFIG('COMMON','SPECIALCD','1' ); //특화시스템 KT
  UpdateTB_CONFIG('DAEMON','IP','127.0.0.1');
  UpdateTB_CONFIG('MOSTYPE','FILEIP','127.0.0.1');
  if DBType = 'PG' then
    UpdateTB_CONFIG('MOSTYPE','FILEDIR',stringReplace('\\127.0.0.1\공유','\','\\',[rfReplaceAll]) )
  else UpdateTB_CONFIG('MOSTYPE','FILEDIR','\\127.0.0.1\공유');
  UpdateTB_CONFIG('MCUCOMM','CARDAUTO','TRUE' );

end;

function TForm1.UpdateTB_CONFIG(aCONFIGGROUP, aCONFIGCODE, aCONFIGVALUE,
  aConfigDetail: string): Boolean;
var
  stSql : string;
begin
  Result := False;

  stSql := 'Update TB_CONFIG ';
  stSql := stSql + ' Set CO_CONFIGVALUE = ''' + aCONFIGVALUE + ''', ';
  stSql := stSql + ' CO_CONFIGDETAIL = ''' + aConfigDetail + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_CONFIGGROUP = ''' + aCONFIGGROUP + ''' ';
  stSql := stSql + ' AND CO_CONFIGCODE = ''' + aCONFIGCODE + ''' ';

  result :=  DataModule1.ProcessExecSQL(stSql);

end;

end.
