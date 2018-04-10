{*******************************************************}
{                                                       }
{         ȭ�ϸ�: DoorSchReg.PAS                        }
{         ��  ��: �� ������ ����ȭ��                    }
{         �ۼ���: 2004.12.08                            }
{         �ۼ���: ������                                }
{         Copyright (c)                                 }
{                                                       }
{*******************************************************}
unit DoorSchReg;

interface

uses
  uLomosUtil,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, dbisamtb, RzButton, StdCtrls, RzRadGrp, RzDBRGrp, ExtCtrls,
  RzPanel, RzCmboBx;

type


  {DoorMode ������ ����� Record}
  TTimeSch = record
    xGrade: Char;
    xTime: TDateTime;
  end;


  TDoorscheduleRegForm = class(TForm)
    RzGroupBox1: TRzGroupBox;
    PaintBox1: TPaintBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel6: TPanel;
    Panel5: TPanel;
    Panel4: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel31: TPanel;
    Panel32: TPanel;
    Panel33: TPanel;
    Panel34: TPanel;
    RzGroupBox2: TRzGroupBox;
    PaintBox2: TPaintBox;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    Panel20: TPanel;
    Panel35: TPanel;
    Panel36: TPanel;
    Panel37: TPanel;
    Panel38: TPanel;
    RzGroupBox3: TRzGroupBox;
    PaintBox3: TPaintBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Panel21: TPanel;
    Panel22: TPanel;
    Panel23: TPanel;
    Panel24: TPanel;
    Panel25: TPanel;
    Panel26: TPanel;
    Panel27: TPanel;
    Panel28: TPanel;
    Panel29: TPanel;
    Panel30: TPanel;
    Panel39: TPanel;
    Panel40: TPanel;
    Panel41: TPanel;
    Panel42: TPanel;
    RzDBRadioGroup1: TRzDBRadioGroup;
    PaintBox4: TPaintBox;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Panel43: TPanel;
    Panel44: TPanel;
    Panel45: TPanel;
    Panel46: TPanel;
    Panel47: TPanel;
    Panel48: TPanel;
    Panel49: TPanel;
    Panel50: TPanel;
    Panel51: TPanel;
    Panel52: TPanel;
    Panel53: TPanel;
    Panel54: TPanel;
    Panel55: TPanel;
    Panel56: TPanel;
    btnSave: TRzBitBtn;
    btnClose: TRzBitBtn;
    btnSend: TRzBitBtn;
    RzGroupBox4: TRzGroupBox;
    Label21: TLabel;
    ComboBox_ECU: TRzComboBox;
    Label22: TLabel;
    ComboBox_Door: TRzComboBox;
    btnSearch: TRzBitBtn;
    procedure Panel3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Panel2DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure Panel2DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure Panel2Resize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PaintBox1Paint(Sender: TObject);
    procedure Panel2DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PaintBox2Paint(Sender: TObject);
    procedure PaintBox3Paint(Sender: TObject);
    procedure Panel8DblClick(Sender: TObject);
    procedure Panel8DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure Panel8DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure Panel8Resize(Sender: TObject);
    procedure Panel22DblClick(Sender: TObject);
    procedure Panel22DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure Panel22DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure Panel22Resize(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bsSkinButton4Click(Sender: TObject);
    procedure Panel31Click(Sender: TObject);
    procedure Panel35Click(Sender: TObject);
    procedure Panel39Click(Sender: TObject);
    procedure Panel44DblClick(Sender: TObject);
    procedure Panel44DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure Panel44DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure Panel44Resize(Sender: TObject);
    procedure Panel53Click(Sender: TObject);
    procedure PaintBox4Paint(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnSendClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure ComboBox_ECUChange(Sender: TObject);
  private
    { Private declarations }
    Procedure CheckFields1(Sender : TObject);
    Procedure CheckFields2(Sender : TObject);
    Procedure CheckFields3(Sender : TObject);
    Procedure CheckFields4(Sender : TObject);
    Procedure SendDoorSchadule(aDevice:String;aDoor:String;aDay:Char;aData:String);
    Procedure SearchDoorSchadule(aDevice:String;aDoor:String;aDay:Char);
    Function MakeSendData(aSch:array of TTimeSch ):String;
  public
    { Public declarations }
     DoorsList: TStringList;
    ECUList : TStringList;
    DeviceID : String;

    Procedure LoadSchadule(aData:String);

  end;

var
  DoorscheduleRegForm: TDoorscheduleRegForm;
  timePanels1 : Array[0..4] of TPanel; {����}
  timePanels2 : Array[0..4] of TPanel; {�����}
  timePanels3 : Array[0..4] of TPanel; {�Ͽ���}
  timePanels4 : Array[0..4] of TPanel; {����}

  xData1 : Array[0..4] of TTimeSch; {����}
  xData2 : Array[0..4] of TTimeSch; {�����}
  xData3 : Array[0..4] of TTimeSch; {�Ͽ���}
  xData4 : Array[0..4] of TTimeSch; {����}

  DoorList: TStringList;

implementation

uses uNewMain;

{$R *.dfm}

procedure TDoorscheduleRegForm.Panel3MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if ssLeft in Shift then
  if Sender is TPanel then
  if TPanel(Sender).Tag= 2 then
  Begin

    With TPanel(TPanel(Sender).Parent) do
    Begin
      if Width + x > 0 then
        Width := Width + x;
    end;
  end;
end;


procedure TDoorscheduleRegForm.Panel2DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := False;
  if (Sender is TPanel) then Accept := Tpanel(Source).Tag = 1;
  CheckFields1(Sender);
end;

procedure TDoorscheduleRegForm.Panel2DragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  if (Sender is TPanel) then
    if Tpanel(Source).Tag = 1 then
    Begin
      TPanel(Sender).Color := Tpanel(Source).Color;
      CheckFields1(Sender);
    end;
end;

Procedure TDoorscheduleRegForm.CheckFields1(Sender : TObject);
Var
  a : Integer;
  ox : Real;
  ax : Real;
  bx : Integer;
  st : String;
  t  : string;
  ff : TDateTime;
  Hour, Min, Sec, MSec: Word;
Begin
  if TPanel(Sender).Color = clRed then TPanel(Sender).Caption := '���'
  else if TPanel(Sender).Color = clGreen then TPanel(Sender).Caption := '����'
  else if TPanel(Sender).Color = clAqua then TPanel(Sender).Caption := '�';
  for a := 0 to ComponentCount - 1 do
  Begin
    if Components[a] is TPanel then
      if Tpanel(Components[a]).Tag= 2 then
        Tpanel(Components[a]).Color := Tpanel(Tpanel(Components[a]).Parent).Color;
  end;

  for a := 0 to 4 do
  Begin
    ox := Panel1.Width - 2;
    bx := timePanels1[a].Left+TimePanels1[a].Width-1;
    ff := (bx/ox);
    ff := Round(12*24 * ff);
    ff := ff /(12*24);
    DecodeTime(ff,Hour, Min, Sec, MSec);
    t := IntToStr(Hour);  if Length(t) = 1 then t := '0' + t;
    st := IntToStr(Min);  if Length(st) = 1 then st := '0' + st;
    st := t + ':' + st;
    Case a of
      0 : Begin Label1.Caption := st; Label1.Left := bx-07; end;
      1 : Begin Label2.Caption := st; Label2.Left := bx-07; end;
      2 : Begin Label3.Caption := st; Label3.Left := bx-07; end;
      3 : Begin Label4.Caption := st; Label4.Left := bx-07; end;
    end;
  end;
end;

Procedure TDoorscheduleRegForm.CheckFields2(Sender : TObject);
Var
  a : Integer;
  ox : Real;
  ax : Real;
  bx : Integer;
  st : String;
  t  : string;
  ff : TDateTime;
  Hour, Min, Sec, MSec: Word;
Begin
  if TPanel(Sender).Color = clRed then TPanel(Sender).Caption := '���'
  else if TPanel(Sender).Color = clGreen then TPanel(Sender).Caption := '����'
  else if TPanel(Sender).Color = clAqua then TPanel(Sender).Caption := '�';
  for a := 0 to ComponentCount - 1 do
  Begin
    if Components[a] is TPanel then
      if Tpanel(Components[a]).Tag= 2 then
        Tpanel(Components[a]).Color := Tpanel(Tpanel(Components[a]).Parent).Color;
  end;

  for a := 0 to 4 do
  Begin
    ox := Panel7.Width - 2;
    bx := timePanels2[a].Left+TimePanels2[a].Width-1;
    ff := (bx/ox);
    ff := Round(12*24 * ff);
    ff := ff /(12*24);
    DecodeTime(ff,Hour, Min, Sec, MSec);
    t := IntToStr(Hour);  if Length(t) = 1 then t := '0' + t;
    st := IntToStr(Min);  if Length(st) = 1 then st := '0' + st;
    st := t + ':' + st;
    Case a of
      0 : Begin Label5.Caption := st; Label5.Left := bx-07; end;
      1 : Begin Label7.Caption := st; Label7.Left := bx-07; end;
      2 : Begin Label8.Caption := st; Label8.Left := bx-07; end;
      3 : Begin Label9.Caption := st; Label9.Left := bx-07; end;
    end;
  end;
end;

Procedure TDoorscheduleRegForm.CheckFields3(Sender : TObject);
Var
  a : Integer;
  ox : Real;
  ax : Real;
  bx : Integer;
  st : String;
  t  : string;
  ff : TDateTime;
  Hour, Min, Sec, MSec: Word;
Begin
  if TPanel(Sender).Color = clRed then TPanel(Sender).Caption := '���'
  else if TPanel(Sender).Color = clGreen then TPanel(Sender).Caption := '����'
  else if TPanel(Sender).Color = clAqua then TPanel(Sender).Caption := '�';
  for a := 0 to ComponentCount - 1 do
  Begin
    if Components[a] is TPanel then
      if Tpanel(Components[a]).Tag= 2 then
        Tpanel(Components[a]).Color := Tpanel(Tpanel(Components[a]).Parent).Color;
  end;

  for a := 0 to 4 do
  Begin
    ox := Panel21.Width - 2;
    bx := timePanels3[a].Left+TimePanels3[a].Width-1;
    ff := (bx/ox);
    ff := Round(12*24 * ff);
    ff := ff /(12*24);
    DecodeTime(ff,Hour, Min, Sec, MSec);
    t := IntToStr(Hour);  if Length(t) = 1 then t := '0' + t;
    st := IntToStr(Min);  if Length(st) = 1 then st := '0' + st;
    st := t + ':' + st;
    Case a of
      0 : Begin Label11.Caption := st; Label11.Left := bx-07; end;
      1 : Begin Label12.Caption := st; Label12.Left := bx-07; end;
      2 : Begin Label13.Caption := st; Label13.Left := bx-07; end;
      3 : Begin Label14.Caption := st; Label14.Left := bx-07; end;
    end;
  end;
end;

Procedure TDoorscheduleRegForm.CheckFields4(Sender : TObject);
Var
  a : Integer;
  ox : Real;
  ax : Real;
  bx : Integer;
  st : String;
  t  : string;
  ff : TDateTime;
  Hour, Min, Sec, MSec: Word;
Begin
  if TPanel(Sender).Color = clRed then TPanel(Sender).Caption := '���'
  else if TPanel(Sender).Color = clGreen then TPanel(Sender).Caption := '����'
  else if TPanel(Sender).Color = clAqua then TPanel(Sender).Caption := '�';
  for a := 0 to ComponentCount - 1 do
  Begin
    if Components[a] is TPanel then
      if Tpanel(Components[a]).Tag= 2 then
        Tpanel(Components[a]).Color := Tpanel(Tpanel(Components[a]).Parent).Color;
  end;

  for a := 0 to 4 do
  Begin
    ox := Panel43.Width - 2;
    bx := timePanels4[a].Left+TimePanels4[a].Width-1;
    ff := (bx/ox);
    ff := Round(12*24 * ff);
    ff := ff /(12*24);
    DecodeTime(ff,Hour, Min, Sec, MSec);
    t := IntToStr(Hour);  if Length(t) = 1 then t := '0' + t;
    st := IntToStr(Min);  if Length(st) = 1 then st := '0' + st;
    st := t + ':' + st;
    Case a of
      0 : Begin Label16.Caption := st; Label16.Left := bx-07; end;
      1 : Begin Label17.Caption := st; Label17.Left := bx-07; end;
      2 : Begin Label18.Caption := st; Label18.Left := bx-07; end;
      3 : Begin Label19.Caption := st; Label19.Left := bx-07; end;
    end;
  end;
end;



procedure TDoorscheduleRegForm.Panel2Resize(Sender: TObject);
begin
  CheckFields1(Sender);
end;


procedure TDoorscheduleRegForm.FormCreate(Sender: TObject);
begin

  timePanels1[0] := Panel2;
  timePanels1[1] := Panel14;
  timePanels1[2] := Panel12;
  timePanels1[3] := Panel6;
  timePanels1[4] := Panel4;

  timePanels2[0] := Panel8;
  timePanels2[1] := Panel19;
  timePanels2[2] := Panel17;
  timePanels2[3] := Panel10;
  timePanels2[4] := Panel16;

  timePanels3[0] := Panel22;
  timePanels3[1] := Panel29;
  timePanels3[2] := Panel27;
  timePanels3[3] := Panel24;
  timePanels3[4] := Panel26;

  timePanels4[0] := Panel44;
  timePanels4[1] := Panel51;
  timePanels4[2] := Panel49;
  timePanels4[3] := Panel46;
  timePanels4[4] := Panel48;

end;

procedure TDoorscheduleRegForm.PaintBox1Paint(Sender: TObject);
Var
  st  : String;
  x,y : Integer;
  r   : TRect;
  a,b : Integer;
  rr  : Real;
  dx : Integer;
  dy : Integer;
begin
  PaintBox1.Width := Panel1.ClientRect.Right;
  dx := Panel1.Width - 2;
  With PaintBox1.Canvas do
  Begin
    Pen.Color := clGray;
    Pen.Width := 1;
    r := ClientRect;
    FillRect(r);
    dy := PaintBox1.Height;
    for a := 0 to 23 do
    for b := 0 to 11 do
    Begin
      if b = 0 then y := dy
      else if b = 6 then y := dy div 2
      else y := dy div 4;
      rr := (a*12 + b)/(24*12);
      x := Round(dx * rr);
      MoveTo(x,PaintBox1.Height);
      LineTo(x,PaintBox1.Height-y);
      if b = 0 then
      Begin
        st := IntToStr(a);
        TextOut(x+2,0,st);
      end;
    end;
    y := PaintBox1.Height;
    rr := 1;
    x := Round(dx * rr);
    MoveTo(x,PaintBox1.Height);
    LineTo(x,PaintBox1.Height-y);
  end;
end;

procedure TDoorscheduleRegForm.Panel2DblClick(Sender: TObject);
Var
  aColor : TColor;
  bColor : TColor;
begin
  aColor := TPanel(Sender).Color;
  if aColor = clGreen then bColor := clAqua
  else if aColor = clRed then bColor := clGreen
  else if aColor = clAqua then bColor := clRed;
  TPanel(Sender).Color := bColor;
  CheckFields1(Sender);
end;



procedure TDoorscheduleRegForm.FormShow(Sender: TObject);
Var
  i : Integer;

begin
  ComboBox_ECU.Clear;
  for i := 0 to ECUList.Count - 1 do
  begin
    ComboBox_ECU.Add(ECUList.Strings[i]);
  end;
  ComboBox_ECU.ItemIndex := 1;
  ComboBox_Door.Enabled := True;
  ComboBox_Door.itemindex := 1;
  fmMain.bDoorSchRegShow := True;
end;

procedure TDoorscheduleRegForm.PaintBox2Paint(Sender: TObject);
Var
  st  : String;
  x,y : Integer;
  r   : TRect;
  a,b : Integer;
  rr  : Real;
  dx : Integer;
  dy : Integer;
begin
  PaintBox2.Width := Panel7.ClientRect.Right;
  dx := Panel7.Width - 2;
  With PaintBox2.Canvas do
  Begin
    Pen.Color := clGray;
    Pen.Width := 1;
    r := ClientRect;
    FillRect(r);
    dy := PaintBox2.Height;
    for a := 0 to 23 do
    for b := 0 to 11 do
    Begin
      if b = 0 then y := dy
      else if b = 6 then y := dy div 2
      else y := dy div 4;
      rr := (a*12 + b)/(24*12);
      x := Round(dx * rr);
      MoveTo(x,PaintBox2.Height);
      LineTo(x,PaintBox2.Height-y);
      if b = 0 then
      Begin
        st := IntToStr(a);
        TextOut(x+2,0,st);
      end;
    end;
    y := PaintBox2.Height;
    rr := 1;
    x := Round(dx * rr);
    MoveTo(x,PaintBox2.Height);
    LineTo(x,PaintBox2.Height-y);
  end;
end;

procedure TDoorscheduleRegForm.PaintBox3Paint(Sender: TObject);
Var
  st  : String;
  x,y : Integer;
  r   : TRect;
  a,b : Integer;
  rr  : Real;
  dx : Integer;
  dy : Integer;
begin
  PaintBox3.Width := Panel21.ClientRect.Right;
  dx := Panel21.Width - 2;
  With PaintBox3.Canvas do
  Begin
    Pen.Color := clGray;
    Pen.Width := 1;
    r := ClientRect;
    FillRect(r);
    dy := PaintBox3.Height;
    for a := 0 to 23 do
    for b := 0 to 11 do
    Begin
      if b = 0 then y := dy
      else if b = 6 then y := dy div 2
      else y := dy div 4;
      rr := (a*12 + b)/(24*12);
      x := Round(dx * rr);
      MoveTo(x,PaintBox3.Height);
      LineTo(x,PaintBox3.Height-y);
      if b = 0 then
      Begin
        st := IntToStr(a);
        TextOut(x+2,0,st);
      end;
    end;
    y := PaintBox3.Height;
    rr := 1;
    x := Round(dx * rr);
    MoveTo(x,PaintBox3.Height);
    LineTo(x,PaintBox3.Height-y);
  end;
end;

procedure TDoorscheduleRegForm.PaintBox4Paint(Sender: TObject);
Var
  st  : String;
  x,y : Integer;
  r   : TRect;
  a,b : Integer;
  rr  : Real;
  dx : Integer;
  dy : Integer;
begin
  PaintBox4.Width := Panel43.ClientRect.Right;
  dx := Panel43.Width - 2;
  With PaintBox4.Canvas do
  Begin
    Pen.Color := clGray;
    Pen.Width := 1;
    r := ClientRect;
    FillRect(r);
    dy := PaintBox4.Height;
    for a := 0 to 23 do
    for b := 0 to 11 do
    Begin
      if b = 0 then y := dy
      else if b = 6 then y := dy div 2
      else y := dy div 4;
      rr := (a*12 + b)/(24*12);
      x := Round(dx * rr);
      MoveTo(x,PaintBox4.Height);
      LineTo(x,PaintBox4.Height-y);
      if b = 0 then
      Begin
        st := IntToStr(a);
        TextOut(x+2,0,st);
      end;
    end;
    y := PaintBox4.Height;
    rr := 1;
    x := Round(dx * rr);
    MoveTo(x,PaintBox4.Height);
    LineTo(x,PaintBox4.Height-y);
  end;
end;


procedure TDoorscheduleRegForm.Panel8DblClick(Sender: TObject);
Var
  aColor : TColor;
  bColor : TColor;
begin
  aColor := TPanel(Sender).Color;
  if aColor = clGreen then bColor := clAqua
  else if aColor = clRed then bColor := clGreen
  else if aColor = clAqua then bColor := clRed;
  TPanel(Sender).Color := bColor;
  CheckFields2(Sender);

end;

procedure TDoorscheduleRegForm.Panel8DragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  if (Sender is TPanel) then
    if Tpanel(Source).Tag = 1 then
    Begin
      TPanel(Sender).Color := Tpanel(Source).Color;
      CheckFields2(Sender);
    end;
end;

procedure TDoorscheduleRegForm.Panel8DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := False;
  if (Sender is TPanel) then Accept := Tpanel(Source).Tag = 1;
  CheckFields2(Sender);
end;

procedure TDoorscheduleRegForm.Panel8Resize(Sender: TObject);
begin
  CheckFields2(Sender);
end;

procedure TDoorscheduleRegForm.Panel22DblClick(Sender: TObject);
Var
  aColor : TColor;
  bColor : TColor;
begin
  aColor := TPanel(Sender).Color;
  if aColor = clGreen then bColor := clAqua
  else if aColor = clRed then bColor := clGreen
  else if aColor = clAqua then bColor := clRed;
  TPanel(Sender).Color := bColor;
  CheckFields3(Sender);
end;

procedure TDoorscheduleRegForm.Panel22DragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  if (Sender is TPanel) then
    if Tpanel(Source).Tag = 1 then
    Begin
      TPanel(Sender).Color := Tpanel(Source).Color;
      CheckFields3(Sender);
    end;
end;

procedure TDoorscheduleRegForm.Panel22DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := False;
  if (Sender is TPanel) then Accept := Tpanel(Source).Tag = 1;
  CheckFields3(Sender);
end;

procedure TDoorscheduleRegForm.Panel22Resize(Sender: TObject);
begin
  CheckFields3(Sender);
end;

procedure TDoorscheduleRegForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  fmMain.bDoorSchRegShow := False;
  DoorsList.Free;
end;

procedure TDoorscheduleRegForm.bsSkinButton4Click(Sender: TObject);
begin
  CLose;
end;

{���� �ʱ�ȭ ��ư}
procedure TDoorscheduleRegForm.Panel31Click(Sender: TObject);
var
  a: Integer;
  r: TDatetime;
  ox: INteger;
begin
  xData1[0].xGrade := '0'      ; xData1[0].xTime := (05.0*3600.0 + 00.0*60.0) /(24*3600); { ���� Default �� }
  xData1[1].xGrade := '0'      ; xData1[1].xTime := (12.0*3600.0 + 00.0*60.0) /(24*3600); { ���� Default �� }
  xData1[2].xGrade := '0'      ; xData1[2].xTime := (13.0*3600.0 + 00.0*60.0) /(24*3600); { ���� Default �� }
  xData1[3].xGrade := '0'      ; xData1[3].xTime := (18.0*3600.0 + 30.0*60.0) /(24*3600); { ���� Default �� }
  xData1[4].xGrade := '0'      ; xData1[4].xTime := (21.0*3600.0 + 00.0*60.0) /(24*3600); { ���� Default �� }

  for a := 0 to 4 do
  Begin
    timePanels1[a].Align := alNone;
    timePanels1[a].Width := 10;
    timePanels1[a].Left := 700;
  end;

  for a := 0 to 4 do
  Begin
    if a = 4 then timePanels1[a].Align := alClient
    else          timePanels1[a].Align := alLeft;
  end;

  r := 0;
  ox := Panel1.Width - 2;
  for a := 0 to 4 do
  Begin
    timePanels1[a].Color := clAqua;
    Case xData1[a].xGrade of
      '0': timePanels1[a].Color := clAqua;
      '1': timePanels1[a].Color := clGreen;
      '2': timePanels1[a].Color := clRed;
    end;
    if a = 0 then r := xData1[a].xTime
    else          r := xData1[a].xTime-xData1[a-1].xTime;

    timePanels1[a].Width := Round((ox) * (r));
  end;
  CheckFields1(timePanels1[0]);

end;

{������ �ʱ�ȭ ��ư}
procedure TDoorscheduleRegForm.Panel35Click(Sender: TObject);
var
  a: Integer;
  r: TDatetime;
  ox: INteger;
begin
  xData2[0].xGrade := '0'      ; xData2[0].xTime := (05.0*3600.0 + 00.0*60.0) /(24*3600); { ���� Default �� }
  xData2[1].xGrade := '0'      ; xData2[1].xTime := (12.0*3600.0 + 00.0*60.0) /(24*3600); { ���� Default �� }
  xData2[2].xGrade := '0'      ; xData2[2].xTime := (13.0*3600.0 + 00.0*60.0) /(24*3600); { ���� Default �� }
  xData2[3].xGrade := '0'      ; xData2[3].xTime := (18.0*3600.0 + 30.0*60.0) /(24*3600); { ���� Default �� }
  xData2[4].xGrade := '0'      ; xData2[4].xTime := (21.0*3600.0 + 00.0*60.0) /(24*3600); { ���� Default �� }

  for a := 0 to 4 do
  Begin
    timePanels2[a].Align := alNone;
    timePanels2[a].Width := 10;
    timePanels2[a].Left := 700;
  end;

  for a := 0 to 4 do
  Begin
    if a = 4 then timePanels2[a].Align := alClient
    else          timePanels2[a].Align := alLeft;
  end;

  r := 0;
  ox := Panel7.Width - 2;
  for a := 0 to 4 do
  Begin
    timePanels2[a].Color := clAqua;
    Case xData2[a].xGrade of
      '0': timePanels2[a].Color := clAqua;
      '1': timePanels2[a].Color := clGreen;
      '2': timePanels2[a].Color := clRed;
    end;
    if a = 0 then r := xData2[a].xTime
    else          r := xData2[a].xTime-xData1[a-1].xTime;

    timePanels2[a].Width := Round((ox) * (r));
  end;
  CheckFields2(timePanels2[0]);

end;

{�Ͽ��� �ʱ�ȭ ��ư}
procedure TDoorscheduleRegForm.Panel39Click(Sender: TObject);
var
  a: Integer;
  r: TDatetime;
  ox: INteger;
begin
  xData3[0].xGrade := '0'      ; xData3[0].xTime := (05.0*3600.0 + 00.0*60.0) /(24*3600); { ���� Default �� }
  xData3[1].xGrade := '0'      ; xData3[1].xTime := (12.0*3600.0 + 00.0*60.0) /(24*3600); { ���� Default �� }
  xData3[2].xGrade := '0'      ; xData3[2].xTime := (13.0*3600.0 + 00.0*60.0) /(24*3600); { ���� Default �� }
  xData3[3].xGrade := '0'      ; xData3[3].xTime := (18.0*3600.0 + 30.0*60.0) /(24*3600); { ���� Default �� }
  xData3[4].xGrade := '0'      ; xData3[4].xTime := (21.0*3600.0 + 00.0*60.0) /(24*3600); { ���� Default �� }

  for a := 0 to 4 do
  Begin
    timePanels3[a].Align := alNone;
    timePanels3[a].Width := 10;
    timePanels3[a].Left := 700;
  end;

  for a := 0 to 4 do
  Begin
    if a = 4 then timePanels3[a].Align := alClient
    else          timePanels3[a].Align := alLeft;
  end;

  r := 0;
  ox := Panel21.Width - 2;
  for a := 0 to 4 do
  Begin
    timePanels3[a].Color := clAqua;
    Case xData3[a].xGrade of
      '0': timePanels3[a].Color := clAqua;
      '1': timePanels3[a].Color := clGreen;
      '2': timePanels3[a].Color := clRed;
    end;
    if a = 0 then r := xData3[a].xTime
    else          r := xData3[a].xTime-xData1[a-1].xTime;

    timePanels3[a].Width := Round((ox) * (r));
  end;
  CheckFields3(timePanels3[0]);
end;
{���� �ʱ�ȭ ��ư}
procedure TDoorscheduleRegForm.Panel53Click(Sender: TObject);
var
  a: Integer;
  r: TDatetime;
  ox: INteger;
begin
  xData4[0].xGrade := '0'      ; xData4[0].xTime := (05.0*3600.0 + 00.0*60.0) /(24*3600); { ���� Default �� }
  xData4[1].xGrade := '0'      ; xData4[1].xTime := (12.0*3600.0 + 00.0*60.0) /(24*3600); { ���� Default �� }
  xData4[2].xGrade := '0'      ; xData4[2].xTime := (13.0*3600.0 + 00.0*60.0) /(24*3600); { ���� Default �� }
  xData4[3].xGrade := '0'      ; xData4[3].xTime := (18.0*3600.0 + 30.0*60.0) /(24*3600); { ���� Default �� }
  xData4[4].xGrade := '0'      ; xData4[4].xTime := (21.0*3600.0 + 00.0*60.0) /(24*3600); { ���� Default �� }

  for a := 0 to 4 do
  Begin
    timePanels4[a].Align := alNone;
    timePanels4[a].Width := 10;
    timePanels4[a].Left := 700;
  end;

  for a := 0 to 4 do
  Begin
    if a = 4 then timePanels4[a].Align := alClient
    else          timePanels4[a].Align := alLeft;
  end;

  r := 0;
  ox := Panel43.Width - 2;
  for a := 0 to 4 do
  Begin
    timePanels4[a].Color := clAqua;
    Case xData4[a].xGrade of
      '0': timePanels4[a].Color := clAqua;
      '1': timePanels4[a].Color := clGreen;
      '2': timePanels4[a].Color := clRed;
    end;
    if a = 0 then r := xData4[a].xTime
    else          r := xData4[a].xTime-xData4[a-1].xTime;

    timePanels4[a].Width := Round((ox) * (r));
  end;
  CheckFields4(timePanels4[0]);
end;


procedure TDoorscheduleRegForm.Panel44DblClick(Sender: TObject);
Var
  aColor : TColor;
  bColor : TColor;
begin
  aColor := TPanel(Sender).Color;
  if aColor = clGreen then bColor := clAqua
  else if aColor = clRed then bColor := clGreen
  else if aColor = clAqua then bColor := clRed;
  TPanel(Sender).Color := bColor;
  CheckFields4(Sender);
end;

procedure TDoorscheduleRegForm.Panel44DragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  if (Sender is TPanel) then
    if Tpanel(Source).Tag = 1 then
    Begin
      TPanel(Sender).Color := Tpanel(Source).Color;
      CheckFields4(Sender);
    end;
end;
procedure TDoorscheduleRegForm.Panel44DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := False;
  if (Sender is TPanel) then Accept := Tpanel(Source).Tag = 1;
  CheckFields4(Sender);
end;

procedure TDoorscheduleRegForm.Panel44Resize(Sender: TObject);
begin
  CheckFields4(Sender);
end;




procedure TDoorscheduleRegForm.btnSaveClick(Sender: TObject);
var
  ox: Integer;
  a: Integer;
  bx  : Real;
  ff  : TDateTime;
  aPortNo: Integer;
  I: Integer;
  aData1,aData2,aData3,aData4 : string;
  DeviceCount,DoorCount : integer;
  aDevice : string;
  aDoor : Char;
begin

  Screen.Cursor:= crHourGlass;

  ox := Panel1.Width - 2;
  for a := 0 to 4 do
  Begin
    {����}
         if timePanels1[a].Color = clGreen then xData1[a].xGrade :='1' //1����
    else if timePanels1[a].Color = clAqua  then xData1[a].xGrade :='0' //0�
    else if timePanels1[a].Color = clRed   then xData1[a].xGrade :='2';//`--
    bx := timePanels1[a].Left+TimePanels1[a].Width-1;
    ff := Round(12*24 * bx/ox);
    ff := ff /(12*24);
    xData1[a].xTime := ff;

     {�����}
         if timePanels2[a].Color = clGreen then xData2[a].xGrade :='1'
    else if timePanels2[a].Color = clAqua  then xData2[a].xGrade :='0'
    else if timePanels2[a].Color = clRed   then xData2[a].xGrade :='2';
    bx := timePanels2[a].Left+TimePanels2[a].Width-1;
    ff := Round(12*24 * bx/ox);
    ff := ff /(12*24);
    xData2[a].xTime := ff;

    {�Ͽ���}
         if timePanels3[a].Color = clGreen then xData3[a].xGrade :='1'
    else if timePanels3[a].Color = clAqua  then xData3[a].xGrade :='0'
    else if timePanels3[a].Color = clRed   then xData3[a].xGrade :='2';
    bx := timePanels3[a].Left+TimePanels3[a].Width-1;
    ff := Round(12*24 * bx/ox);
    ff := ff /(12*24);
    xData3[a].xTime := ff;

    {����}
         if timePanels4[a].Color = clGreen then xData4[a].xGrade :='1'
    else if timePanels4[a].Color = clAqua  then xData4[a].xGrade :='0'
    else if timePanels4[a].Color = clRed   then xData4[a].xGrade :='2';
    bx := timePanels4[a].Left+TimePanels4[a].Width-1;
    ff := Round(12*24 * bx/ox);
    ff := ff /(12*24);
    xData4[a].xTime := ff;
  end;

  aData1 := MakeSendData(xData1);  //����
  aData2 := MakeSendData(xData2);  //�����
  aData3 := MakeSendData(xData3);  //�Ͽ���
  aData4 := MakeSendData(xData4);  //Ư����

  if ComboBox_ECU.ItemIndex = 0 then  //��ü Ȯ����� ��� ���� ���� ����
  begin
    for DeviceCount := 1 to ComboBox_ECU.Count - 1 do
    begin
      aDevice := DeviceID + copy(ComboBox_ECU.Items.Strings[DeviceCount],1,2);
      for DoorCount := 1 to 2 do
      begin
        SendDoorSchadule(aDevice,inttostr(DoorCount),'0',aData1);    //����
        SendDoorSchadule(aDevice,inttostr(DoorCount),'1',aData2);    //�����
        SendDoorSchadule(aDevice,inttostr(DoorCount),'2',aData3);    //�Ͽ���
        SendDoorSchadule(aDevice,inttostr(DoorCount),'3',aData4);    //Ư����
      end;
    end;
  end else  //������ Ȯ����� �ش� ���� ����
  begin
    if ComboBox_Door.ItemIndex = 0 then    //��繮�� ���� ������ ����
    begin
      aDevice := DeviceID + copy(ComboBox_ECU.Items.Strings[ComboBox_ECU.itemIndex],1,2);
      for DoorCount := 1 to 2 do
      begin
        SendDoorSchadule(aDevice,inttostr(DoorCount),'0',aData1);    //����
        SendDoorSchadule(aDevice,inttostr(DoorCount),'1',aData2);    //�����
        SendDoorSchadule(aDevice,inttostr(DoorCount),'2',aData3);    //�Ͽ���
        SendDoorSchadule(aDevice,inttostr(DoorCount),'3',aData4);    //Ư����
      end;
    end else  //������ ���� ���� ������ ����
    begin
      aDevice := DeviceID + copy(ComboBox_ECU.Items.Strings[ComboBox_ECU.itemIndex],1,2);
      SendDoorSchadule(aDevice,inttostr(ComboBox_Door.itemIndex),'0',aData1);    //����
      SendDoorSchadule(aDevice,inttostr(ComboBox_Door.itemIndex),'1',aData2);    //�����
      SendDoorSchadule(aDevice,inttostr(ComboBox_Door.itemIndex),'2',aData3);    //�Ͽ���
      SendDoorSchadule(aDevice,inttostr(ComboBox_Door.itemIndex),'3',aData4);    //Ư����
    end;
  end;

  Screen.Cursor:= crDefault;
  ShowMessage('�����ٵ����͸� ���� �߽��ϴ�.');

end;



procedure TDoorscheduleRegForm.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TDoorscheduleRegForm.btnSendClick(Sender: TObject);
var
  ox: Integer;
  a: Integer;
  bx  : Real;
  ff  : TDateTime;
  aPortNo: Integer;
  I: Integer;
  aData1,aData2,aData3,aData4 : string;
  DeviceCount,DoorCount : integer;
  aDevice : string;
begin

  Screen.Cursor:= crHourGlass;

  ox := Panel1.Width - 2;
  for a := 0 to 4 do
  Begin
    {����}
         if timePanels1[a].Color = clGreen then xData1[a].xGrade :='1' //1����
    else if timePanels1[a].Color = clAqua  then xData1[a].xGrade :='0' //0�
    else if timePanels1[a].Color = clRed   then xData1[a].xGrade :='2';//`--
    bx := timePanels1[a].Left+TimePanels1[a].Width-1;
    ff := Round(12*24 * bx/ox);
    ff := ff /(12*24);
    xData1[a].xTime := ff;

     {�����}
         if timePanels2[a].Color = clGreen then xData2[a].xGrade :='1'
    else if timePanels2[a].Color = clAqua  then xData2[a].xGrade :='0'
    else if timePanels2[a].Color = clRed   then xData2[a].xGrade :='2';
    bx := timePanels2[a].Left+TimePanels2[a].Width-1;
    ff := Round(12*24 * bx/ox);
    ff := ff /(12*24);
    xData2[a].xTime := ff;

    {�Ͽ���}
         if timePanels3[a].Color = clGreen then xData3[a].xGrade :='1'
    else if timePanels3[a].Color = clAqua  then xData3[a].xGrade :='0'
    else if timePanels3[a].Color = clRed   then xData3[a].xGrade :='2';
    bx := timePanels3[a].Left+TimePanels3[a].Width-1;
    ff := Round(12*24 * bx/ox);
    ff := ff /(12*24);
    xData3[a].xTime := ff;

    {����}
         if timePanels4[a].Color = clGreen then xData4[a].xGrade :='1'
    else if timePanels4[a].Color = clAqua  then xData4[a].xGrade :='0'
    else if timePanels4[a].Color = clRed   then xData4[a].xGrade :='2';
    bx := timePanels4[a].Left+TimePanels4[a].Width-1;
    ff := Round(12*24 * bx/ox);
    ff := ff /(12*24);
    xData4[a].xTime := ff;
  end;

  aData1 := MakeSendData(xData1);  //����
  aData2 := MakeSendData(xData2);  //�����
  aData3 := MakeSendData(xData3);  //�Ͽ���
  aData4 := MakeSendData(xData4);  //Ư����

  if ComboBox_ECU.ItemIndex = 0 then  //��ü Ȯ����� ��� ���� ���� ����
  begin
    for DeviceCount := 1 to ComboBox_ECU.Count - 1 do
    begin
      aDevice := DeviceID + copy(ComboBox_ECU.Items.Strings[DeviceCount],1,2);
      for DoorCount := 1 to 2 do
      begin
        SendDoorSchadule(aDevice,inttostr(DoorCount),'0',aData1);    //����
        SendDoorSchadule(aDevice,inttostr(DoorCount),'1',aData2);    //�����
        SendDoorSchadule(aDevice,inttostr(DoorCount),'2',aData3);    //�Ͽ���
        SendDoorSchadule(aDevice,inttostr(DoorCount),'3',aData4);    //Ư����
      end;
    end;
  end else  //������ Ȯ����� �ش� ���� ����
  begin
    if ComboBox_Door.ItemIndex = 0 then    //��繮�� ���� ������ ����
    begin
      aDevice := DeviceID + copy(ComboBox_ECU.Items.Strings[ComboBox_ECU.itemIndex],1,2);
      for DoorCount := 1 to 2 do
      begin
        SendDoorSchadule(aDevice,inttostr(DoorCount),'0',aData1);    //����
        SendDoorSchadule(aDevice,inttostr(DoorCount),'1',aData2);    //�����
        SendDoorSchadule(aDevice,inttostr(DoorCount),'2',aData3);    //�Ͽ���
        SendDoorSchadule(aDevice,inttostr(DoorCount),'3',aData4);    //Ư����
      end;
    end else  //������ ���� ���� ������ ����
    begin
      aDevice := DeviceID + copy(ComboBox_ECU.Items.Strings[ComboBox_ECU.itemIndex],1,2);
      SendDoorSchadule(aDevice,inttostr(ComboBox_Door.itemIndex),'0',aData1);    //����
      SendDoorSchadule(aDevice,inttostr(ComboBox_Door.itemIndex),'1',aData2);    //�����
      SendDoorSchadule(aDevice,inttostr(ComboBox_Door.itemIndex),'2',aData3);    //�Ͽ���
      SendDoorSchadule(aDevice,inttostr(ComboBox_Door.itemIndex),'3',aData4);    //Ư����
    end;
  end;

  Screen.Cursor:= crDefault;
  ShowMessage('�����ٵ����͸� ���� �߽��ϴ�.');
end;


procedure TDoorscheduleRegForm.SendDoorSchadule(aDevice:String;aDoor:string; aDay: Char;
  aData: String);
var
  st: String;
begin
   st:= 'S'+        //Command
        '0'+        //Message Code
        aDoor+      //��⳻ ���Թ� ��ȣ
        #$20+
        aDay+       //����:0����,1������,2:�Ͽ���,3����
        aData;      // Mode Data

  fmMain.SendPacket(aDevice,'c',st,True);
end;

procedure TDoorscheduleRegForm.btnSearchClick(Sender: TObject);
var
  aDevice : string;
  aDoor : string;
begin
  if ComboBox_ECU.ItemIndex = 0 then
  begin
    ShowMessage('��ü ����� ������� ��ȸ�� �Ұ����մϴ�.');
    Exit;
  end;
  if ComboBox_Door.ItemIndex = 0 then
  begin
    ShowMessage('��ü ���� ������� ��ȸ�� �Ұ����մϴ�.');
    Exit;
  end;
  aDevice := DeviceID + copy(ComboBox_ECU.Items.Strings[ComboBox_ECU.itemIndex],1,2);
  aDoor := inttostr(ComboBox_Door.itemIndex);
  
  SearchDoorSchadule(aDevice,aDoor,'0');    //������ȸ
  SearchDoorSchadule(aDevice,aDoor,'1');    //�������ȸ
  SearchDoorSchadule(aDevice,aDoor,'2');    //�Ͽ�����ȸ
  SearchDoorSchadule(aDevice,aDoor,'3');    //Ư������ȸ

end;

procedure TDoorscheduleRegForm.SearchDoorSchadule(aDevice:String;aDoor:String; aDay: Char);
var
  st: String;
begin
   st:= 'P'+        //Command
        '0'+        //Message Code
        aDoor+      //��⳻ ���Թ� ��ȣ
        #$20+
        aDay;       //����:0����,1������,2:�Ͽ���,3����
  fmMain.SendPacket(aDevice,'c',st,True);
end;

Function TDoorscheduleRegForm.MakeSendData(aSch: array of TTimeSch):string;
var
  aData : string;
begin

//  aData:= Formatdatetime('hhnn',aSch[4].xTime) + aSch[0].xGrade +
  aData:= '0000' + aSch[0].xGrade +
          Formatdatetime('hhnn',aSch[0].xTime) + aSch[1].xGrade +
          Formatdatetime('hhnn',aSch[1].xTime) + aSch[2].xGrade +
          Formatdatetime('hhnn',aSch[2].xTime) + aSch[3].xGrade +
          Formatdatetime('hhnn',aSch[3].xTime) + aSch[4].xGrade;

  result := aData;

end;

procedure TDoorscheduleRegForm.ComboBox_ECUChange(Sender: TObject);
begin
  if ComboBox_ECU.ItemIndex = 0 then ComboBox_Door.Enabled := False
  else ComboBox_Door.Enabled := True;
end;

procedure TDoorscheduleRegForm.LoadSchadule(aData: String);
var
  I: Integer;
  a : Integer;
  r : TDateTime;
  ox  : Integer;
  aPortNo: Integer;
  aACUCode: String;

function Convrtstr2Time(ast: string):TDatetime;
var
  aHour: Word;
  aMin: word;
begin
  Convrtstr2Time:= 0;
  if length(ast) < 4 then Exit;
  aHour:= StrtoInt(Copy(ast,1,2));
  aMin:= StrtoInt(Copy(ast,3,2));
  Convrtstr2Time:= Encodetime(aHour,aMin,00,00);
end;

begin

  for a := 0 to 4 do
  Begin
    if a = 4 then
    begin
      timePanels1[a].Align := alClient;
      timePanels2[a].Align := alClient;
      timePanels3[a].Align := alClient;
      timePanels4[a].Align := alClient;
    end else
    begin
      timePanels1[a].Align := alLeft;
      timePanels2[a].Align := alLeft;
      timePanels3[a].Align := alLeft;
      timePanels4[a].Align := alLeft;
    end;
  end;


    if copy(aData,5,1) = '0' then //���� �̸�
    begin
      xData1[0].xGrade:= aData[10];
      xData1[0].xTime:= Convrtstr2Time(copy(aData,11,4));
      xData1[1].xGrade:= aData[15];
      xData1[1].xTime:= Convrtstr2Time(copy(aData,16,4));
      xData1[2].xGrade:= aData[20];
      xData1[2].xTime:= Convrtstr2Time(copy(aData,21,4));
      xData1[3].xGrade:= aData[25];
      xData1[3].xTime:= Convrtstr2Time(copy(aData,26,4));
      xData1[4].xGrade:= aData[30];
      xData1[4].xTime:= Convrtstr2Time(copy(aData,6,4));

      r := 0;
      ox := Panel1.Width - 2;
      for a := 0 to 4 do
      Begin
        timePanels1[a].Color := clAqua;
        Case xData1[a].xGrade of
          '0' : timePanels1[a].Color := clAqua;
          '1' : timePanels1[a].Color := clGreen;
          '2' : timePanels1[a].Color := clRed;
        end;
        if a = 0 then r := xData1[a].xTime
                 else r := xData1[a].xTime-xData1[a-1].xTime;

        timePanels1[a].Width := Round((ox) * (r));
        CheckFields1(timePanels1[a]);
      end;


    end else if copy(aData,5,1) = '1' then //����� �̸�
    begin
      xData2[0].xGrade:= aData[10];
      xData2[0].xTime:= Convrtstr2Time(copy(aData,11,4));
      xData2[1].xGrade:= aData[15];
      xData2[1].xTime:= Convrtstr2Time(copy(aData,16,4));
      xData2[2].xGrade:= aData[20];
      xData2[2].xTime:= Convrtstr2Time(copy(aData,21,4));
      xData2[3].xGrade:= aData[25];
      xData2[3].xTime:= Convrtstr2Time(copy(aData,26,4));
      xData2[4].xGrade:= aData[30];
      xData2[4].xTime:= Convrtstr2Time(copy(aData,6,4));

      r := 0;
      ox := Panel7.Width - 2;
      for a := 0 to 4 do
      Begin
        timePanels2[a].Color := clAqua;
        Case xData2[a].xGrade of
          '0' : timePanels2[a].Color := clAqua;
          '1' : timePanels2[a].Color := clGreen;
          '2' : timePanels2[a].Color := clRed;
        end;
        if a = 0 then r := xData2[a].xTime
                 else r := xData2[a].xTime-xData2[a-1].xTime;

        timePanels2[a].Width := Round((ox) * (r));
        CheckFields2(timePanels2[a]);
      end;


    end else if copy(aData,5,1) = '2' then //�Ͽ��� �̸�
    begin
      xData3[0].xGrade:= aData[10];
      xData3[0].xTime:= Convrtstr2Time(copy(aData,11,4));
      xData3[1].xGrade:= aData[15];
      xData3[1].xTime:= Convrtstr2Time(copy(aData,16,4));
      xData3[2].xGrade:= aData[20];
      xData3[2].xTime:= Convrtstr2Time(copy(aData,21,4));
      xData3[3].xGrade:= aData[25];
      xData3[3].xTime:= Convrtstr2Time(copy(aData,26,4));
      xData3[4].xGrade:= aData[30];
      xData3[4].xTime:= Convrtstr2Time(copy(aData,6,4));

      r := 0;
      ox := Panel21.Width - 2;
      for a := 0 to 4 do
      Begin
        timePanels3[a].Color := clAqua;
        Case xData3[a].xGrade of
          '0' : timePanels3[a].Color := clAqua;
          '1' : timePanels3[a].Color := clGreen;
          '2' : timePanels3[a].Color := clRed;
        end;
        if a = 0 then r := xData3[a].xTime
                 else r := xData3[a].xTime-xData3[a-1].xTime;

        timePanels3[a].Width := Round((ox) * (r));
        CheckFields3(timePanels3[a]);
      end;


    end else if copy(aData,5,1) = '3' then //Ư���� �̸�
    begin
      xData4[0].xGrade:= aData[10];
      xData4[0].xTime:= Convrtstr2Time(copy(aData,11,4));
      xData4[1].xGrade:= aData[15];
      xData4[1].xTime:= Convrtstr2Time(copy(aData,16,4));
      xData4[2].xGrade:= aData[20];
      xData4[2].xTime:= Convrtstr2Time(copy(aData,21,4));
      xData4[3].xGrade:= aData[25];
      xData4[3].xTime:= Convrtstr2Time(copy(aData,26,4));
      xData4[4].xGrade:= aData[30];
      xData4[4].xTime:= Convrtstr2Time(copy(aData,6,4));

      r := 0;
      ox := Panel43.Width - 2;
      for a := 0 to 4 do
      Begin
        timePanels4[a].Color := clAqua;
        Case xData4[a].xGrade of
          '0' : timePanels4[a].Color := clAqua;
          '1' : timePanels4[a].Color := clGreen;
          '2' : timePanels4[a].Color := clRed;
        end;
        if a = 0 then r := xData4[a].xTime
                 else r := xData4[a].xTime-xData4[a-1].xTime;

        timePanels4[a].Width := Round((ox) * (r));
        CheckFields4(timePanels4[a]);
      end;


    end;

end;

end.


