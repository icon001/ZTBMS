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
    btn_Stop: TRzBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
    procedure btnComCheckClick(Sender: TObject);
    procedure LMDListBox2GetLineSettings(Sender: TObject; Index: Integer;
      State: TOwnerDrawState; var bColor: TColor; aFont: TFont);
    procedure FormActivate(Sender: TObject);
    procedure btn_StopClick(Sender: TObject);
  private
    bStop : Boolean;
    { Private declarations }
    Function ECUCheck(stEcuId:string) :Boolean;
    Function ReaderCheck(stEcuId,aNo:string) :Boolean;
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
  uNewMain,
  uLomosUtil,
  uPCommon;
{$R *.dfm}

procedure TfmTotalComCheck.FormShow(Sender: TObject);
var
  i : integer;
begin
  DeviceList := TStringList.Create;
  ComboBox_ECU.Clear;
  ComboBox_ECU.Add('99.��ü');
  ComboBox_ECU.Add('00.����');
  with fmMain.TB_DEVICE do
  begin
    First;
    While Not Eof do
    begin
      if FindField('ECU_ID').AsString <> '00' then
        ComboBox_ECU.Add(FindField('ECU_ID').AsString + '.ECU');
      Next;
    end;
  end;

{
  ComboBox_ECU.Clear;
  for i := 0 to ECUList.Count - 1 do
  begin
    ComboBox_ECU.Add(ECUList.Strings[i]);
  end;   }
  ComboBox_ECU.ItemIndex := ItemIndex;
  fmMain.bTotalComCheckShow := True;
  nSeq := 0;
end;

procedure TfmTotalComCheck.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  fmMain.bTotalComCheckShow := False;
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
  nReaderNo : integer;
  stPreEcu : string;
begin
  btnComCheck.Enabled := False;
  bStop := False;
  btn_Stop.Enabled := True;
  nSeq := 0;
  LMDListBox2.Clear;
  LMDListBox1.Clear;
  stPreEcu := '';
{
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
  end;}
  if ComboBox_ECU.ItemIndex = 0 then
  begin
    with fmMain.TB_DEVICE do
    begin
      First;
      while Not Eof do
      begin
        stEcuId := FindField('ECU_ID').AsString;
        if stPreEcu <> stEcuId then
          bResult := ECUCheck(stEcuID)
        else bResult := False;
        stPreEcu := stEcuId;
        if bStop then Exit;
        if bResult then
        begin
          for nReaderNo := 1 to 8 do
          begin
            if bStop then Exit;
            fmMain.CheckCardReader(DeviceID + stEcuId, nReaderNo);
            //if fmMain.CheckCardReader(DeviceID + stEcuId, nReaderNo) then
            //begin
              if FindField('READER'+ inttostr(nReaderNo) + '_USE').AsString = '���' then
                ReaderCheck(stEcuId,FillZeroNumber(nReaderNo, 2));   //������ üũ
            //end;
          end;
          //IndicatorCheck(stEcuID); //��Ȳǥ�ñ� üũ
        end;
        Next;
      end;
    end; //with
  end else
  begin
    stEcuId := copy(ComboBox_ECU.text,1,2);
    if Length(stEcuId) = 1 then stEcuId := '0' + stEcuId;
    bResult := ECUCheck(stEcuID);
    if bResult then
    begin
      for nReaderNo := 1 to 8 do
      begin
        if bStop then Exit;
        if fmMain.CheckCardReader(DeviceID + stEcuId, nReaderNo) then
        begin
          with fmMain.TB_DEVICE do
          begin
            if FindKey([stEcuId]) then
            begin
              if FindField('READER'+ inttostr(nReaderNo) + '_USE').AsString = '���' then
                ReaderCheck(stEcuId,FillZeroNumber(nReaderNo, 2));   //������ üũ
            end;
          end;
          //IndicatorCheck(stEcuID); //��Ȳǥ�ñ� üũ
        end;
      end;
    end;
  end;
{
  with fmMain.TB_DEVICE do
  begin
    if ComboBox_ECU.ItemIndex = 0 then   //��ü ���üũ�̸� ��� ã�Ƽ� ������ ���鼭 üũ
    begin
      First;
      while Not Eof do
      begin
        stEcuId := FindField('ECU_ID').AsString;
        ReaderCheck(stEcuId);   //������ üũ
        IndicatorCheck(stEcuID); //��Ȳǥ�ñ� üũ
        next;
      end;
    end
    else
    begin
      if FindKey([copy(ComboBox_ECU.text,1,2)]) then
      begin
        stEcuId := FindField('ECU_ID').AsString;
        ReaderCheck(stEcuId);   //Ȯ��� üũ
        IndicatorCheck(stEcuID); //��Ȳǥ�ñ� üũ
      end
      else  showmessage(copy(ComboBox_ECU.text,1,2) + '�� Ȯ��� ������ ã�� �� �����ϴ�.');
    end;
  end; //with end   }
  btnComCheck.Enabled := True;
  btn_Stop.Enabled := False;

end;

Function TfmTotalComCheck.ECUCheck(stEcuId: string):Boolean;
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
  result := fmMain.CheckVersion(aDeviceID);
{  fmMain.SendPacket(aDeviceID,'R','VR00',True);

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
  if result then
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
//    stFail := stFail + '����ð��ʰ�;';
    stFail := stFail + ' ;';
    LMDListBox2.Items.Add(stOk);
    LMDListBox1.Items.Add(stFail);
  end;
  LMDListBox2.ItemIndex := LMDListBox2.Items.Count;


end;

Function TfmTotalComCheck.ReaderCheck(stEcuId,aNo: string):Boolean;
var
  aDeviceID : string;
  nTime : integer;
  stOk : string;
  stFail : string;
  nLoop : integer;
  bResult:boolean;
begin
  aDeviceID := DeviceID + stEcuId;
{  stMessage := '';

  for nLoop := 0 to LoopCount - 1 do
  begin
    bResult := fmMain.CheckReaderCommState(aDeviceID);
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
}




  bReaderVERCheck := False;
  fmMain.SendPacket(aDeviceID,'R','CV'+aNo,True);

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
//      stFail := stFail + 'ECU_ID ����ġ;';
      stFail := stFail + ' ;';
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
//    stFail := stFail + '����ð��ʰ�;';
    stFail := stFail + ' ;';
    LMDListBox2.Items.Add(stOk);
    LMDListBox1.Items.Add(stFail);
  end;
  LMDListBox2.ItemIndex := LMDListBox2.Items.Count;

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
  fmMain.CheckSysInfo2(aDeviceID,nDoorNo);

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
//    stFail := stFail + '����ð��ʰ�;';
    stFail := stFail + ' ;';
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
    bResult := fmMain.CheckECUCommState(aDeviceID);
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
//    stOK := stOK + '����ð��ʰ�' + ';' ; //���
    stOK := stOK + ' ' + ';' ; //���
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
    bResult := fmMain.CheckIndicatorCommState(aDeviceID);
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
//    stOK := stOK + '����ð��ʰ�' + ';' ; //���
    stOK := stOK + ' ' + ';' ; //���
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
  bStop := False;
//  btnComCheckClick(Self);
end;

procedure TfmTotalComCheck.btn_StopClick(Sender: TObject);
begin
  btnComCheck.Enabled := True;
  btn_Stop.Enabled := False;
  bStop := True;
end;

end.
