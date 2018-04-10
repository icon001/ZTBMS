unit uTotalComCheck;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzCmboBx, LMDCustomScrollBox, LMDListBox, RzButton;

type
  TfmTotalComCheck = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    ComboBox_ECU: TRzComboBox;
    GroupBox2: TGroupBox;
    btnComCheck: TRzBitBtn;
    btnClose: TRzBitBtn;
    GroupBox3: TGroupBox;
    LMDListBox2: TLMDListBox;
    LMDListBox1: TLMDListBox;
    chkCard: TCheckBox;
    chkDoor: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
    procedure btnComCheckClick(Sender: TObject);
    procedure LMDListBox2GetLineSettings(Sender: TObject; Index: Integer;
      State: TOwnerDrawState; var bColor: TColor; aFont: TFont);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    procedure ECUCheck(stEcuId:string);
    Function ReaderCheck(stEcuId:string) :Boolean;
    Function IndicatorCheck(stEcuID:string) :Boolean;
    procedure DoorCheck(stEcuId:string;nDoorNo:integer);
    Function ECUComCheck:Boolean;
  public
    { Public declarations }
    ECUList : TStringList;
    DeviceList : TStringList;
    ItemIndex : Integer;
    DeviceID : String;
    stMessage : string;
    nSeq : integer; //����
  end;

var
  fmTotalComCheck: TfmTotalComCheck;

implementation
uses
  uMain;
{$R *.dfm}

procedure TfmTotalComCheck.FormShow(Sender: TObject);
var
  i : integer;
begin
  DeviceList := TStringList.Create;
  ComboBox_ECU.Clear;
  for i := 0 to ECUList.Count - 1 do
  begin
    ComboBox_ECU.Add(ECUList.Strings[i]);
  end;
  ComboBox_ECU.ItemIndex := ItemIndex;
  Form_Main.bTotalComCheckShow := True;
  nSeq := 0;

end;

procedure TfmTotalComCheck.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Form_Main.bTotalComCheckShow := False;
end;

procedure TfmTotalComCheck.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmTotalComCheck.btnComCheckClick(Sender: TObject);
var
  stEcuId : string;
  bResult : boolean;
  nLoop : integer;
begin
  nSeq := 0;
  LMDListBox2.Clear;
  LMDListBox1.Clear;

  if ComboBox_ECU.ItemIndex = 0 then
  begin
    bResult := ECUComCheck;
    if Not bResult then Exit;
    for nLoop := 0 to DeviceList.Count - 1 do
    begin
      stEcuId := DeviceList.Strings[nLoop];
      if Length(stEcuId) = 1 then stEcuId := '0' + stEcuId;
      ReaderCheck(stEcuId);   //������ üũ
      IndicatorCheck(stEcuID); //��Ȳǥ�ñ� üũ
    end;
  end else
  begin
    stEcuId := copy(ComboBox_ECU.text,1,2);
    if Length(stEcuId) = 1 then stEcuId := '0' + stEcuId;
    ReaderCheck(stEcuId);   //������ üũ
    IndicatorCheck(stEcuID); //��Ȳǥ�ñ� üũ
  end;
{
  with Form_Main.TB_DEVICE do
  begin
    if ComboBox_ECU.ItemIndex = 0 then   //��ü ���üũ�̸� ��� ã�Ƽ� ������ ���鼭 üũ
    begin
      First;
      while Not Eof do
      begin
        stEcuId := FindField('EUC_ID').AsString;
        ReaderCheck(stEcuId);   //������ üũ
        IndicatorCheck(stEcuID); //��Ȳǥ�ñ� üũ
        next;
      end;
    end
    else
    begin
      if FindKey([copy(ComboBox_ECU.text,1,2)]) then
      begin
        stEcuId := FindField('EUC_ID').AsString;
        ReaderCheck(stEcuId);   //Ȯ��� üũ
        IndicatorCheck(stEcuID); //��Ȳǥ�ñ� üũ
      end
      else  showmessage(copy(ComboBox_ECU.text,1,2) + '�� Ȯ��� ������ ã�� �� �����ϴ�.');
    end;
  end; //with end   }
 
end;

procedure TfmTotalComCheck.ECUCheck(stEcuId: string);
var
  aDeviceID : string;
  nTime : integer;
  stOk : string;
  stFail : string;
begin
//Ȯ��� ���� üũ
  aDeviceID := DeviceID + stEcuId;
  stMessage := '';
//  bVERCheck := False;
  Form_Main.CheckVersion(aDeviceID);
{  Form_Main.SendPacket(aDeviceID,'R','VR00',True);

  nTime := 0;
  While Not bVERCheck do
  begin
    if nTime > ComCheckDelayTime then break;
    Application.ProcessMessages;
    sleep(1);
    nTime := nTime + 1;
  end;
}
  nSeq := nSeq + 1;
  if bVerCheck then
  begin
    stOk := inttostr(nSeq) + ';';
    if stEcuId = '00' then stOk := stOk + 'MCU üũ' + ';'
    else stOk := stOk + 'ECU üũ' + ';';
    stOk := stOk + stEcuId + ';';
    stOk := stOk + '' + ';';    //ī�帮��
    stOk := stOk + '' + ';';    //����ȣ
    if stEcuId = copy(stMessage,1,2) then
    begin
      stOk := stOk + 'OK' + ';';
      stOk := stOk + 'VER: ' + copy(stMessage,3,(Length(stMessage) - 2)) + ';';
      LMDListBox2.Items.Add(stOk);
    end
    else
    begin
      stFail := stOk;
      stOk := stOk + 'Fail' + '; ;';  //��Ż���
      stFail := stFail + 'ECU_ID ����ġ;';
      LMDListBox2.Items.Add(stOk);
      LMDListBox1.Items.Add(stFail);
    end;
  end
  else
  begin
    stOk := inttostr(nSeq) + ';';
    if stEcuId = '00' then stOk := stOk + 'MCU üũ' + ';'
    else stOk := stOk + 'ECU üũ' + ';';
    stOk := stOk + stEcuId + ';';
    stOk := stOk + '' + ';';    //ī�帮��
    stOk := stOk + '' + ';';    //����ȣ
    stFail := stOk;
    stOk := stOk + 'Fail' + '; ;';  //��Ż���
    stFail := stFail + '����ð��ʰ�;';
    LMDListBox2.Items.Add(stOk);
    LMDListBox1.Items.Add(stFail);
  end;


end;

Function TfmTotalComCheck.ReaderCheck(stEcuId: string):Boolean;
var
  aDeviceID : string;
  nTime : integer;
  stOk : string;
  stFail : string;
  nLoop : integer;
  bResult:boolean;
begin
  aDeviceID := DeviceID + stEcuId;
  stMessage := '';

  for nLoop := 0 to LoopCount - 1 do
  begin
    bResult := Form_Main.CheckReaderCommState(aDeviceID);
    if Not bConnected then exit;
    if bResult then break;
  end;
  if not bResult then
  begin
    nSeq := nSeq + 1;
    stOK := inttostr(nSeq) + ';' ;     //����
    stOK := stOK + 'READER üũ' + ';' ;  //����
    stOK := stOK + stEcuId + ';';         //ECU��ȣ
    stOK := stOK + '' + ';';           //ī�帮����ȣ
    stOK := stOK + '' + ';';           //����ǥ�ñ�
    stOK := stOK + 'Fail' + ';' ;      //��Ż���
    stOK := stOK + '����ð��ʰ�' + ';' ; //���
    LMDListBox2.Items.Add(stOk);
    Exit;
  end;
  for nLoop := 4 to 11 do     //������� 8�� ���� ������ ����
  begin
    if stMessage[nLoop] = '0' then
    begin
      nSeq := nSeq + 1;
      stOK := inttostr(nSeq) + ';' ;     //����
      stOK := stOK + 'READER üũ' + ';' ;  //����
      stOK := stOK + stEcuId + ';';         //ECU��ȣ
      stOK := stOK + inttostr(nLoop - 3) + ';';  //ī�帮����ȣ
      stOK := stOK + '' + ';';               //����ǥ�ñ�
      stOK := stOK + 'Fail' + ';' ;          //��Ż���
      stOK := stOK + '����̻�' + ';' ;      //���
      LMDListBox2.Items.Add(stOk);

    end else if stMessage[nLoop] = '1' then
    begin
      nSeq := nSeq + 1;
      stOK := inttostr(nSeq) + ';' ;     //����
      stOK := stOK + 'READER üũ' + ';' ;  //����
      stOK := stOK + stEcuId + ';';         //ECU��ȣ
      stOK := stOK + inttostr(nLoop -3) + ';';  //ī�帮����ȣ
      stOK := stOK + '' + ';';               //����ǥ�ñ�
      stOK := stOK + 'OK' + ';' ;        //��Ż���
      stOK := stOK + '' + ';' ; //���
      LMDListBox2.Items.Add(stOk);

    end;
  end;
  //���⿡�� ������ ǥ������
  result := True;



 {

  bReaderCOMCheck := False;
  Form_Main.SendPacket(aDeviceID,'R','CV'+aNo,True);

  nTime := 0;
  While Not bReaderVERCheck do
  begin
    if nTime > ComCheckDelayTime then break;
    Application.ProcessMessages;
    sleep(1);
    nTime := nTime + 1;
  end;

  nSeq := nSeq + 1;
  if bReaderVERCheck then
  begin
    stOk := inttostr(nSeq) + ';';
    stOk := stOk + 'READER üũ' + ';';
    stOk := stOk + stEcuId + ';';
    stOk := stOk + aNo + ';';    //ī�帮��
    stOk := stOk + '' + ';';    //����ȣ
    if stEcuId = copy(stMessage,1,2) then
    begin
      stOk := stOk + 'OK' + ';';
      stOk := stOk + 'Reader VER: ' + copy(stMessage,3,(Length(stMessage) - 2)) + ';';
      LMDListBox2.Items.Add(stOk);
    end
    else
    begin
      stFail := stOk;
      stOk := stOk + 'Fail' + '; ;';  //��Ż���
      stFail := stFail + 'ECU_ID ����ġ;';
      LMDListBox2.Items.Add(stOk);
      LMDListBox1.Items.Add(stFail);
    end;
  end
  else
  begin
    stOk := inttostr(nSeq) + ';';
    stOk := stOk + 'READER üũ' + ';';
    stOk := stOk + stEcuId + ';';
    stOk := stOk + aNo + ';';    //ī�帮��
    stOk := stOk + '' + ';';    //����ȣ
    stFail := stOk;
    stOk := stOk + 'Fail' + '; ;';  //��Ż���
    stFail := stFail + '����ð��ʰ�;';
    LMDListBox2.Items.Add(stOk);
    LMDListBox1.Items.Add(stFail);
  end; }

end;

procedure TfmTotalComCheck.DoorCheck(stEcuId: string; nDoorNo: integer);
var
  aDeviceID : string;
  nTime : integer;
  stOk : string;
  stFail : string;
  aNo : string;
begin
  //aNo:= '0'+InttoStr(nDoorNo);
  aDeviceID := DeviceID + stEcuId;
  stMessage := '';
  Form_Main.CheckSysInfo2(aDeviceID,nDoorNo);

  nSeq := nSeq + 1;
  if bSysInfo2Check then
  begin
    stOk := inttostr(nSeq) + ';';
    stOk := stOk + 'Door üũ' + ';';
    stOk := stOk + stEcuId + ';';
    stOk := stOk + '' + ';';    //ī�帮��
    stOk := stOk + inttostr(nDoorNo) + ';';    //����ȣ
    if stEcuId = copy(stMessage,1,2) then
    begin
      stOk := stOk + 'OK' + ';';
      stOk := stOk + copy(stMessage,4,(Length(stMessage) - 2)) + ';';
      LMDListBox2.Items.Add(stOk);
    end
    else
    begin
      stFail := stOk;
      stOk := stOk + 'Fail' + '; ;';  //��Ż���
      stFail := stFail + 'ECU_ID ����ġ;';
      LMDListBox2.Items.Add(stOk);
      LMDListBox1.Items.Add(stFail);
    end;
  end
  else
  begin
    stOk := inttostr(nSeq) + ';';
    stOk := stOk + 'Door üũ' + ';';
    stOk := stOk + stEcuId + ';';
    stOk := stOk + '' + ';';    //ī�帮��
    stOk := stOk + inttostr(nDoorNo) + ';';    //����ȣ
    stFail := stOk;
    stOk := stOk + 'Fail' + '; ;';  //��Ż���
    stFail := stFail + '����ð��ʰ�;';
    LMDListBox2.Items.Add(stOk);
    LMDListBox1.Items.Add(stFail);
  end;
end;

Function TfmTotalComCheck.ECUComCheck:Boolean;
var
  bResult : Boolean;
  nLoop : integer;
  stOK : string;
  aDeviceID : string;
begin
  result := False;
  stMessage := '';
  DeviceList.Clear;
  aDeviceID := DeviceID + '00';
  for nLoop := 0 to LoopCount - 1 do
  begin
    bResult := Form_Main.CheckECUCommState(aDeviceID);
    if Not bConnected then Exit;
    if bResult then break;
  end;
  if not bResult then
  begin
    nSeq := nSeq + 1;
    stOK := inttostr(nSeq) + ';' ;     //����
    stOK := stOK + 'MCU üũ' + ';' ;  //����
    stOK := stOK + '00' + ';';         //ECU��ȣ
    stOK := stOK + '' + ';';           //ī�帮����ȣ
    stOK := stOK + '' + ';';           //����ǥ�ñ�
    stOK := stOK + 'Fail' + ';' ;      //��Ż���
    stOK := stOK + '����ð��ʰ�' + ';' ; //���
    LMDListBox2.Items.Add(stOk);
    Exit;
  end;
  for nLoop := 3 to Length(stMessage) -1 do
  begin
    if stMessage[nLoop] = '0' then
    begin
      nSeq := nSeq + 1;
      DeviceList.Add(inttostr(nLoop-3));
      stOK := inttostr(nSeq) + ';' ;     //����
      stOK := stOK + 'ECU üũ' + ';' ;  //����
      if nLoop < 10 then stOK := stOK + '0' + inttostr(nLoop - 3) + ';'
      else stOK := stOK + inttostr(nLoop - 3) + ';';         //ECU��ȣ
      stOK := stOK + '' + ';';           //ī�帮����ȣ
      stOK := stOK + '' + ';';           //����ǥ�ñ�
      stOK := stOK + 'Fail' + ';' ;      //��Ż���
      stOK := stOK + '����̻�' + ';' ; //���
      LMDListBox2.Items.Add(stOk);
    end else if stMessage[nLoop] = '1' then
    begin
      nSeq := nSeq + 1;
      DeviceList.Add(inttostr(nLoop-3));
      stOK := inttostr(nSeq) + ';' ;     //����
      stOK := stOK + 'ECU üũ' + ';' ;  //����
      if nLoop < 10 then stOK := stOK + '0' + inttostr(nLoop - 3) + ';'
      else stOK := stOK + inttostr(nLoop - 3) + ';';         //ECU��ȣ
      stOK := stOK + '' + ';';           //ī�帮����ȣ
      stOK := stOK + '' + ';';           //����ǥ�ñ�
      stOK := stOK + 'OK' + ';' ;        //��Ż���
      stOK := stOK + '' + ';' ; //���
      LMDListBox2.Items.Add(stOk);
    end;
  end;
  //���⿡�� ������ ǥ������
  result := True;
end;

procedure TfmTotalComCheck.LMDListBox2GetLineSettings(Sender: TObject;
  Index: Integer; State: TOwnerDrawState; var bColor: TColor;
  aFont: TFont);
var
  st: string;
begin
  st:= LMDListBox2.ItemPart(Index,5);
  if st = 'Fail' then
  begin
    bColor:= $00E2EDFA;
//    aFont.Color:= clBlack;
    aFont.Color:= clRed;
  end;

end;

function TfmTotalComCheck.IndicatorCheck(stEcuID: string): Boolean;
var
  aDeviceID : string;
  stOk : string;
  nLoop : integer;
  bResult:boolean;
begin
  aDeviceID := DeviceID + stEcuId;
  stMessage := '';

  for nLoop := 0 to LoopCount - 1 do
  begin
    bResult := Form_Main.CheckIndicatorCommState(aDeviceID);
    if Not bConnected then exit;
    if bResult then break;
  end;
  if not bResult then
  begin
    nSeq := nSeq + 1;
    stOK := inttostr(nSeq) + ';' ;     //����
    stOK := stOK + '��Ȳǥ�� üũ' + ';' ;  //����
    stOK := stOK + stEcuId + ';';         //ECU��ȣ
    stOK := stOK + '' + ';';           //ī�帮����ȣ
    stOK := stOK + '' + ';';           //����ǥ�ñ�
    stOK := stOK + 'Fail' + ';' ;      //��Ż���
    stOK := stOK + '����ð��ʰ�' + ';' ; //���
    LMDListBox2.Items.Add(stOk);
    Exit;
  end;
  for nLoop := 3 to 7 do     //ǥ�ñ�� 4�� ���� ������ ����
  begin
    if stMessage[nLoop] = '0' then
    begin
      nSeq := nSeq + 1;
      stOK := inttostr(nSeq) + ';' ;     //����
      stOK := stOK + '��Ȳǥ�� üũ' + ';' ;  //����
      stOK := stOK + stEcuId + ';';         //ECU��ȣ
      stOK := stOK + '' + ';';                    //ī�帮����ȣ
      stOK := stOK + inttostr(nLoop - 3) + ';';  //����ǥ�ñ�
      stOK := stOK + 'Fail' + ';' ;          //��Ż���
      stOK := stOK + '����̻�' + ';' ;      //���
      LMDListBox2.Items.Add(stOk);

    end else if stMessage[nLoop] = '1' then
    begin
      nSeq := nSeq + 1;
      stOK := inttostr(nSeq) + ';' ;     //����
      stOK := stOK + '��Ȳǥ�� üũ' + ';' ;  //����
      stOK := stOK + stEcuId + ';';         //ECU��ȣ
      stOK := stOK + '' + ';';               //ī�帮����ȣ
      stOK := stOK + inttostr(nLoop - 3) + ';';  //����ǥ�ñ�
      stOK := stOK + 'OK' + ';' ;        //��Ż���
      stOK := stOK + '' + ';' ; //���
      LMDListBox2.Items.Add(stOk);

    end;
  end;

  result := True;

end;

procedure TfmTotalComCheck.FormActivate(Sender: TObject);
begin
  btnComCheckClick(Self);
end;

end.
