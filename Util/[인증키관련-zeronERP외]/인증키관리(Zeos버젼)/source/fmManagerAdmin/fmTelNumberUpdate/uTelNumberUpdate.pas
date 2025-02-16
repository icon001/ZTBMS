unit uTelNumberUpdate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset;

type
  TfmTelNumberUpdate = class(TForm)
    StaticText1: TStaticText;
    ed_PhoneNum: TEdit;
    StaticText2: TStaticText;
    cmb_PhoneGubun: TComboBox;
    btn_Save: TSpeedButton;
    btn_Cancel: TSpeedButton;
    TempQuery: TZQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
  private
    PhoneGubunList : TStringList;
    { Private declarations }
    procedure LoadPoneGubun;
  public
    L_stOldTelNumber : string;
    L_stOldTelGubunCode : string;
    L_stPersonID : string;
    L_bSave : Boolean;
    { Public declarations }
  end;

var
  fmTelNumberUpdate: TfmTelNumberUpdate;

implementation
uses
  uDataModule,
  uLomosUtil;

{$R *.dfm}

{ TfmTelNumberUpdate }

procedure TfmTelNumberUpdate.LoadPoneGubun;
var
  stSql : string;
begin
  PhoneGubunList.Clear;
  cmb_PhoneGubun.Clear;
  stSql := 'select * from TB_TELGUBUN ';
  stSql := stSql + ' order by TE_GUBUN ';

  with TempQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 0 then Exit;
    While Not Eof do
    begin
      cmb_PhoneGubun.Items.Add(FindField('TE_GUBUNNAME').AsString );
      PhoneGubunList.Add(FindField('TE_GUBUN').AsString);
      Next;
    end;
  end;
end;

procedure TfmTelNumberUpdate.FormCreate(Sender: TObject);
begin
  PhoneGubunList := TStringList.Create;
  LoadPoneGubun;
end;

procedure TfmTelNumberUpdate.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  PhoneGubunList.Free;
end;

procedure TfmTelNumberUpdate.FormShow(Sender: TObject);
begin
  ed_PhoneNum.Text := L_stOldTelNumber;
  cmb_PhoneGubun.ItemIndex := PhoneGubunList.IndexOf(L_stOldTelGubunCode);
  L_bSave := False;
end;

procedure TfmTelNumberUpdate.btn_CancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmTelNumberUpdate.btn_SaveClick(Sender: TObject);
var
  stSql : string;
  stPhoneNum : string;
  stPhoneGubun : string;
begin
  stPhoneNum := StringReplace(ed_PhoneNum.Text,'-','',[rfReplaceAll]);
  if Not isDigit(stPhoneNum) then
  begin
    showmessage('전화번호 형태가 잘못 되었습니다.');
    Exit;
  end;
  stPhoneGubun := PhoneGubunList.Strings[cmb_PhoneGubun.ItemIndex];
  
  stSql := 'Update TB_TELNUM set ';
  stSql := stSql + ' TE_TELNUMBER = ''' + stPhoneNum + ''', ';
  stSql := stSql + ' TE_GUBUN = ''' + stPhoneGubun + ''' ';
  stSql := stSql + ' Where PE_CODE = ''' + L_stPersonID + ''' ';
  stSql := stSql + ' AND TE_TELNUMBER = ''' + StringReplace(L_stOldTelNumber,'-','',[rfReplaceAll]) + ''' ';

  L_bSave := dmDB.ProcessExecSQL(stSql);
  Close;
end;

end.
