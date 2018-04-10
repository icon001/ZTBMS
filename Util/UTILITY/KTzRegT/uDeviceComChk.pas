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
    nSeq : integer; //순번
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
  ComboBox_Device.Add('01.ECU 체크');
  ComboBox_Device.Add('02.Reader 통신 체크');
  ComboBox_Device.Add('03.Door 상태 체크');
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
    stOk := stOk + 'Door 체크' + ';';
    stOk := stOk + stEcuId + ';';
    stOk := stOk + '' + ';';    //카드리더
    stOk := stOk + inttostr(nDoorNo) + ';';    //문번호
    if stEcuId = copy(stMessage,1,2) then
    begin
      stOk := stOk + 'OK' + ';';
      stOk := stOk + copy(stMessage,4,(Length(stMessage) - 2)) + ';';
      LMDListBox2.Items.Add(stOk);
    end
    else
    begin
      stFail := stOk;
      stOk := stOk + 'Fail' + '; ;';  //통신상태
      stFail := stFail + 'ECU_ID 불일치;';
      LMDListBox2.Items.Add(stOk);
      LMDListBox1.Items.Add(stFail);
    end;
  end
  else
  begin
    stOk := inttostr(nSeq) + ';';
    stOk := stOk + 'Door 체크' + ';';
    stOk := stOk + stEcuId + ';';
    stOk := stOk + '' + ';';    //카드리더
    stOk := stOk + inttostr(nDoorNo) + ';';    //문번호
    stFail := stOk;
    stOk := stOk + 'Fail' + '; ;';  //통신상태
    stFail := stFail + '응답시간초과;';
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
//확장기 버젼 체크
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
    if stEcuId = '00' then stOk := stOk + 'MCU 체크' + ';'
    else stOk := stOk + 'ECU 체크' + ';';
    stOk := stOk + stEcuId + ';';
    stOk := stOk + '' + ';';    //카드리더
    stOk := stOk + '' + ';';    //문번호
    if stEcuId = copy(stMessage,1,2) then
    begin
      stOk := stOk + 'OK' + ';';
      stOk := stOk + 'VER: ' + copy(stMessage,3,(Length(stMessage) - 2)) + ';';
      LMDListBox2.Items.Add(stOk);
    end
    else
    begin
      stFail := stOk;
      stOk := stOk + 'Fail' + '; ;';  //통신상태
      stFail := stFail + 'ECU_ID 불일치;';
      LMDListBox2.Items.Add(stOk);
      LMDListBox1.Items.Add(stFail);
    end;
  end
  else
  begin
    stOk := inttostr(nSeq) + ';';
    if stEcuId = '00' then stOk := stOk + 'MCU 체크' + ';'
    else stOk := stOk + 'ECU 체크' + ';';
    stOk := stOk + stEcuId + ';';
    stOk := stOk + '' + ';';    //카드리더
    stOk := stOk + '' + ';';    //문번호
    stFail := stOk;
    stOk := stOk + 'Fail' + '; ;';  //통신상태
    stFail := stFail + '응답시간초과;';
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
    stOk := stOk + 'READER 체크' + ';';
    stOk := stOk + stEcuId + ';';
    stOk := stOk + aNo + ';';    //카드리더
    stOk := stOk + '' + ';';    //문번호
    if stEcuId = copy(stMessage,1,2) then
    begin
      stOk := stOk + 'OK' + ';';
      stOk := stOk + 'Reader VER: ' + copy(stMessage,3,(Length(stMessage) - 2)) + ';';
      LMDListBox2.Items.Add(stOk);
    end
    else
    begin
      stFail := stOk;
      stOk := stOk + 'Fail' + '; ;';  //통신상태
      stFail := stFail + 'ECU_ID 불일치;';
      LMDListBox2.Items.Add(stOk);
      LMDListBox1.Items.Add(stFail);
    end;
  end
  else
  begin
    stOk := inttostr(nSeq) + ';';
    stOk := stOk + 'READER 체크' + ';';
    stOk := stOk + stEcuId + ';';
    stOk := stOk + aNo + ';';    //카드리더
    stOk := stOk + '' + ';';    //문번호
    stFail := stOk;
    stOk := stOk + 'Fail' + '; ;';  //통신상태
    stFail := stFail + '응답시간초과;';
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
      if ComboBox_Device.ItemIndex = 0 then //ECU 체크
      begin
        ECUCheck(stEcuId);
      end else if ComboBox_Device.ItemIndex = 1 then //Reader 체크
      begin
          if FindField('READER1_USE').AsString = '1' then ReaderCheck(stEcuId,1);
          if FindField('READER2_USE').AsString = '1' then ReaderCheck(stEcuId,2);
          if FindField('READER3_USE').AsString = '1' then ReaderCheck(stEcuId,3);
          if FindField('READER4_USE').AsString = '1' then ReaderCheck(stEcuId,4);
          if FindField('READER5_USE').AsString = '1' then ReaderCheck(stEcuId,5);
          if FindField('READER6_USE').AsString = '1' then ReaderCheck(stEcuId,6);
          if FindField('READER7_USE').AsString = '1' then ReaderCheck(stEcuId,7);
          if FindField('READER8_USE').AsString = '1' then ReaderCheck(stEcuId,8);
      end else //Door 체크
      begin
          DoorCheck(stEcuId,1); //Door1 상태 확인
          DoorCheck(stEcuId,2); //Door2 상태 확인
      end;

      Next;
    end; //while
  end; //with
end;

end.
