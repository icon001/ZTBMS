unit uRemoteSupport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, SHDocVw, uSubForm, CommandArray;

type
  TfmRemoteSupport = class(TfmASubForm)
    WebBrowser1: TWebBrowser;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure CommandArrayCommandsTCloseExecute(Command: TCommand;
      Params: TStringList);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmRemoteSupport: TfmRemoteSupport;

implementation

{$R *.dfm}

procedure TfmRemoteSupport.FormActivate(Sender: TObject);
begin
  WebBrowser1.Navigate('http://zeron.co.kr/help');  
end;

procedure TfmRemoteSupport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'RemoteSupport';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;

  Action := caFree;
end;

procedure TfmRemoteSupport.FormShow(Sender: TObject);
begin
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'RemoteSupport';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;

end;

procedure TfmRemoteSupport.CommandArrayCommandsTCloseExecute(
  Command: TCommand; Params: TStringList);
begin
  inherited;
  Close;
end;

initialization
  RegisterClass(TfmRemoteSupport);
Finalization
  UnRegisterClass(TfmRemoteSupport);

end.
