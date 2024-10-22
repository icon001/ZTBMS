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
  RzPanel, ADODB, uSubForm, CommandArray,ActiveX;

type


  {DoorMode ������ ����� Record}
  TTimeSch = record
    xGrade: Char;
    xTime: TDateTime;
  end;


  TDoorscheduleRegForm = class(TfmASubForm)
    RzGroupBox1: TRzGroupBox;
    PaintBox1: TPaintBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    pan_Week: TPanel;
    pan_W1: TPanel;
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
    pan_saturday: TPanel;
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
    Pan_sunday: TPanel;
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
    pan_holiday: TPanel;
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
    RzGroupBox4: TRzGroupBox;
    lbDoor: TListBox;
    btnSave: TRzBitBtn;
    btnClose: TRzBitBtn;
    btnSend: TRzBitBtn;
    Query_Sch: TADOQuery;
    Query_Door: TADOQuery;
    Panel57: TPanel;
    procedure Panel3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure pan_W1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure pan_W1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure pan_W1Resize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PaintBox1Paint(Sender: TObject);
    procedure pan_W1DblClick(Sender: TObject);
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
    procedure lbDoorClick(Sender: TObject);
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
  private
    { Private declarations }
    function LoadScheduleFormDB(aNodeNo,aECUID,DoorNo: string):Boolean;
    Procedure CheckFields1(Sender : TObject);
    Procedure CheckFields2(Sender : TObject);
    Procedure CheckFields3(Sender : TObject);
    Procedure CheckFields4(Sender : TObject);
    Procedure ScheduleDataSend(aNodeNo,aECUID,aDoorNO:string);
    procedure CreateSchedule(aNodeNo,aECUID,aDOORNO:string);
    function checkTB_DEVICESCHEDULE(aNodeNo,aECUID,aDOORNO:string):Boolean;
  public
    { Public declarations }
     DoorsList: TStringList;
     Procedure DbUpDate(aNodeNo,aECUID,aDoorNo,aDayCode:String;aSch:array of TTimeSch );

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

{$R *.dfm}
uses
  uDevicemodule,
  uDatamodule1,
  uServerDaemon;

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


procedure TDoorscheduleRegForm.pan_W1DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := False;
  if (Sender is TPanel) then Accept := Tpanel(Source).Tag = 1;
  CheckFields1(Sender);
end;

procedure TDoorscheduleRegForm.pan_W1DragDrop(Sender, Source: TObject; X,
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
    ox := pan_Week.Width - 2;
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
    ox := pan_saturday.Width - 2;
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
    ox := Pan_sunday.Width - 2;
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
    ox := pan_holiday.Width - 2;
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



procedure TDoorscheduleRegForm.pan_W1Resize(Sender: TObject);
begin
  CheckFields1(Sender);
end;


procedure TDoorscheduleRegForm.FormCreate(Sender: TObject);
begin

  timePanels1[0] := pan_W1;
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
  PaintBox1.Width := pan_Week.ClientRect.Right;
  dx := pan_Week.Width - 2;
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

procedure TDoorscheduleRegForm.pan_W1DblClick(Sender: TObject);
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

{DB���� �������� �о� �´�}
function TDoorscheduleRegForm.LoadScheduleFormDB(aNodeNo,aECUID,DoorNo: string):Boolean;
var
  I: Integer;
  stSql : string;

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

  LoadScheduleFormDB:= False;
  stSql := 'SELECT * ';
  stSql := stSql + ' FROM TB_DEVICESCHEDULE ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ''' + DoorNo + ''' ';
  with Query_Sch do
  begin
    Close;
    SQL.Clear;
    Sql.Text := stSql;

    Try
      Open;
    Except
      Exit;
    End;


    if RecordCount > 0 then
    begin
      LoadScheduleFormDB:= True;
      First;
      while Not Eof do
      begin
        if findField('DE_DAYCODE').AsString = '0' then
        begin
          {����}
          xData1[0].xGrade:= FindField('DE_CELL1MODE').asString[1];
          xData1[0].xTime:= Convrtstr2Time(FindField('DE_CELL1TIME').asString);
          xData1[1].xGrade:= FindField('DE_CELL2MODE').asString[1];
          xData1[1].xTime:= Convrtstr2Time(FindField('DE_CELL2TIME').asString);
          xData1[2].xGrade:= FindField('DE_CELL3MODE').asString[1];
          xData1[2].xTime:= Convrtstr2Time(FindField('DE_CELL3TIME').asString);
          xData1[3].xGrade:= FindField('DE_CELL4MODE').asString[1];
          xData1[3].xTime:= Convrtstr2Time(FindField('DE_CELL4TIME').asString);
          xData1[4].xGrade:= FindField('DE_CELL5MODE').asString[1];
          xData1[4].xTime:= Convrtstr2Time(FindField('DE_CELL5TIME').asString);
        end else if findField('DE_DAYCODE').AsString = '1' then
        begin
          {������}
          xData2[0].xGrade:= FindField('DE_CELL1MODE').asString[1];
          xData2[0].xTime:= Convrtstr2Time(FindField('DE_CELL1TIME').asString);
          xData2[1].xGrade:= FindField('DE_CELL2MODE').asString[1];
          xData2[1].xTime:= Convrtstr2Time(FindField('DE_CELL2TIME').asString);
          xData2[2].xGrade:= FindField('DE_CELL3MODE').asString[1];
          xData2[2].xTime:= Convrtstr2Time(FindField('DE_CELL3TIME').asString);
          xData2[3].xGrade:= FindField('DE_CELL4MODE').asString[1];
          xData2[3].xTime:= Convrtstr2Time(FindField('DE_CELL4TIME').asString);
          xData2[4].xGrade:= FindField('DE_CELL5MODE').asString[1];
          xData2[4].xTime:= Convrtstr2Time(FindField('DE_CELL5TIME').asString);
        end else if findField('DE_DAYCODE').AsString = '2' then
        begin
          {�Ͽ���}
          xData3[0].xGrade:= FindField('DE_CELL1MODE').asString[1];
          xData3[0].xTime:= Convrtstr2Time(FindField('DE_CELL1TIME').asString);
          xData3[1].xGrade:= FindField('DE_CELL2MODE').asString[1];
          xData3[1].xTime:= Convrtstr2Time(FindField('DE_CELL2TIME').asString);
          xData3[2].xGrade:= FindField('DE_CELL3MODE').asString[1];
          xData3[2].xTime:= Convrtstr2Time(FindField('DE_CELL3TIME').asString);
          xData3[3].xGrade:= FindField('DE_CELL4MODE').asString[1];
          xData3[3].xTime:= Convrtstr2Time(FindField('DE_CELL4TIME').asString);
          xData3[4].xGrade:= FindField('DE_CELL5MODE').asString[1];
          xData3[4].xTime:= Convrtstr2Time(FindField('DE_CELL5TIME').asString);
        end else if findField('DE_DAYCODE').AsString = '3' then
        begin
          {����}
          xData4[0].xGrade:= FindField('DE_CELL1MODE').asString[1];
          xData4[0].xTime:= Convrtstr2Time(FindField('DE_CELL1TIME').asString);
          xData4[1].xGrade:= FindField('DE_CELL2MODE').asString[1];
          xData4[1].xTime:= Convrtstr2Time(FindField('DE_CELL2TIME').asString);
          xData4[2].xGrade:= FindField('DE_CELL3MODE').asString[1];
          xData4[2].xTime:= Convrtstr2Time(FindField('DE_CELL3TIME').asString);
          xData4[3].xGrade:= FindField('DE_CELL4MODE').asString[1];
          xData4[3].xTime:= Convrtstr2Time(FindField('DE_CELL4TIME').asString);
          xData4[4].xGrade:= FindField('DE_CELL5MODE').asString[1];
          xData4[4].xTime:= Convrtstr2Time(FindField('DE_CELL5TIME').asString);
        end;
        Next;
      end;
    end else
    begin
      CreateSchedule(aNodeNo,aECUID,DOORNO);
{      for I:= 0 to 3 do
      begin
        stSql := ' Insert Into TB_DEVICESCHEDULE ';
        stSql := stSql + '( GROUP_CODE,AC_NODENO,AC_ECUID,DO_DOORNO,DE_DAYCODE,';
        stSql := stSql + ' DE_CELL1TIME,DE_CELL1MODE,DE_CELL2TIME,DE_CELL2MODE,';
        stSql := stSql + ' DE_CELL3TIME,DE_CELL3MODE,DE_CELL4TIME,DE_CELL4MODE,';
        stSql := stSql + ' DE_CELL5TIME,DE_CELL5MODE,DE_UPDATETIME,DE_UPDATEOPERATOR,';
        stSql := stSql + ' DE_RCVACK ) ';
        stSql := stSql + ' Values(''' + GROUPCODE + ''',';
        stSql := stSql + aNodeNo + ',';
        stSql := stSql + '''' + aECUID + ''',';
        stSql := stSql + '''' + DOORNO + ''',';
        stSql := stSql + '''' + inttostr(I) + ''',';
        stSql := stSql + '''0500'',';
        stSql := stSql + '''1'',';
        stSql := stSql + '''1200'',';
        stSql := stSql + '''1'',';
        stSql := stSql + '''1300'',';
        stSql := stSql + '''1'',';
        stSql := stSql + '''1800'',';
        stSql := stSql + '''1'',';
        stSql := stSql + '''0000'',';
        stSql := stSql + '''1'',';
        stSql := stSql + '''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',';
        stSql := stSql + '''' + Master_ID + ''',';
        stSql := stSql + '''N'')';

        DataModule1.ProcessExecSQL(stSql);

      end; }
      ShowMessage('������ �����Ͱ� ���� �Ǿ����ϴ�.');
    end;
  end;
end;

procedure TDoorscheduleRegForm.FormShow(Sender: TObject);
Var
  a : Integer;
  r : TDateTime;
  ox  : Integer;
  st: string;
  aDoorType: Integer;
  stSql : string;

begin
  DoorList := TstringList.Create;
  DoorList.Clear;

  stSql := 'Select a.DO_DOORNONAME,a.AC_NODENO,a.AC_ECUID,a.DO_DOORNO';
  stSql := stSql + ' from TB_DOOR a ';
  stSql := stSql + ' Inner Join TB_ACCESSDEVICE b ';
  stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + '      AND a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + '      AND a.AC_ECUID = b.AC_ECUID ';
  stSql := stSql + '      AND b.AC_ACTYPE = ''1'') ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + '''';
  stSql := stSql + ' AND a.DO_SCHUSE = ''1'' ';

  lbDoor.Clear;
  with Query_Door do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    First;
    lbDoor.Items.Add('000.��ü');
    DoorList.Add('000.��ü');
    while not eof do
    begin
        st:= FillZeroNumber(FindField('AC_NODENO').AsInteger,3) + FindField('AC_ECUID').asString + FindField('DO_DOORNO').asString;
        lbDoor.Items.Add(FindField('DO_DOORNONAME').asString);
        DoorList.Add(st);
      Next;
    end;
  end;
  lbDoor.ItemIndex:= 0;
  lbDoorClick(Self);
  Screen.Cursor:= crDefault;
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
  PaintBox2.Width := pan_saturday.ClientRect.Right;
  dx := pan_saturday.Width - 2;
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
  PaintBox3.Width := Pan_sunday.ClientRect.Right;
  dx := Pan_sunday.Width - 2;
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
  PaintBox4.Width := pan_holiday.ClientRect.Right;
  dx := pan_holiday.Width - 2;
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
//  self.FindSubForm('Main').FindCommand('SCHEDULE').Execute;
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
  ox := pan_Week.Width - 2;
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
  ox := pan_saturday.Width - 2;
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
  ox := Pan_sunday.Width - 2;
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
  ox := pan_holiday.Width - 2;
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

{����� ������ ���� ����}
procedure TDoorscheduleRegForm.lbDoorClick(Sender: TObject);
var
  a : Integer;
  r : TDateTime;
  ox  : Integer;
  aPortNo: Integer;
  aACUCode: String;
  stTemp : string;
  stNodeNO,stECUID,stDOORNO : string;
begin
  if lbDoor.ItemIndex < 1 then Exit;
  stTemp := DoorList.Strings[lbDoor.ItemIndex];
  stNodeNO := inttostr(strtoint(copy(stTemp,1,3)));
  stECUID := copy(stTemp,4,2);
  stDoorNo := copy(stTemp,6,1);
  LoadScheduleFormDB(stNodeNO,stECUID,stDoorNo);

  for a:= 0 to 4 do
  Begin
    timePanels1[a].Align := alNone;
    timePanels1[a].Width := 10;
    timePanels1[a].Left := 700;

    timePanels2[a].Align := alNone;
    timePanels2[a].Width := 10;
    timePanels2[a].Left := 700;

    timePanels3[a].Align := alNone;
    timePanels3[a].Width := 10;
    timePanels3[a].Left := 700;

    timePanels4[a].Align := alNone;
    timePanels4[a].Width := 10;
    timePanels4[a].Left := 700;
  end;

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

  r := 0;
  ox := pan_Week.Width - 2;
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
  end;
  CheckFields1(timePanels1[0]);

  r := 0;
  ox := pan_saturday.Width - 2;
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
  end;
  CheckFields2(timePanels2[0]);

  r := 0;
  ox := Pan_sunday.Width - 2;
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
  end;
  CheckFields3(timePanels3[0]);

  r := 0;
  ox := pan_holiday.Width - 2;
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
  stNodeNo,stECUID,stDoorNO : string;
begin

  Screen.Cursor:= crHourGlass;

  ox := pan_Week.Width - 2;
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

  if lbDoor.ItemIndex = 0 then
  begin

    if MessageDlg('��ϵ� ����ü �������� ���� �Ͻðڽ��ϱ�?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      for I:= 1 to lbDoor.Count - 1 do
      begin
        stNodeNo := inttostr(strtoint(copy(DoorList.Strings[I],1,3)));
        stECUID := copy(DoorList.Strings[I],4,2);
        stDoorNO := copy(DoorList.Strings[I],6,1);
        CreateSchedule(stNodeNo,stECUID,stDoorNO);
        DbUpDate(stNodeNo,stECUID,stDoorNO,'0',xData1);
        DbUpDate(stNodeNo,stECUID,stDoorNO,'1',xData2);
        DbUpDate(stNodeNo,stECUID,stDoorNO,'2',xData3);
        DbUpDate(stNodeNo,stECUID,stDoorNO,'3',xData4);
        ScheduleDataSend(stNodeNo,stECUID,stDoorNO); //������ ����
      end;
    end else
    begin
      Exit;
    end;

  end else
  begin
    stNodeNo := inttostr(strtoint(copy(DoorList.Strings[lbDoor.ItemIndex],1,3)));
    stECUID := copy(DoorList.Strings[lbDoor.ItemIndex],4,2);
    stDoorNO := copy(DoorList.Strings[lbDoor.ItemIndex],6,1);
    DbUpDate(stNodeNo,stECUID,stDoorNO,'0',xData1);
    DbUpDate(stNodeNo,stECUID,stDoorNO,'1',xData2);
    DbUpDate(stNodeNo,stECUID,stDoorNO,'2',xData3);
    DbUpDate(stNodeNo,stECUID,stDoorNO,'3',xData4);
    ScheduleDataSend(stNodeNo,stECUID,stDoorNO); //������ ����
  end;

  Screen.Cursor:= crDefault;
  ShowMessage('���� �Ǿ����ϴ�.');
  //ShowMsg('�����쵥���͸� ���� �߽��ϴ�.',3000);

end;


Procedure TDoorscheduleRegForm.DbUpDate(aNodeNo,aECUID,aDoorNo,aDayCode:String;aSch:array of TTimeSch );
var
  stSql : string;
begin

  stSql := 'update TB_DEVICESCHEDULE ';
  stSql := stSql + ' Set ';
  stSql := stSql + ' DE_CELL1TIME = ''' + Formatdatetime('hhnn',aSch[0].xTime) + ''', ';
  stSql := stSql + ' DE_CELL1MODE = ''' + aSch[0].xGrade + ''', ';
  stSql := stSql + ' DE_CELL2TIME = ''' + Formatdatetime('hhnn',aSch[1].xTime) + ''', ';
  stSql := stSql + ' DE_CELL2MODE = ''' + aSch[1].xGrade + ''', ';
  stSql := stSql + ' DE_CELL3TIME = ''' + Formatdatetime('hhnn',aSch[2].xTime) + ''', ';
  stSql := stSql + ' DE_CELL3MODE = ''' + aSch[2].xGrade + ''', ';
  stSql := stSql + ' DE_CELL4TIME = ''' + Formatdatetime('hhnn',aSch[3].xTime) + ''', ';
  stSql := stSql + ' DE_CELL4MODE = ''' + aSch[3].xGrade + ''', ';
  stSql := stSql + ' DE_CELL5TIME = ''' + Formatdatetime('hhnn',aSch[4].xTime) + ''', ';
  stSql := stSql + ' DE_CELL5MODE = ''' + aSch[4].xGrade + ''', ';
  stSql := stSql + ' DE_UPDATETIME = ''' + FormatDatetime('yyyymmddhhnnss',now) + ''', ';
  stSql := stSql + ' DE_UPDATEOPERATOR = ''' + Master_ID + ''',';
  stSql := stSql + ' DE_RCVACK = ''N'' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ''' + aDoorNo + ''' ';
  stSql := stSql + ' AND DE_DAYCODE = ''' + aDayCode + ''' ';

  if Not DataModule1.ProcessExecSQL(stSql) then
  begin
      Application.MessageBox (PChar('������������ �����߽��ϴ�!'),
                              PChar(Caption),MB_ICONSTOP or MB_OK);
  end;

end;

procedure TDoorscheduleRegForm.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TDoorscheduleRegForm.btnSendClick(Sender: TObject);
var
  st:         string;
  aDeviceID:  String;
  aDoor:      Char;
  aDoorIndex: Integer;
  aDay:       Char;
  aData:      String;
  aIndex:     Integer;
  aDevice:    TDevice;

begin

  aDoorIndex:= lbDoor.ItemIndex;
  if aDoorIndex  < 1 then
  begin
    ShowMessage('��ü�� ������ �Ұ��� �մϴ�.');
    Exit;
  end;
 {
  with Query_Sch do
  begin

    SQL.Clear;
    SQL.Add('SELECT DOOR_CODE,DAY_CODE,CELL1_TIME,CELL1_MODE,CELL2_TIME,CELL2_MODE,');
    SQL.Add('CELL3_TIME,CELL3_MODE,CELL4_TIME,CELL4_MODE,CELL5_TIME,CELL5_MODE,DEVICE_ID,DOOR_NO');
    SQL.Add('FROM TB_DOORSCH');
    SQL.Add('WHERE DOOR_CODE = :DOOR_CODE');
    ParambyName('DOOR_CODE').asInteger:= aDoorIndex;
    Active:= True;
    if RecordCount > 0 then
    begin
      aDeviceID:= FindField('DEVICE_ID').asString;
      First;
      While not eof do
      begin
        aDoor:= FindField('DOOR_NO').asString[1];
        aDay := FindField('DAY_CODE').asString[1];
        aData:= FindField('CELL5_TIME').asString + FindField('CELL1_MODE').asString+
                FindField('CELL1_TIME').asString + FindField('CELL2_MODE').asString+
                FindField('CELL2_TIME').asString + FindField('CELL3_MODE').asString+
                FindField('CELL3_TIME').asString + FindField('CELL4_MODE').asString+
                FindField('CELL4_TIME').asString + FindField('CELL5_MODE').asString;

         aDevice:= fmMain.GetDevice(aDeviceID);
         if aDevice <> nil then
         begin
            aDevice.SendDoorSchadule(aDoor,aDay,aData);
         end;
         Next;
      end;
    end;
  end;
  //ShowMessage('������ ������ ���� �߽��ϴ�.');   }
end;

Procedure TDoorscheduleRegForm.ScheduleDataSend(aNodeNo,aECUID,aDoorNO:string);
var
  st:         string;
  aDeviceID:  String;
  aDoor:      Char;
  aDoorIndex: Integer;
  aDay:       Char;
  aData:      String;
  aIndex:     Integer;
  aDevice:    TDevice;
  stSql : string;

begin

  stSql := 'SELECT * ';
  stSql := stSql + ' FROM TB_DEVICESCHEDULE ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ''' + aDoorNO + ''' ';

  with Query_Sch do
  begin
    Close;
    SQL.Clear;
    SQL.Text := stSql;

    Try
      Open;
    Except
      Exit;
    End;
    if RecordCount > 0 then
    begin
//      aDeviceID:= FindField('DEVICE_ID').asString;
      First;
      While not eof do
      begin
        aDoor:= FindField('DO_DOORNO').asString[1];
        aDay := FindField('DE_DAYCODE').asString[1];
        aData:= FindField('DE_CELL5TIME').asString + FindField('DE_CELL1MODE').asString+
                FindField('DE_CELL1TIME').asString + FindField('DE_CELL2MODE').asString+
                FindField('DE_CELL2TIME').asString + FindField('DE_CELL3MODE').asString+
                FindField('DE_CELL3TIME').asString + FindField('DE_CELL4MODE').asString+
                FindField('DE_CELL4TIME').asString + FindField('DE_CELL5MODE').asString;

         aDevice:= fmMain.GetDevice(FillZeroNumber(strtoint(aNodeNo),3) + aECUID );
         if aDevice <> nil then
         begin
            aDevice.SendDoorSchadule(aDoor,aDay,aData);
         end;
         Next;
      end;
    end;
  end;
  //ShowMessage('������ ������ ���� �߽��ϴ�.');   
end;

procedure TDoorscheduleRegForm.CreateSchedule(aNodeNo, aECUID,
  aDOORNO: string);
var
  i : integer;
  stSql : string;
begin
  if checkTB_DEVICESCHEDULE(aNodeNo,aECUID,aDOORNO) then Exit;

  for I:= 0 to 3 do
  begin
    stSql := ' Insert Into TB_DEVICESCHEDULE ';
    stSql := stSql + '( GROUP_CODE,AC_NODENO,AC_ECUID,DO_DOORNO,DE_DAYCODE,';
    stSql := stSql + ' DE_CELL1TIME,DE_CELL1MODE,DE_CELL2TIME,DE_CELL2MODE,';
    stSql := stSql + ' DE_CELL3TIME,DE_CELL3MODE,DE_CELL4TIME,DE_CELL4MODE,';
    stSql := stSql + ' DE_CELL5TIME,DE_CELL5MODE,DE_UPDATETIME,DE_UPDATEOPERATOR,';
    stSql := stSql + ' DE_RCVACK ) ';
    stSql := stSql + ' Values(''' + GROUPCODE + ''',';
    stSql := stSql + aNodeNo + ',';
    stSql := stSql + '''' + aECUID + ''',';
    stSql := stSql + '''' + aDOORNO + ''',';
    stSql := stSql + '''' + inttostr(I) + ''',';
    stSql := stSql + '''0500'',';
    stSql := stSql + '''1'',';
    stSql := stSql + '''1200'',';
    stSql := stSql + '''1'',';
    stSql := stSql + '''1300'',';
    stSql := stSql + '''1'',';
    stSql := stSql + '''1800'',';
    stSql := stSql + '''1'',';
    stSql := stSql + '''0000'',';
    stSql := stSql + '''1'',';
    stSql := stSql + '''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',';
    stSql := stSql + '''' + Master_ID + ''',';
    stSql := stSql + '''N'')';

    DataModule1.ProcessExecSQL(stSql);
  end;
end;

function TDoorscheduleRegForm.checkTB_DEVICESCHEDULE(aNodeNo, aECUID,
  aDOORNO: string): Boolean;
var
  stSql : string;
  TempAdoQuery:TADOQuery;
begin
  result := False;

  stSql := 'SELECT * ';
  stSql := stSql + ' FROM TB_DEVICESCHEDULE ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ''' + aDOORNO + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;

    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      if RecordCount < 1 then
      begin
        Exit;
      end;
      result := True;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

end.


