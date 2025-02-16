unit uSendTelNo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, IdBaseComponent, IdComponent, IdUDPBase,
  IdUDPClient, Buttons;

type
  TfmSendTelNo = class(TForm)
    IdUDPClient1: TIdUDPClient;
    TempQuery: TADOQuery;
    Label1: TLabel;
    cmb_UserName: TComboBox;
    btn_Send: TSpeedButton;
    btn_CanCel: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure btn_SendClick(Sender: TObject);
    procedure btn_CanCelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    MasterIDList:TStringList;
    { Private declarations }
    procedure  LoadUserName(cmb_box:TComboBox);
  public
    L_TelNumber : string;
    L_bSend : Boolean;
    { Public declarations }

  end;

var
  fmSendTelNo: TfmSendTelNo;

implementation

uses
  uDataModule,
  uLomosUtil;
{$R *.dfm}

procedure TfmSendTelNo.FormCreate(Sender: TObject);
begin
  L_bSend :=  False;
  MasterIDList := TStringList.Create;
end;

procedure TfmSendTelNo.btn_SendClick(Sender: TObject);
var
  stMasterID : string;
  stSendData : string;
begin
  if cmb_UserName.ItemIndex < 0 then
  begin
    showmessage('받는사람을 선택하세요.');
    Exit;
  end;
  if L_TelNumber = '' then
  begin
    showmessage('전화번호가 없습니다.');
    Exit;
  end;
  L_bSend := True;

  stMasterID := MasterIDList.Strings[cmb_UserName.ItemIndex];
  stSendData := 'SEND,USERID=' + stMasterID + ',TELNUM=' + L_TelNumber;

  IdUDPClient1.Broadcast(stSendData,194501);
  Delay(100);
  IdUDPClient1.Broadcast(stSendData,194501); //두번전송하자.

  Close;
end;

procedure TfmSendTelNo.btn_CanCelClick(Sender: TObject);
begin
  L_bSend := False;
  Close;
end;

procedure TfmSendTelNo.LoadUserName(cmb_box: TComboBox);
var
  stSql : string;
begin
  MasterIDList.Clear;
  cmb_box.Clear;
  cmb_box.ItemIndex := -1;
  stSql := ' Select * from TB_AUTHADMIN ';
  stSql := stSql + ' Where AD_USERID <> ''' + Master_ID + ''' ';

  with TempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if RecordCount < 1 then Exit;
    While Not Eof do
    begin
      MasterIDList.Add(FindField('AD_USERID').AsString);
      cmb_box.Items.Add(FindField('AD_USERNAME').AsString);
      Next;
    end;
  end;
end;

procedure TfmSendTelNo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  MasterIDList.Free;
end;

procedure TfmSendTelNo.FormShow(Sender: TObject);
begin
  LoadUserName(cmb_UserName);
end;

end.
