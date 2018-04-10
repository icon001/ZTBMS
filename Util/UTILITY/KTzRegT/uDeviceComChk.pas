unit uDeviceComChk;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, LMDCustomScrollBox, LMDListBox, RzButton, StdCtrls, RzCmboBx;

type
  TfmDeviceComChk = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    ComboBox_Device: TRzComboBox;
    btnComCheck: TRzBitBtn;
    btnClose: TRzBitBtn;
    GroupBox2: TGroupBox;
    LMDListBox2: TLMDListBox;
    GroupBox3: TGroupBox;
    LMDListBox1: TLMDListBox;
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnComCheckClick(Sender: TObject);
  private
    { Private declarations }
    procedure ECUCheck(stEcuId:string);
    procedure ReaderCheck(stEcuId:string;nReaderNo:integer);
    procedure DoorCheck(stEcuId:string;nDoorNo:integer);
  public
    { Public declarations }
    DeviceID : string;
    stMessage : string;
    nSeq : integer; //����
  end;

var
  fmDeviceComChk: TfmDeviceComChk;

implementation
uses
  uMain;
  
{$R *.dfm}

procedure TfmDeviceComChk.FormShow(Sender: TObject);
begin
  ComboBox_Device.Clear;
  ComboBox_Device.Add('01.ECU üũ');
  ComboBox_Device.Add('02.Reader ��� üũ');
  ComboBox_Device.Add('03.Door ���� üũ');
  ComboBox_Device.ItemIndex := 0;
  Form_Main.bDeviceComCheckShow := True;
  nSeq := 0;

end;

procedure TfmDeviceComChk.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmDeviceComChk.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Form_Main.bDeviceComCheckShow := False;
end;

procedure TfmDeviceComChk.DoorCheck(stEcuId: string; nDoorNo: integer);
var
  aDeviceID : string;
  stOk : string;
  stFail : string;
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

procedure TfmDeviceComChk.ECUCheck(stEcuId: string);
var
  aDeviceID : string;
  nTime : integer;
  stOk : string;
  stFail : string;
begin
//Ȯ��� ���� üũ
  aDeviceID := DeviceID + stEcuId;
  stMessage := '';
  bVERCheck := False;
  Form_Main.SendPacket(aDeviceID,'R','VR00',True);

  nTime := 0;
  While Not bVERCheck do
  begin
    if nTime > ComCheckDelayTime then break;
    Application.ProcessMessages;
    sleep(1);
    nTime := nTime + 1;
  end;

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

procedure TfmDeviceComChk.ReaderCheck(stEcuId: string; nReaderNo: integer);
var
  aDeviceID : string;
  nTime : integer;
  stOk : string;
  stFail : string;
  aNo : string;
begin
  aNo:= '0'+InttoStr(nReaderNo);
  aDeviceID := DeviceID + stEcuId;
  bReaderVERCheck := False;
  stMessage := '';
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
  end;

end;

procedure TfmDeviceComChk.btnComCheckClick(Sender: TObject);
var
  stEcuID : string;
begin
  LMDListBox1.Clear;
  LMDListBox2.Clear;
  nSeq := 0;
  
  with Form_Main.TB_DEVICE do
  begin
    First;
    while Not Eof do
    begin
      stEcuId := FindField('EUC_ID').AsString;
      if ComboBox_Device.ItemIndex = 0 then //ECU üũ
      begin
        ECUCheck(stEcuId);
      end else if ComboBox_Device.ItemIndex = 1 then //Reader üũ
      begin
          if FindField('READER1_USE').AsString = '1' then ReaderCheck(stEcuId,1);
          if FindField('READER2_USE').AsString = '1' then ReaderCheck(stEcuId,2);
          if FindField('READER3_USE').AsString = '1' then ReaderCheck(stEcuId,3);
          if FindField('READER4_USE').AsString = '1' then ReaderCheck(stEcuId,4);
          if FindField('READER5_USE').AsString = '1' then ReaderCheck(stEcuId,5);
          if FindField('READER6_USE').AsString = '1' then ReaderCheck(stEcuId,6);
          if FindField('READER7_USE').AsString = '1' then ReaderCheck(stEcuId,7);
          if FindField('READER8_USE').AsString = '1' then ReaderCheck(stEcuId,8);
      end else //Door üũ
      begin
          DoorCheck(stEcuId,1); //Door1 ���� Ȯ��
          DoorCheck(stEcuId,2); //Door2 ���� Ȯ��
      end;

      Next;
    end; //while
  end; //with
end;

end.
