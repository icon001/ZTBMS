unit uCopy;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzButton, RzCmboBx;

type
  TfmCopy = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    ComboBox_OrgECU: TRzComboBox;
    ComboBox_CopyECU: TRzComboBox;
    btnSend: TRzBitBtn;
    btnCloase: TRzBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btnCloaseClick(Sender: TObject);
    procedure btnSendClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ECUID : string;
    ECUList : TStringList;
  end;

var
  fmCopy: TfmCopy;

implementation
uses
  uNewMain;

{$R *.dfm}

procedure TfmCopy.FormShow(Sender: TObject);
var
  i : integer;
  nIndex : integer;
begin
  ComboBox_CopyECU.Clear;
  ComboBox_OrgECU.Clear;
  with fmMain.TB_DEVICE do
  begin
    First;
    While Not Eof do
    begin
      if FindField('ECU_ID').AsString = '00' then
      begin
        ComboBox_OrgECU.Add(FindField('ECU_ID').AsString + '.메인');
        ComboBox_CopyECU.Add(FindField('ECU_ID').AsString + '.메인');
      end else
      begin
        ComboBox_OrgECU.Add(FindField('ECU_ID').AsString + '.ECU');
        ComboBox_CopyECU.Add(FindField('ECU_ID').AsString + '.ECU');
      end;
      Next;
    end;
  end;
{
  for i := 1 to ECUList.Count - 1 do
  begin
    ComboBox_OrgECU.Add(ECUList.Strings[i]);
    ComboBox_CopyECU.Add(ECUList.Strings[i]);
  end;  }
  nIndex := ECUList.IndexOf(ECUID + '.ECU');
  if nIndex > -1 then ComboBox_OrgECU.ItemIndex := nIndex - 1
  else ComboBox_OrgECU.ItemIndex := 0;
  ComboBox_CopyECU.ItemIndex := 0;

end;

procedure TfmCopy.btnCloaseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmCopy.btnSendClick(Sender: TObject);
var
  stECUNo : string;
  stDeviceID : string;
  stSYSTEM_ID : string;
  stLinkus_Tel : string;
  nRing_Cnt : integer;
  stMCU_IP : string;
  stMCU_SUBNET : string;
  stMCU_GATE : string;
  stMCU_PORT : string;
  stServer_IP : string;
  nMODE :integer;
  nWATCH_POWER :integer;
  nOUT_DELAY :integer;
  nIN_DELAY :integer;
  nDOOR_TYPE1 :integer;
  nDOOR_TYPE2 :integer;
  stLOCATE : string;
  nCARD_TYPE1 :integer;
  nCARD_TYPE2 :integer;
  nDOORMODE_TYPE1 :integer;
  nDOORMODE_TYPE2 :integer;
  nDOOR_OPEN1 :integer;
  nDOOR_OPEN2 :integer;
  nOPEN_MONI1 :integer;
  nOPEN_MONI2 :integer;
  nUSE_SCH1 :integer;
  nUSE_SCH2 :integer;
  nDOOR_STATUS1 :integer;
  nDOOR_STATUS2 :integer;
  nALARM_LONG1 :integer;
  nALARM_LONG2 :integer;
  nCONTROL_FIRE1 :integer;
  nCONTROL_FIRE2 :integer;
  nLOCK_TYPE1 :integer;
  nLOCK_TYPE2 :integer;
  stREADER1_USE : string;
  stREADER1_DOOR : string;
  stREADER1_NAME : string;
  stREADER2_USE : string;
  stREADER2_DOOR : string;
  stREADER2_NAME : string;
  stREADER3_USE : string;
  stREADER3_DOOR : string;
  stREADER3_NAME : string;
  stREADER4_USE : string;
  stREADER4_DOOR : string;
  stREADER4_NAME : string;
  stREADER5_USE : string;
  stREADER5_DOOR : string;
  stREADER5_NAME : string;
  stREADER6_USE : string;
  stREADER6_DOOR : string;
  stREADER6_NAME : string;
  stREADER7_USE  : string;
  stREADER7_DOOR : string;
  stREADER7_NAME : string;
  stREADER8_USE  : string;
  stREADER8_DOOR : string;
  stREADER8_NAME : string;
  stPORT1_TYPE : string;
  stPORT1_DELAY : string;
  stPORT1_SENS : string;
  stPORT1_NAME : string;
  stPORT2_TYPE : string;
  stPORT2_DELAY : string;
  stPORT2_SENS : string;
  stPORT2_NAME : string;
  stPORT3_TYPE : string;
  stPORT3_DELAY : string;
  stPORT3_SENS : string;
  stPORT3_NAME : string;
  stPORT4_TYPE : string;
  stPORT4_DELAY : string;
  stPORT4_SENS : string;
  stPORT4_NAME : string;
  stPORT5_TYPE : string;
  stPORT5_DELAY: string;
  stPORT5_SENS : string;
  stPORT5_NAME : string;
  stPORT6_TYPE : string;
  stPORT6_DELAY : string;
  stPORT6_SENS : string;
  stPORT6_NAME : string;
  stPORT7_TYPE : string;
  stPORT7_DELAY : string;
  stPORT7_SENS : string;
  stPORT7_NAME : string;
  stPORT8_TYPE : string;
  stPORT8_DELAY : string;
  stPORT8_SENS : string;
  stPORT8_NAME : string;
begin
  stECUNo := copy(ComboBox_OrgECU.Text,1,2);
  with fmMain.TB_DEVICE do
  begin
    if FindKey([stECUNo]) then
    begin
      stDeviceID := FindField('DEVICE_ID').AsString;
      stSYSTEM_ID := FindField('SYSTEM_ID').AsString;
      stLinkus_Tel := FindField('Linkus_Tel').AsString;
      nRing_Cnt := FindField('Ring_Cnt').AsInteger;
      stMCU_IP := FindField('MCU_IP').AsString;
      stMCU_SUBNET := FindField('MCU_SUBNET').AsString;
      stMCU_GATE := FindField('MCU_GATE').AsString;
      stMCU_PORT := FindField('MCU_PORT').AsString ;
      stServer_IP := FindField('Server_IP').AsString ;
      nMODE := FindField('MODE').AsInteger;
      nWATCH_POWER := FindField('WATCH_POWER').AsInteger;
      nOUT_DELAY := FindField('OUT_DELAY').AsInteger;
      nIN_DELAY := FindField('IN_DELAY').AsInteger;
      nDOOR_TYPE1 := FindField('DOOR_TYPE1').AsInteger;
      nDOOR_TYPE2 := FindField('DOOR_TYPE2').AsInteger;
      stLOCATE := FindField('LOCATE').AsString;
      nCARD_TYPE1 := FindField('CARD_TYPE1').AsInteger;
      nCARD_TYPE2 := FindField('CARD_TYPE2').AsInteger;
      nDOORMODE_TYPE1 := FindField('DOORMODE_TYPE1').AsInteger;
      nDOORMODE_TYPE2 := FindField('DOORMODE_TYPE2').AsInteger;
      nDOOR_OPEN1 := FindField('DOOR_OPEN1').AsInteger;
      nDOOR_OPEN2 := FindField('DOOR_OPEN2').AsInteger;
      nOPEN_MONI1 := FindField('OPEN_MONI1').AsInteger;
      nOPEN_MONI2 := FindField('OPEN_MONI2').AsInteger;
      nUSE_SCH1 := FindField('USE_SCH1').AsInteger;
      nUSE_SCH2 := FindField('USE_SCH2').AsInteger;
      nDOOR_STATUS1 := FindField('DOOR_STATUS1').AsInteger;
      nDOOR_STATUS2 := FindField('DOOR_STATUS2').AsInteger;
      nALARM_LONG1 := FindField('ALARM_LONG1').AsInteger;
      nALARM_LONG2 := FindField('ALARM_LONG2').AsInteger;
      nCONTROL_FIRE1 := FindField('CONTROL_FIRE1').AsInteger;
      nCONTROL_FIRE2 := FindField('CONTROL_FIRE2').AsInteger;
      nLOCK_TYPE1 := FindField('LOCK_TYPE1').AsInteger;
      nLOCK_TYPE2 := FindField('LOCK_TYPE2').AsInteger;
      stREADER1_USE := FindField('READER1_USE').AsString;
      stREADER1_DOOR := FindField('READER1_DOOR').AsString;
      stREADER1_NAME := FindField('READER1_NAME').AsString;
      stREADER2_USE := FindField('READER2_USE').AsString;
      stREADER2_DOOR := FindField('READER2_DOOR').AsString;
      stREADER2_NAME := FindField('READER2_NAME').AsString;
      stREADER3_USE := FindField('READER3_USE').AsString;
      stREADER3_DOOR := FindField('READER3_DOOR').AsString;
      stREADER3_NAME := FindField('READER3_NAME').AsString;
      stREADER4_USE := FindField('READER4_USE').AsString;
      stREADER4_DOOR := FindField('READER4_DOOR').AsString;
      stREADER4_NAME := FindField('READER4_NAME').AsString;
      stREADER5_USE := FindField('READER5_USE').AsString;
      stREADER5_DOOR := FindField('READER5_DOOR').AsString;
      stREADER5_NAME := FindField('READER5_NAME').AsString;
      stREADER6_USE := FindField('READER6_USE').AsString;
      stREADER6_DOOR := FindField('READER6_DOOR').AsString;
      stREADER6_NAME := FindField('READER6_NAME').AsString;
      stREADER7_USE  := FindField('READER7_USE').AsString;
      stREADER7_DOOR := FindField('READER7_DOOR').AsString;
      stREADER7_NAME := FindField('READER7_NAME').AsString;
      stREADER8_USE  := FindField('READER8_USE').AsString;
      stREADER8_DOOR := FindField('READER8_DOOR').AsString;
      stREADER8_NAME := FindField('READER8_NAME').AsString;
      stPORT1_TYPE := FindField('PORT1_TYPE').AsString;
      stPORT1_DELAY := FindField('PORT1_DELAY').AsString;
      stPORT1_SENS := FindField('PORT1_SENS').AsString;
      stPORT1_NAME := FindField('PORT1_NAME').AsString;
      stPORT2_TYPE := FindField('PORT2_TYPE').AsString;
      stPORT2_DELAY := FindField('PORT2_DELAY').AsString;
      stPORT2_SENS := FindField('PORT2_SENS').AsString;
      stPORT2_NAME := FindField('PORT2_NAME').AsString;
      stPORT3_TYPE := FindField('PORT3_TYPE').AsString;
      stPORT3_DELAY := FindField('PORT3_DELAY').AsString;
      stPORT3_SENS := FindField('PORT3_SENS').AsString;
      stPORT3_NAME := FindField('PORT3_NAME').AsString;
      stPORT4_TYPE := FindField('PORT4_TYPE').AsString;
      stPORT4_DELAY := FindField('PORT4_DELAY').AsString;
      stPORT4_SENS := FindField('PORT4_SENS').AsString;
      stPORT4_NAME := FindField('PORT4_NAME').AsString;
      stPORT5_TYPE := FindField('PORT5_TYPE').AsString;
      stPORT5_DELAY := FindField('PORT5_DELAY').AsString;
      stPORT5_SENS := FindField('PORT5_SENS').AsString;
      stPORT5_NAME := FindField('PORT5_NAME').AsString;
      stPORT6_TYPE := FindField('PORT6_TYPE').AsString;
      stPORT6_DELAY := FindField('PORT6_DELAY').AsString;
      stPORT6_SENS := FindField('PORT6_SENS').AsString;
      stPORT6_NAME := FindField('PORT6_NAME').AsString;
      stPORT7_TYPE := FindField('PORT7_TYPE').AsString;
      stPORT7_DELAY := FindField('PORT7_DELAY').AsString;
      stPORT7_SENS := FindField('PORT7_SENS').AsString;
      stPORT7_NAME := FindField('PORT7_NAME').AsString;
      stPORT8_TYPE := FindField('PORT8_TYPE').AsString;
      stPORT8_DELAY := FindField('PORT8_DELAY').AsString;
      stPORT8_SENS := FindField('PORT8_SENS').AsString;
      stPORT8_NAME := FindField('PORT8_NAME').AsString;
      
      stEcuNo := copy(ComboBox_CopyECU.text,1,2);
      if FindKey([stECUNo]) then
      begin
        Edit;
        FindField('DEVICE_ID').AsString := stDeviceID;
        FindField('SYSTEM_ID').AsString := stSYSTEM_ID ;
        FindField('Linkus_Tel').AsString := stLinkus_Tel ;
        FindField('Ring_Cnt').AsInteger := nRing_Cnt ;
        FindField('MCU_IP').AsString :=  stMCU_IP;
        FindField('MCU_SUBNET').AsString :=  stMCU_SUBNET ;
        FindField('MCU_GATE').AsString := stMCU_GATE;
        FindField('MCU_PORT').AsString := stMCU_PORT;
        FindField('Server_IP').AsString := stServer_IP;
        FindField('MODE').AsInteger:= nMODE;
        FindField('WATCH_POWER').AsInteger:= nWATCH_POWER;
        FindField('OUT_DELAY').AsInteger:= nOUT_DELAY;
        FindField('IN_DELAY').AsInteger:= nIN_DELAY;
        FindField('DOOR_TYPE1').AsInteger:= nDOOR_TYPE1;
        FindField('DOOR_TYPE2').AsInteger:= nDOOR_TYPE2;
        FindField('LOCATE').AsString:= stLOCATE;
        FindField('CARD_TYPE1').AsInteger:= nCARD_TYPE1;
        FindField('CARD_TYPE2').AsInteger:= nCARD_TYPE2;
        FindField('DOORMODE_TYPE1').AsInteger:= nDOORMODE_TYPE1;
        FindField('DOORMODE_TYPE2').AsInteger:= nDOORMODE_TYPE2;
        FindField('DOOR_OPEN1').AsInteger:= nDOOR_OPEN1;
        FindField('DOOR_OPEN2').AsInteger:= nDOOR_OPEN2;
        FindField('OPEN_MONI1').AsInteger:= nOPEN_MONI1;
        FindField('OPEN_MONI2').AsInteger:= nOPEN_MONI2;
        FindField('USE_SCH1').AsInteger:= nUSE_SCH1;
        FindField('USE_SCH2').AsInteger:= nUSE_SCH2;
        FindField('DOOR_STATUS1').AsInteger:= nDOOR_STATUS1;
        FindField('DOOR_STATUS2').AsInteger:= nDOOR_STATUS2;
        FindField('ALARM_LONG1').AsInteger:= nALARM_LONG1;
        FindField('ALARM_LONG2').AsInteger:= nALARM_LONG2;
        FindField('CONTROL_FIRE1').AsInteger:= nCONTROL_FIRE1;
        FindField('CONTROL_FIRE2').AsInteger:= nCONTROL_FIRE2;
        FindField('LOCK_TYPE1').AsInteger:= nLOCK_TYPE1;
        FindField('LOCK_TYPE2').AsInteger:= nLOCK_TYPE2;
        FindField('READER1_USE').AsString:= stREADER1_USE;
        FindField('READER1_DOOR').AsString:= stREADER1_DOOR;
        FindField('READER1_NAME').AsString:= stREADER1_NAME;
        FindField('READER2_USE').AsString:= stREADER2_USE;
        FindField('READER2_DOOR').AsString:= stREADER2_DOOR;
        FindField('READER2_NAME').AsString:= stREADER2_NAME;
        FindField('READER3_USE').AsString:= stREADER3_USE;
        FindField('READER3_DOOR').AsString:= stREADER3_DOOR;
        FindField('READER3_NAME').AsString:= stREADER3_NAME;
        FindField('READER4_USE').AsString:= stREADER4_USE;
        FindField('READER4_DOOR').AsString:= stREADER4_DOOR;
        FindField('READER4_NAME').AsString:= stREADER4_NAME;
        FindField('READER5_USE').AsString:= stREADER5_USE;
        FindField('READER5_DOOR').AsString:= stREADER5_DOOR;
        FindField('READER5_NAME').AsString:= stREADER5_NAME;
        FindField('READER6_USE').AsString:= stREADER6_USE;
        FindField('READER6_DOOR').AsString:= stREADER6_DOOR;
        FindField('READER6_NAME').AsString:= stREADER6_NAME;
        FindField('READER7_USE').AsString:= stREADER7_USE;
        FindField('READER7_DOOR').AsString:= stREADER7_DOOR;
        FindField('READER7_NAME').AsString:= stREADER7_NAME;
        FindField('READER8_USE').AsString:= stREADER8_USE;
        FindField('READER8_DOOR').AsString:= stREADER8_DOOR;
        FindField('READER8_NAME').AsString:= stREADER8_NAME;
        FindField('PORT1_TYPE').AsString:= stPORT1_TYPE;
        FindField('PORT1_DELAY').AsString:= stPORT1_DELAY;
        FindField('PORT1_SENS').AsString:= stPORT1_SENS;
        FindField('PORT1_NAME').AsString:= stPORT1_NAME;
        FindField('PORT2_TYPE').AsString:= stPORT2_TYPE;
        FindField('PORT2_DELAY').AsString:= stPORT2_DELAY;
        FindField('PORT2_SENS').AsString:= stPORT2_SENS;
        FindField('PORT2_NAME').AsString:= stPORT2_NAME;
        FindField('PORT3_TYPE').AsString:= stPORT3_TYPE;
        FindField('PORT3_DELAY').AsString:= stPORT3_DELAY;
        FindField('PORT3_SENS').AsString:= stPORT3_SENS;
        FindField('PORT3_NAME').AsString:= stPORT3_NAME;
        FindField('PORT4_TYPE').AsString:= stPORT4_TYPE;
        FindField('PORT4_DELAY').AsString:= stPORT4_DELAY;
        FindField('PORT4_SENS').AsString:= stPORT4_SENS;
        FindField('PORT4_NAME').AsString:= stPORT4_NAME;
        FindField('PORT5_TYPE').AsString:= stPORT5_TYPE;
        FindField('PORT5_DELAY').AsString:= stPORT5_DELAY;
        FindField('PORT5_SENS').AsString:= stPORT5_SENS;
        FindField('PORT5_NAME').AsString:= stPORT5_NAME;
        FindField('PORT6_TYPE').AsString:= stPORT6_TYPE;
        FindField('PORT6_DELAY').AsString:= stPORT6_DELAY;
        FindField('PORT6_SENS').AsString:= stPORT6_SENS;
        FindField('PORT6_NAME').AsString:= stPORT6_NAME;
        FindField('PORT7_TYPE').AsString:= stPORT7_TYPE;
        FindField('PORT7_DELAY').AsString:= stPORT7_DELAY;
        FindField('PORT7_SENS').AsString:= stPORT7_SENS;
        FindField('PORT7_NAME').AsString:= stPORT7_NAME;
        FindField('PORT8_TYPE').AsString:= stPORT8_TYPE;
        FindField('PORT8_DELAY').AsString:= stPORT8_DELAY;
        FindField('PORT8_SENS').AsString:= stPORT8_SENS;
        FindField('PORT8_NAME').AsString:= stPORT8_NAME;
        Try
          Post;
        Except
          showmessage('복사에 실패하였습니다.');
          exit;
        end;

        showmessage('복사에 성공하였습니다.');
      end
      else showmessage('복사에 실패하였습니다.');
    end
    else showmessage('복사에 실패하였습니다.');
  end;
end;

end.
