unit uDataBaseConfig;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, AdvPanel,
  W7Classes, W7Buttons, Vcl.ImgList,System.iniFiles,Data.DB,Data.Win.ADODB,JclMime;


type
  TDataBaseConfig = class(TComponent)
  private
  end;

  TfmDataBaseConfig = class(TForm)
    btn_Save: TW7SpeedButton;
    btn_Close: TW7SpeedButton;
    AdvPanel1: TAdvPanel;
    Label5: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    edPasswd: TEdit;
    edDataBaseName: TEdit;
    edUserid: TEdit;
    edServerPort: TEdit;
    edServerIP: TEdit;
    rg_DBType: TRadioGroup;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmDataBaseConfig: TfmDataBaseConfig;

implementation

{$R *.dfm}

end.
