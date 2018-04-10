{***************************************************************}
{  카드 데이터 등록                                             }
{  File Name: uCardReg.pas                                      }
{                                                               }
{  Copyright (c) 2007  zeron                                    }
{                                                               }
{  All rights reserved.                                         }
{                                                               }
{***************************************************************}
{           pattern
  ================================================
  등록 항목
  ================================================
  카드번호  10
  출입문1   1 (1등록/0:불허)
  출입문2   1 (1등록/0:불허)
  방범      1 (1등록/0:불허)
  유효기간  6 (년2원2일2)
  카드권한  1 (0출입전용/1방범전용/2:방범+출입)
  타임패턴  1 (패턴1,패턴2,패턴3)
  응답수신여부 1
}

unit uCardReg;

interface

uses

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, dbisamtb, ExtCtrls, RzPanel, Grids, DBGrids, RzDBGrid,
  RzRadChk, RzStatus, RzButton, StdCtrls, RzCmboBx, LMDCustomScrollBox,
  clipbrd,LMDListBox, Mask, RzEdit, RzDBEdit, LMDControl, LMDBaseControl,
  LMDBaseGraphicButton, LMDCustomSpeedButton, LMDSpeedButton;

//{$I zRegT.INC}  

type
  TForm_RegCard = class(TForm)
    RzPanel1: TRzPanel;
    dsTB_CARD: TDataSource;
    btnSend: TRzBitBtn;
    btnOpen: TRzBitBtn;
    RzStatusBar1: TRzStatusBar;
    RzFieldStatus1: TRzFieldStatus;
    RzFieldStatus2: TRzFieldStatus;
    checkbox_CardReg: TRzCheckBox;
    btnSave: TRzBitBtn;
    btnCloase: TRzBitBtn;
    Label1: TLabel;
    ComboBox_ECU: TRzComboBox;
    GroupBox1: TGroupBox;
    Memo2: TMemo;
    GroupBox2: TGroupBox;
    LMDListBox1: TLMDListBox;
    RzBitBtn1: TRzBitBtn;
    GroupBox3: TGroupBox;
    RzDBGrid1: TRzDBGrid;
    RzBitBtn2: TRzBitBtn;
    RzBitBtn3: TRzBitBtn;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    btnAppend: TLMDSpeedButton;
    btnPost: TLMDSpeedButton;
    btnErase: TLMDSpeedButton;
    GroupBox4: TGroupBox;
    Label2: TLabel;
    DBEB_Code: TRzDBEdit;
    Label3: TLabel;
    com_Reg: TComboBox;
    Label4: TLabel;
    Com_Door1: TComboBox;
    Com_Door2: TComboBox;
    Label5: TLabel;
    Label6: TLabel;
    Com_Alarm: TComboBox;
    Label8: TLabel;
    Label9: TLabel;
    DBEB_Date: TRzDBEdit;
    Com_Type: TComboBox;
    btn_SelDelete: TRzBitBtn;
    procedure checkbox_CardRegClick(Sender: TObject);
    procedure btnCloaseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    Procedure CD_DownLoad(aDevice, aCardNo,aRegCode,aCardAuth,aInOutMode,aYYMMDD: String; func: Char);
    procedure LMDListBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSendClick(Sender: TObject);
    procedure RzBitBtn3Click(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnOpenClick(Sender: TObject);
    procedure FileToInsertTable(filename:string);
    procedure RzDBGrid1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure LMDListBox1DblClick(Sender: TObject);
    procedure btnAppendClick(Sender: TObject);
    procedure btnEraseClick(Sender: TObject);
    procedure RzDBGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnPostClick(Sender: TObject);
    procedure RzDBGrid1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure com_RegChange(Sender: TObject);
    procedure Com_Door1Change(Sender: TObject);
    procedure Com_Door2Change(Sender: TObject);
    procedure Com_AlarmChange(Sender: TObject);
    procedure Com_TypeChange(Sender: TObject);
    procedure btn_SelDeleteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ECUList : TStringList;
    DeviceID : String;

    procedure AutoCardDownLoad(aCardNo : string);
  end;

var
  Form_RegCard: TForm_RegCard;

implementation
uses
  uNewMain,uLomosUtil,uPCommon;
{$R *.dfm}

procedure TForm_RegCard.checkbox_CardRegClick(Sender: TObject);
begin
  if Form_RegCard.checkbox_CardReg.Checked then RegCardMode:= True
  else                                          RegCardMode:= False;

end;

procedure TForm_RegCard.btnCloaseClick(Sender: TObject);
begin
  Close;
end;

procedure TForm_RegCard.FormShow(Sender: TObject);
var
  i : integer;
begin
  ComboBox_ECU.Clear;
  ComboBox_ECU.Add('99.전체');
  ComboBox_ECU.Add('00.메인');
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
{  for i := 0 to ECUList.Count - 1 do
  begin
    ComboBox_ECU.Add(ECUList.Strings[i]);
  end;  }
  ComboBox_ECU.ItemIndex := 0;
  fmMain.bRegCardShow := True;
  //cbPort.Visible := false;

end;

procedure TForm_RegCard.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  fmMain.bRegCardShow := False;
end;

procedure TForm_RegCard.CD_DownLoad(aDevice, aCardNo,aRegCode,aCardAuth,aInOutMode,aYYMMDD: String; func: Char);
var
  aData: String;
  I: Integer;
  xCardNo: String;
  RealCardNo: String;
  ValidDay: String;
  aLength: Integer;
begin

  aLength:= Length(aCardNo);
  if aLength < 10 then
    aCardNo:= FillZeroStrNum(aCardNo,10);

  if aLength < 16 then
  begin
    for I := 1  to 16 - aLength do
    begin
      aCardNo:= aCardNo + '0';
    end;
  end;


  //SHowMessage(aCardNo);
  RealCardNo:= Copy(aCardNo,1,10);
  ValidDay:=   Copy(aCardNo,11,6);
  //xCardNo:=  '00'+Dec2Hex64(StrtoInt64(RealCardNo),8);
  xCardNo:=  '00'+EncodeCardNo(RealCardNo);


  aData:= '';
  aData:= func +
          //InttoStr(Send_MsgNo)+     // Message Count
          '0'+
          aRegCode+                      //등록코드(0:1,2   1:1번문,  2:2번문, 3:방범전용)
          '  '+                     //RecordCount #$20 #$20
          '0'+                      //예비10자리('0')
          xCardNo+                  //카드번호
          aYYMMDD +                 //유효기간
          '0'+                      //등록 결과
          aCardAuth+                      //카드권한(0:출입전용,1:방범전용,2:방범+출입)
          aInOutMode;                      //타입패턴

  fmMain.SendPacket(aDevice,'c',aData,True);
end;

procedure TForm_RegCard.AutoCardDownLoad(aCardNo: string);
var
  i:integer;
  aDevice:string;
begin

  if Not checkbox_CardReg.Checked then Exit;

  with fmMain.TB_CARD do
  begin
    if Not FindKey([aCardNo]) then
    begin
      Append;
      FindField('CardNo').AsString:= aCardNo;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;

  if ComboBox_ECU.ItemIndex = 0 then   //전체 다운로드이면 루프를 돌면서 전부다 다운로드시킴
  begin
    for i:=1 to ComboBox_ECU.Count - 1 do
    begin
      aDevice := DeviceID + copy(ComboBox_ECU.Items.Strings[i],1,2);
      Sleep(100);
      CD_DownLoad(aDevice, aCardNo,'0','2','0','000000', 'L');
    end;
  end
  else
  begin
    aDevice := DeviceID + copy(ComboBox_ECU.Items.Strings[ComboBox_ECU.ItemIndex],1,2);
    CD_DownLoad(aDevice, aCardNo,'0','2','0','000000', 'L') ;
  end;
//
end;

procedure TForm_RegCard.LMDListBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  st: string;
begin
  if key = 17 then Exit;
  if (Key = 67) and (Shift = [ssCtrl]) 	then
  begin
    st:= LMDListBox1.ItemPart(LMDListBox1.ItemIndex,2);
    ClipBoard.SetTextBuf(PChar(st));
  end;

end;

procedure TForm_RegCard.btnSendClick(Sender: TObject);
var
  i,j : integer;
  CardNo : string;
  aPermit : string;
  aDoor1 : string;
  aDoor2 : string;
  aAlarm : string;
  aCardPermit : string;
  aValiDate : string;
  aTimePattern : string;
  aDevice : string;
  aRegCode : string;
  aFunc : char;
  aCardType : string;
begin
  with RzDBGrid1 do
  begin
//    for i:= 0 to SelectedRows.Count -1 do
//    begin

//      DataSource.Dataset.Gotobookmark(pointer(SelectedRows.Items[i]));
      CardNo:= DataSource.Dataset.FindField('CARDNO').asString;
      aPermit:= DataSource.Dataset.FindField('PERMIT').asString;
      aDoor1:= DataSource.Dataset.FindField('DOOR1').asString;
      aDoor2:= DataSource.Dataset.FindField('DOOR2').asString;
      aAlarm:= DataSource.Dataset.FindField('ALARM').asString;
      aCardPermit:= DataSource.Dataset.FindField('CARDPERMIT').asString;
      aValiDate:= DataSource.Dataset.FindField('VALIDDATE').asString;
      aTimePattern:= DataSource.Dataset.FindField('TIMEPATTERN').asString;

      if aDoor1 = 'Y' then
      begin
        aRegCode := '1';     //첫번째 문 등록
        if aDoor2 = 'Y' then aRegCode := '0';       //첫번째 두번째 문등록
      end
      else aRegCode := '2';

//      if aAlarm = 'Y' then aRegCode := '0'; // 방범이면 무조건 문두개 모두 등록

      if aPermit = 'Y' then
      begin
        aFunc := 'L';
        if aAlarm = 'Y' then aCardType := '2'   //출입방범
        else aCardType := '0';                   //출입
      end else
      begin
        if aAlarm = 'Y' then
        begin
          aFunc := 'L';
          aCardType := '1'; //방범전용
          aRegCode:= '0';
        end else
        begin   //데이터 삭제
          aFunc := 'N';
          aCardType:= '0';
          aRegCode:= '0';
        end;
      end;

      if ComboBox_ECU.ItemIndex = 0 then   //전체 다운로드이면 루프를 돌면서 전부다 다운로드시킴
      begin
        for j:=1 to ComboBox_ECU.Count - 1 do
        begin
          aDevice := DeviceID + copy(ComboBox_ECU.Items.Strings[j],1,2);
          Sleep(100);
          CD_DownLoad(aDevice, CardNo,aRegCode,aCardType,aTimePattern,aValiDate, 'L');     //aDevice, aCardNo,aRegCode,aCardAuth,aInOutMode,aYYMMDD
        end;
      end else
      begin
        aDevice := DeviceID + copy(ComboBox_ECU.Items.Strings[ComboBox_ECU.ItemIndex],1,2);
        CD_DownLoad(aDevice, CardNo,aRegCode,aCardType,aTimePattern,aValiDate, 'L') ;
      end;

//    end; //for end
  end; //with RzDBGrid1 do

end;

procedure TForm_RegCard.RzBitBtn3Click(Sender: TObject);
var
  i,j : integer;
  CardNo : string;
  aPermit : string;
  aDoor1 : string;
  aDoor2 : string;
  aAlarm : string;
  aCardPermit : string;
  aValiDate : string;
  aTimePattern : string;
  aDevice : string;
  aRegCode : string;
  aFunc : char;
  aCardType : string;
begin
  with RzDBGrid1 do
  begin
    DataSource.Dataset.First;
    while Not DataSource.Dataset.Eof do
    begin

      CardNo:= DataSource.Dataset.FindField('CARDNO').asString;
      aPermit:= DataSource.Dataset.FindField('PERMIT').asString;
      aDoor1:= DataSource.Dataset.FindField('DOOR1').asString;
      aDoor2:= DataSource.Dataset.FindField('DOOR2').asString;
      aAlarm:= DataSource.Dataset.FindField('ALARM').asString;
      aCardPermit:= DataSource.Dataset.FindField('CARDPERMIT').asString;
      aValiDate:= DataSource.Dataset.FindField('VALIDDATE').asString;
      aTimePattern:= DataSource.Dataset.FindField('TIMEPATTERN').asString;

      if aDoor1 = 'Y' then
      begin
        aRegCode := '1';     //첫번째 문 등록
        if aDoor2 = 'Y' then aRegCode := '0';       //첫번째 두번째 문등록
      end
      else aRegCode := '2';

      if aAlarm = 'Y' then aRegCode := '0'; // 방범이면 무조건 문두개 모두 등록

      if aPermit = 'Y' then
      begin
        aFunc := 'L';
        if aAlarm = 'Y' then aCardType := '2'   //출입방범
        else aCardType := '0';                   //출입
      end else
      begin
        if aAlarm = 'Y' then
        begin
          aFunc := 'L';
          aCardType := '1'; //방범전용
          aRegCode:= '0';
        end else
        begin   //데이터 삭제
          aFunc := 'N';
          aCardType:= '0';
          aRegCode:= '0';
        end;
        aFunc := 'N';
      end;

      if ComboBox_ECU.ItemIndex = 0 then   //전체 다운로드이면 루프를 돌면서 전부다 다운로드시킴
      begin
        for j:=1 to ComboBox_ECU.Count - 1 do
        begin
          aDevice := DeviceID + copy(ComboBox_ECU.Items.Strings[j],1,2);
          Sleep(500);
          CD_DownLoad(aDevice, CardNo,aRegCode,aCardType,aTimePattern,aValiDate, aFunc);     //aDevice, aCardNo,aRegCode,aCardAuth,aInOutMode,aYYMMDD
        end;
      end else
      begin
        aDevice := DeviceID + copy(ComboBox_ECU.Items.Strings[ComboBox_ECU.ItemIndex],1,2);
        CD_DownLoad(aDevice, CardNo,aRegCode,aCardType,aTimePattern,aValiDate, aFunc) ;
      end;

      DataSource.Dataset.Next;
    end; //While end
  end; //with RzDBGrid1 do

end;

procedure TForm_RegCard.RzBitBtn2Click(Sender: TObject);
var
  i,j : integer;
  CardNo : string;
  aPermit : string;
  aDoor1 : string;
  aDoor2 : string;
  aAlarm : string;
  aCardPermit : string;
  aValiDate : string;
  aTimePattern : string;
  aDevice : string;
  aRegCode : string;
  aFunc : char;
  aCardType : string;
begin
  memo2.Clear;
  with RzDBGrid1 do
  begin
    DataSource.Dataset.First;
    while Not DataSource.Dataset.Eof do
    begin

      CardNo:= DataSource.Dataset.FindField('CARDNO').asString;

      if ComboBox_ECU.ItemIndex = 0 then   //전체 다운로드이면 루프를 돌면서 전부다 다운로드시킴
      begin
        for j:=1 to ComboBox_ECU.Count - 1 do
        begin
          aDevice := DeviceID + copy(ComboBox_ECU.Items.Strings[j],1,2);
          Sleep(100);
          CD_DownLoad(aDevice, CardNo,'0','2','0','000000', 'M');
        end;
      end else
      begin
        aDevice := DeviceID + copy(ComboBox_ECU.Items.Strings[ComboBox_ECU.ItemIndex],1,2);
        CD_DownLoad(aDevice, CardNo,'0','2','0','000000', 'M');
      end;

      DataSource.Dataset.Next;
    end; //While end
  end; //with RzDBGrid1 do
end;

procedure TForm_RegCard.RzBitBtn1Click(Sender: TObject);
var
  aDevice : string;
  j: integer;
begin
  if ComboBox_ECU.ItemIndex = 0 then   //전체 다운로드이면 루프를 돌면서 전부다 다운로드시킴
  begin
    for j:=1 to ComboBox_ECU.Count - 1 do
    begin
      aDevice := DeviceID + copy(ComboBox_ECU.Items.Strings[j],1,2);
      Sleep(100);
      CD_DownLoad(aDevice, '0000000000','0','2','0','000000', 'O');
    end;
  end else
  begin
    aDevice := DeviceID + copy(ComboBox_ECU.Items.Strings[ComboBox_ECU.ItemIndex],1,2);
    CD_DownLoad(aDevice, '0000000000','0','2','0','000000', 'O');
  end;
end;

procedure TForm_RegCard.btnSaveClick(Sender: TObject);
var
  filename : string;
begin
  SaveDialog1.DefaultExt:= 'CSV';
  SaveDialog1.Filter := 'Text files (*.CSV)|*.CSV';
  if SaveDialog1.Execute then
  begin
   filename := SaveDialog1.FileName;
   GridtoFile(RZDBGrid1,filename);
  end;

end;

procedure TForm_RegCard.btnOpenClick(Sender: TObject);
var
  filename : string;
begin
  OpenDialog1.DefaultExt:= 'CSV';
  OpenDialog1.Filter := 'Text files (*.CSV)|*.CSV';
  if OpenDialog1.Execute then
  begin
   filename := OpenDialog1.FileName;
   FileToInsertTable(filename);
  end;

end;

procedure TForm_RegCard.FileToInsertTable(filename: string);
var
  CardDataList : TStringList;
  i : integer;
  aCardNo,aPermit,aDoor1,aDoor2,aAlarm : string;
  aCardPermit,aValidDate,aTimePattern,aRcvAck : string;
begin
  CardDataList := TStringList.Create;
  CardDataList.Clear;
  CardDataList.LoadFromFile(filename);
  CardDataList.Delete(0); //헤더 부분 삭제

  with fmMain.TB_CARD do
  begin
    for i:= 0 to RecordCount - 1 do
    begin
      Delete;
    end;

    for i:= 0 to CardDataList.Count - 1 do
    begin
      aCardNo := Trim(FindCharCopy(CardDataList.Strings[i],0,','));
      aPermit := Trim(FindCharCopy(CardDataList.Strings[i],1,','));
      aDoor1 := Trim(FindCharCopy(CardDataList.Strings[i],2,','));
      aDoor2 := Trim(FindCharCopy(CardDataList.Strings[i],3,','));
      aAlarm := Trim(FindCharCopy(CardDataList.Strings[i],4,','));
      aCardPermit := Trim(FindCharCopy(CardDataList.Strings[i],5,','));
      aValidDate := Trim(FindCharCopy(CardDataList.Strings[i],6,','));
      aTimePattern := Trim(FindCharCopy(CardDataList.Strings[i],7,','));
      aRcvAck := Trim(FindCharCopy(CardDataList.Strings[i],8,','));
      if Not FindKey([aCardNo]) then
      begin
        Append;
        FindField('CardNo').AsString:= aCardNo;
        FindField('PERMIT').AsString:= aPermit;
        FindField('DOOR1').AsString:= aDoor1;
        FindField('DOOR2').AsString:= aDoor2;
        FindField('ALARM').AsString:= aAlarm;
        FindField('CARDPERMIT').AsString:= aCardPermit;
        FindField('VALIDDATE').AsString:= aValidDate;
        FindField('TIMEPATTERN').AsString:= aTimePattern;
        FindField('RCVACK').AsString:= aRcvAck;

        try
          Post;
        except
          CardDataList.Free;
          Exit;
        end;
      end;


    end;
  end;
  CardDataList.Free;
end;

procedure TForm_RegCard.RzDBGrid1DragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
{  if (Sender is TPanel) then
    if Tpanel(Source).Tag = 1 then
    Begin
      TPanel(Sender).Color := Tpanel(Source).Color;
     // CheckFields1(Sender);
    end;
}
end;

procedure TForm_RegCard.LMDListBox1DblClick(Sender: TObject);
var
  st: string;
begin
  st:= LMDListBox1.ItemPart(LMDListBox1.ItemIndex,2);

  with fmMain.TB_CARD do
  begin
    if Not FindKey([st]) then
    begin
      Append;
      FindField('CardNo').AsString:= st;

      try
        Post;
      except
        Exit;
      end;
    end;
  end;

end;

procedure TForm_RegCard.btnAppendClick(Sender: TObject);
begin
//  DBEB_Code.Enabled := True;
  com_Reg.ItemIndex := 0;
  Com_Door1.ItemIndex := 0;
  Com_Door2.ItemIndex := 0;
  Com_Alarm.ItemIndex := 0;
  Com_Type.ItemIndex := 0;
  DBEB_Code.SetFocus;
  fmMain.TB_CARD.Insert;
end;

procedure TForm_RegCard.btnEraseClick(Sender: TObject);
begin
{  DBEB_Code.Enabled := False;
  com_Reg.Enabled := False;
  Com_Door1.Enabled := False;
  Com_Door2.Enabled := False;
  Com_Alarm.Enabled := False;
  Com_CardAdmin.Enabled := False;
  DBEB_Date.Enabled := False;
  Com_Type.Enabled := False; }
  fmMain.TB_CARD.Delete;
end;

procedure TForm_RegCard.RzDBGrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  aCoCode:String;
  Loop : Integer;
  aPermit : string;
  aDoor1 : string;
  aDoor2 : string;
  aAlarm : string;
  aTimePattern : string;
begin
  aCoCode:= dsTB_CARD.DataSet.FindField('CARDNO').asString;
  aPermit:= dsTB_CARD.DataSet.FindField('PERMIT').asString;
  aDoor1:= dsTB_CARD.DataSet.FindField('DOOR1').asString;
  aDoor2:= dsTB_CARD.DataSet.FindField('DOOR2').asString;
  aAlarm:= dsTB_CARD.DataSet.FindField('ALARM').asString;
  aTimePattern:= dsTB_CARD.DataSet.FindField('TIMEPTTERN').asString;

  for Loop := 0 to COM_REG.Items.Count-1 do
  begin
    if copy(COM_REG.Items.Strings[Loop],1,1) = aPermit then
    begin
      COM_REG.ItemIndex := Loop;
      COM_REG.Text := COM_REG.Items.Strings[Loop];
      break;
    end;
  end;
  for Loop := 0 to COM_Door1.Items.Count-1 do
  begin
    if copy(COM_Door1.Items.Strings[Loop],1,1) = aDoor1 then
    begin
      COM_Door1.ItemIndex := Loop;
      COM_Door1.Text := COM_Door1.Items.Strings[Loop];
      break;
    end;
  end;
  for Loop := 0 to COM_Door2.Items.Count-1 do
  begin
    if copy(COM_Door2.Items.Strings[Loop],1,1) = aDoor2 then
    begin
      COM_Door2.ItemIndex := Loop;
      COM_Door2.Text := COM_Door2.Items.Strings[Loop];
      break;
    end;
  end;
  for Loop := 0 to COM_Alarm.Items.Count-1 do
  begin
    if copy(COM_Alarm.Items.Strings[Loop],1,1) = aAlarm then
    begin
      COM_Alarm.ItemIndex := Loop;
      COM_Alarm.Text := COM_Alarm.Items.Strings[Loop];
      break;
    end;
  end;
  for Loop := 0 to COM_Type.Items.Count-1 do
  begin
    if copy(COM_Type.Items.Strings[Loop],1,1) = aTimePattern then
    begin
      COM_Type.ItemIndex := Loop;
      COM_Type.Text := COM_Type.Items.Strings[Loop];
      break;
    end;
  end;

end;

procedure TForm_RegCard.btnPostClick(Sender: TObject);
begin
  fmMain.TB_CARD.Post;
end;

procedure TForm_RegCard.RzDBGrid1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  aCoCode:String;
  Loop : Integer;
  aPermit : string;
  aDoor1 : string;
  aDoor2 : string;
  aAlarm : string;
  aTimePattern : string;
begin
  aCoCode:= dsTB_CARD.DataSet.FindField('CARDNO').asString;
  aPermit:= dsTB_CARD.DataSet.FindField('PERMIT').asString;
  aDoor1:= dsTB_CARD.DataSet.FindField('DOOR1').asString;
  aDoor2:= dsTB_CARD.DataSet.FindField('DOOR2').asString;
  aAlarm:= dsTB_CARD.DataSet.FindField('ALARM').asString;
  aTimePattern:= dsTB_CARD.DataSet.FindField('TIMEPATTERN').asString;

  for Loop := 0 to COM_REG.Items.Count-1 do
  begin
    if copy(COM_REG.Items.Strings[Loop],1,1) = aPermit then
    begin
      COM_REG.ItemIndex := Loop;
      COM_REG.Text := COM_REG.Items.Strings[Loop];
      break;
    end;
  end;
  for Loop := 0 to COM_Door1.Items.Count-1 do
  begin
    if copy(COM_Door1.Items.Strings[Loop],1,1) = aDoor1 then
    begin
      COM_Door1.ItemIndex := Loop;
      COM_Door1.Text := COM_Door1.Items.Strings[Loop];
      break;
    end;
  end;
  for Loop := 0 to COM_Door2.Items.Count-1 do
  begin
    if copy(COM_Door2.Items.Strings[Loop],1,1) = aDoor2 then
    begin
      COM_Door2.ItemIndex := Loop;
      COM_Door2.Text := COM_Door2.Items.Strings[Loop];
      break;
    end;
  end;
  for Loop := 0 to COM_Alarm.Items.Count-1 do
  begin
    if copy(COM_Alarm.Items.Strings[Loop],1,1) = aAlarm then
    begin
      COM_Alarm.ItemIndex := Loop;
      COM_Alarm.Text := COM_Alarm.Items.Strings[Loop];
      break;
    end;
  end;
  for Loop := 0 to COM_Type.Items.Count-1 do
  begin
    if copy(COM_Type.Items.Strings[Loop],1,1) = aTimePattern then
    begin
      COM_Type.ItemIndex := Loop;
      COM_Type.Text := COM_Type.Items.Strings[Loop];
      break;
    end;
  end;

end;

procedure TForm_RegCard.com_RegChange(Sender: TObject);
begin
  dsTB_CARD.DataSet.Edit;
  dsTB_CARD.DataSet.FindField('PERMIT').asString := copy(Com_Reg.Text,1,1);
  dsTB_CARD.DataSet.Post;

end;

procedure TForm_RegCard.Com_Door1Change(Sender: TObject);
begin
  dsTB_CARD.DataSet.Edit;
  dsTB_CARD.DataSet.FindField('DOOR1').asString := copy(Com_Door1.Text,1,1);
  dsTB_CARD.DataSet.Post;
end;

procedure TForm_RegCard.Com_Door2Change(Sender: TObject);
var
  st : string;
begin
  st := copy(Com_Door2.Text,1,1);
  dsTB_CARD.DataSet.Edit;
  dsTB_CARD.DataSet.FindField('DOOR2').asString := st;
  dsTB_CARD.DataSet.Post;
end;

procedure TForm_RegCard.Com_AlarmChange(Sender: TObject);
begin
  dsTB_CARD.DataSet.Edit;
  dsTB_CARD.DataSet.FindField('ALARM').asString := copy(Com_Alarm.Text,1,1);
  dsTB_CARD.DataSet.Post;
end;

procedure TForm_RegCard.Com_TypeChange(Sender: TObject);
begin
  dsTB_CARD.DataSet.Edit;
  dsTB_CARD.DataSet.FindField('TIMEPATTERN').asString := copy(Com_Type.Text,1,1);
  dsTB_CARD.DataSet.Post;
end;

procedure TForm_RegCard.btn_SelDeleteClick(Sender: TObject);
var
  i,j : integer;
  CardNo : string;
  aPermit : string;
  aDoor1 : string;
  aDoor2 : string;
  aAlarm : string;
  aCardPermit : string;
  aValiDate : string;
  aTimePattern : string;
  aDevice : string;
  aRegCode : string;
  aFunc : char;
  aCardType : string;
begin
  with RzDBGrid1 do
  begin
//    for i:= 0 to SelectedRows.Count -1 do
//    begin

//      DataSource.Dataset.Gotobookmark(pointer(SelectedRows.Items[i]));
      CardNo:= DataSource.Dataset.FindField('CARDNO').asString;
      aPermit:= DataSource.Dataset.FindField('PERMIT').asString;
      aDoor1:= DataSource.Dataset.FindField('DOOR1').asString;
      aDoor2:= DataSource.Dataset.FindField('DOOR2').asString;
      aAlarm:= DataSource.Dataset.FindField('ALARM').asString;
      aCardPermit:= DataSource.Dataset.FindField('CARDPERMIT').asString;
      aValiDate:= DataSource.Dataset.FindField('VALIDDATE').asString;
      aTimePattern:= DataSource.Dataset.FindField('TIMEPATTERN').asString;

      if aDoor1 = 'Y' then
      begin
        aRegCode := '1';     //첫번째 문 등록
        if aDoor2 = 'Y' then aRegCode := '0';       //첫번째 두번째 문등록
      end
      else aRegCode := '2';

      if aAlarm = 'Y' then aRegCode := '0'; // 방범이면 무조건 문두개 모두 등록

      if aPermit = 'Y' then
      begin
        aFunc := 'L';
        if aAlarm = 'Y' then aCardType := '2'   //출입방범
        else aCardType := '0';                   //출입
      end else
      begin
        if aAlarm = 'Y' then
        begin
          aFunc := 'L';
          aCardType := '1'; //방범전용
          aRegCode:= '0';
        end else
        begin   //데이터 삭제
          aFunc := 'N';
          aCardType:= '0';
          aRegCode:= '0';
        end;
      end;

      if ComboBox_ECU.ItemIndex = 0 then   //전체 다운로드이면 루프를 돌면서 전부다 다운로드시킴
      begin
        for j:=1 to ComboBox_ECU.Count - 1 do
        begin
          aDevice := DeviceID + copy(ComboBox_ECU.Items.Strings[j],1,2);
          Sleep(100);
          CD_DownLoad(aDevice, CardNo,aRegCode,aCardType,aTimePattern,aValiDate, 'N');     //aDevice, aCardNo,aRegCode,aCardAuth,aInOutMode,aYYMMDD
        end;
      end else
      begin
        aDevice := DeviceID + copy(ComboBox_ECU.Items.Strings[ComboBox_ECU.ItemIndex],1,2);
        CD_DownLoad(aDevice, CardNo,aRegCode,aCardType,aTimePattern,aValiDate, 'N') ;
      end;

//    end; //for end
  end; //with RzDBGrid1 do
end;

end.
