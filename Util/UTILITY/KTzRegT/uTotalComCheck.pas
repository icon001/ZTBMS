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
    nSeq : integer; //순번
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
      ReaderCheck(stEcuId);   //리더기 체크
      IndicatorCheck(stEcuID); //상황표시기 체크
    end;
  end else
  begin
    stEcuId := copy(ComboBox_ECU.text,1,2);
    if Length(stEcuId) = 1 then stEcuId := '0' + stEcuId;
    ReaderCheck(stEcuId);   //리더기 체크
    IndicatorCheck(stEcuID); //상황표시기 체크
  end;
{
  with Form_Main.TB_DEVICE do
  begin
    if ComboBox_ECU.ItemIndex = 0 then   //전체 통신체크이면 모두 찾아서 루프를 돌면서 체크
    begin
      First;
      while Not Eof do
      begin
        stEcuId := FindField('EUC_ID').AsString;
        ReaderCheck(stEcuId);   //리더기 체크
        IndicatorCheck(stEcuID); //상황표시기 체크
        next;
      end;
    end
    else
    begin
      if FindKey([copy(ComboBox_ECU.text,1,2)]) then
      begin
        stEcuId := FindField('EUC_ID').AsString;
        ReaderCheck(stEcuId);   //확장기 체크
        IndicatorCheck(stEcuID); //상황표시기 체크
      end
      else  showmessage(copy(ComboBox_ECU.text,1,2) + '의 확장기 정보를 찾을 수 없습니다.');
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
//확장기 버젼 체크
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
    stOK := inttostr(nSeq) + ';' ;     //순번
    stOK := stOK + 'READER 체크' + ';' ;  //구분
    stOK := stOK + stEcuId + ';';         //ECU번호
    stOK := stOK + '' + ';';           //카드리더번호
    stOK := stOK + '' + ';';           //상태표시기
    stOK := stOK + 'Fail' + ';' ;      //통신상태
    stOK := stOK + '응답시간초과' + ';' ; //비고
    LMDListBox2.Items.Add(stOk);
    Exit;
  end;
  for nLoop := 4 to 11 do     //리더기는 8개 까지 있을수 있음
  begin
    if stMessage[nLoop] = '0' then
    begin
      nSeq := nSeq + 1;
      stOK := inttostr(nSeq) + ';' ;     //순번
      stOK := stOK + 'READER 체크' + ';' ;  //구분
      stOK := stOK + stEcuId + ';';         //ECU번호
      stOK := stOK + inttostr(nLoop - 3) + ';';  //카드리더번호
      stOK := stOK + '' + ';';               //상태표시기
      stOK := stOK + 'Fail' + ';' ;          //통신상태
      stOK := stOK + '통신이상' + ';' ;      //비고
      LMDListBox2.Items.Add(stOk);

    end else if stMessage[nLoop] = '1' then
    begin
      nSeq := nSeq + 1;
      stOK := inttostr(nSeq) + ';' ;     //순번
      stOK := stOK + 'READER 체크' + ';' ;  //구분
      stOK := stOK + stEcuId + ';';         //ECU번호
      stOK := stOK + inttostr(nLoop -3) + ';';  //카드리더번호
      stOK := stOK + '' + ';';               //상태표시기
      stOK := stOK + 'OK' + ';' ;        //통신상태
      stOK := stOK + '' + ';' ; //비고
      LMDListBox2.Items.Add(stOk);

    end;
  end;
  //여기에서 데이터 표현하자
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
    stOK := inttostr(nSeq) + ';' ;     //순번
    stOK := stOK + 'MCU 체크' + ';' ;  //구분
    stOK := stOK + '00' + ';';         //ECU번호
    stOK := stOK + '' + ';';           //카드리더번호
    stOK := stOK + '' + ';';           //상태표시기
    stOK := stOK + 'Fail' + ';' ;      //통신상태
    stOK := stOK + '응답시간초과' + ';' ; //비고
    LMDListBox2.Items.Add(stOk);
    Exit;
  end;
  for nLoop := 3 to Length(stMessage) -1 do
  begin
    if stMessage[nLoop] = '0' then
    begin
      nSeq := nSeq + 1;
      DeviceList.Add(inttostr(nLoop-3));
      stOK := inttostr(nSeq) + ';' ;     //순번
      stOK := stOK + 'ECU 체크' + ';' ;  //구분
      if nLoop < 10 then stOK := stOK + '0' + inttostr(nLoop - 3) + ';'
      else stOK := stOK + inttostr(nLoop - 3) + ';';         //ECU번호
      stOK := stOK + '' + ';';           //카드리더번호
      stOK := stOK + '' + ';';           //상태표시기
      stOK := stOK + 'Fail' + ';' ;      //통신상태
      stOK := stOK + '통신이상' + ';' ; //비고
      LMDListBox2.Items.Add(stOk);
    end else if stMessage[nLoop] = '1' then
    begin
      nSeq := nSeq + 1;
      DeviceList.Add(inttostr(nLoop-3));
      stOK := inttostr(nSeq) + ';' ;     //순번
      stOK := stOK + 'ECU 체크' + ';' ;  //구분
      if nLoop < 10 then stOK := stOK + '0' + inttostr(nLoop - 3) + ';'
      else stOK := stOK + inttostr(nLoop - 3) + ';';         //ECU번호
      stOK := stOK + '' + ';';           //카드리더번호
      stOK := stOK + '' + ';';           //상태표시기
      stOK := stOK + 'OK' + ';' ;        //통신상태
      stOK := stOK + '' + ';' ; //비고
      LMDListBox2.Items.Add(stOk);
    end;
  end;
  //여기에서 데이터 표현하자
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
    stOK := inttostr(nSeq) + ';' ;     //순번
    stOK := stOK + '상황표시 체크' + ';' ;  //구분
    stOK := stOK + stEcuId + ';';         //ECU번호
    stOK := stOK + '' + ';';           //카드리더번호
    stOK := stOK + '' + ';';           //상태표시기
    stOK := stOK + 'Fail' + ';' ;      //통신상태
    stOK := stOK + '응답시간초과' + ';' ; //비고
    LMDListBox2.Items.Add(stOk);
    Exit;
  end;
  for nLoop := 3 to 7 do     //표시기는 4개 까지 있을수 있음
  begin
    if stMessage[nLoop] = '0' then
    begin
      nSeq := nSeq + 1;
      stOK := inttostr(nSeq) + ';' ;     //순번
      stOK := stOK + '상황표시 체크' + ';' ;  //구분
      stOK := stOK + stEcuId + ';';         //ECU번호
      stOK := stOK + '' + ';';                    //카드리더번호
      stOK := stOK + inttostr(nLoop - 3) + ';';  //상태표시기
      stOK := stOK + 'Fail' + ';' ;          //통신상태
      stOK := stOK + '통신이상' + ';' ;      //비고
      LMDListBox2.Items.Add(stOk);

    end else if stMessage[nLoop] = '1' then
    begin
      nSeq := nSeq + 1;
      stOK := inttostr(nSeq) + ';' ;     //순번
      stOK := stOK + '상황표시 체크' + ';' ;  //구분
      stOK := stOK + stEcuId + ';';         //ECU번호
      stOK := stOK + '' + ';';               //카드리더번호
      stOK := stOK + inttostr(nLoop - 3) + ';';  //상태표시기
      stOK := stOK + 'OK' + ';' ;        //통신상태
      stOK := stOK + '' + ';' ; //비고
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
