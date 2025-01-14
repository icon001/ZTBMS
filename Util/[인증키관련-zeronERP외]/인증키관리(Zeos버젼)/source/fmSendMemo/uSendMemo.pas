unit uSendMemo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB, IdBaseComponent, IdComponent,
  IdUDPBase, IdUDPClient, ExtCtrls, ZAbstractRODataset, ZAbstractDataset,
  ZDataset;

type
  TfmSendMemo = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    cmb_UserName: TComboBox;
    ed_memSubject: TEdit;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    mem_Memo: TMemo;
    TempQuery: TZQuery;
    btn_Send: TSpeedButton;
    btn_CanCel: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure btn_SendClick(Sender: TObject);
    procedure btn_CanCelClick(Sender: TObject);
  private
    MasterIDList:TStringList;
    { Private declarations }
    procedure  LoadUserName(cmb_box:TComboBox);
    Function GetMemoID(aUserID:string):integer;
    Function InsertTB_USERMEMO(aUserID,
                    aMemoID,
                    aDate,
                    aTime,
                    aSubject,
                    aMemo,
                    aConfirm,
                    aSendID:string):Boolean;
  public
    L_bSend : Boolean;
    { Public declarations }
  end;

var
  fmSendMemo: TfmSendMemo;

implementation

uses
  uDataModule,
  uLomosUtil, uMain;
  
{$R *.dfm}

{ TfmSendMemo }

procedure TfmSendMemo.LoadUserName(cmb_box: TComboBox);
var
  stSql : string;
begin
  MasterIDList.Clear;
  cmb_box.Clear;
  cmb_box.ItemIndex := -1;
  stSql := ' Select * from TB_MASTER ';
  stSql := stSql + ' Where MA_USERID <> ''' + Master_ID + ''' ';

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
      MasterIDList.Add(FindField('MA_USERID').AsString);
      cmb_box.Items.Add(FindField('MA_USERNAME').AsString);
      Next;
    end;
  end;
end;

procedure TfmSendMemo.FormCreate(Sender: TObject);
begin
  MasterIDList := TStringList.Create;
  L_bSend :=  False;

  LoadUserName(cmb_UserName);
end;

procedure TfmSendMemo.btn_SendClick(Sender: TObject);
var
  stUserID : string;
  stSql : string;
  nMemoID : integer;
  stSendData : string;
begin
  if cmb_UserName.ItemIndex < 0 then
  begin
    showmessage('받는사람을 선택해 주세요.');
    cmb_UserName.SetFocus;
    Exit;
  end;
  if ed_memSubject.Text = '' then
  begin
    showmessage('제목을 입력해 주세요.');
    ed_memSubject.SetFocus;
    Exit;
  end;
  stUserID := MasterIDList.Strings[cmb_UserName.ItemIndex];

  nMemoID := GetMemoID(stUserID);
  InsertTB_USERMEMO(stUserID,
                    inttostr(nMemoID),
                    FormatDateTime('yyyymmdd',now),
                    FormatDateTime('HHMMSS',now),
                    ed_memSubject.Text,
                    mem_Memo.Text,
                    'N',
                    Master_ID);

  stSendData := 'MEMO,USERID=' + stUserID + ',SENDID=' + Master_ID;

  fmMain.ModemSendDataList.add(stSendData);

  L_bSend := True;
  Close;
end;

procedure TfmSendMemo.btn_CanCelClick(Sender: TObject);
begin
  Close;
end;

function TfmSendMemo.GetMemoID(aUserID: string): integer;
var
  stSql : string;
begin
  result := 1;
  stSql := 'select Max(UM_ID) as UM_ID ';
  stSql := stSql + ' From TB_USERMEMO ';
  stSql := stSql + ' Where UM_USERID = ''' + aUserID + ''' ';

  with TempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    result := Findfield('UM_ID').AsInteger + 1;
  end;

end;

function TfmSendMemo.InsertTB_USERMEMO(aUserID, aMemoID, aDate, aTime,
  aSubject, aMemo, aConfirm, aSendID: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_USERMEMO( ';
  stSql := stSql + 'UM_USERID,';
  stSql := stSql + 'UM_ID,';
  stSql := stSql + 'UM_DATE,';
  stSql := stSql + 'UM_TIME,';
  stSql := stSql + 'UM_SUBJECT,';
  stSql := stSql + 'UM_MEMO,';
  stSql := stSql + 'UM_CONFIRM,';
  stSql := stSql + 'UM_SENDERID) ';
  stSql := stSql + ' Values(';
  stSql := stSql + '''' + aUserID + ''',';
  stSql := stSql + aMemoID + ',';
  stSql := stSql + '''' + aDate + ''',';
  stSql := stSql + '''' + aTime + ''',';
  stSql := stSql + '''' + aSubject + ''',';
  stSql := stSql + '''' + aMemo + ''',';
  stSql := stSql + '''' + aConfirm + ''',';
  stSql := stSql + '''' + aSendID + ''') ';

  result := dmDB.ProcessExecSQL(stSql);
end;

end.
