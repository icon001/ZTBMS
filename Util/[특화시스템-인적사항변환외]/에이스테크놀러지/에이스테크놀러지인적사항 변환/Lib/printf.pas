unit Printf;
interface

uses
  Clipbrd,
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls,menus;

type
  TPositions = (poTopLeft,poBottomLeft,poTopRight,poBottomRight);
  TWinStyle  = (fwsNormal, fwsStayOnTop);

  TPrintf = class(TComponent)
  private
    PrintfForm  : TForm;
    PrintfList  : TListBox;
    pStatusBar  : TStatusBar;
    PopupMenu1  : TPopupMenu;
    N1          : TMenuItem;
    N2          : TMenuItem;
    N3          : TMenuItem;
    N4          : TMenuItem;
    N5          : TMenuItem;
    FActive     : Boolean;
    FPosition   : TPositions;
    FWidth      : Integer;
    FHeight     : Integer;
    FStayOnTop  : TWinStyle;
    FSaveToFile : Boolean;
    Ffont       : TFont;
    FColor      : TColor;
    FCaption    : String;
    FTimePrint  : Boolean;
    FTopIndex   : Boolean;
    FOnDblClick : TNotifyEvent;

    procedure SetActive(A: boolean);
    procedure SetPosition(A: TPositions);
    procedure SetWidth(A: Integer);
    procedure SetHeight(A: Integer);
    procedure SetCaption(A: String);
    procedure SetFont(A: TFont);
    procedure SetColor(A: TColor);
    procedure SetStayOnTop(A: TWinStyle);
    procedure SetSaveToLogFile(A: Boolean);
    procedure SetTimePrint(A: Boolean);
    procedure SetTopIndex;

    procedure DblClick( Sender : TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);

  protected
    property  OnDblClick : TNotifyEvent read FOnDblClick Write FOnDblClick;
    procedure ListBoxDrawItem(Control: TWinControl; Index: Integer; Rect:TRect;State: TOwnerDrawState);
    procedure PrintfFormClose(Sender: TObject; var Action: TCloseAction);
  public
    ViewMode    : Boolean;
    FItemCount  : LongInt;
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy;
    procedure   Printf(Str : string; Args : array of const);
    procedure   Trace(Str : string);
    procedure   Save;
    procedure   Init;
    procedure   Clear;

  published
    property Active : Boolean read FActive write SetActive default True;
    property Caption: String read FCaption write SetCaption;
    property Color  : TColor read FColor   write SetColor;
    property Position: TPositions read FPosition write SetPosition default poTopLeft;
    property StayOnTop : TWinStyle read FStayOnTop write SetStayOnTop default fwsNormal;
    property SaveToFile : Boolean read FSaveToFile write SetSaveToLogFile default True;
    property Width: Integer read FWidth write SetWidth default 250;
    property Height: Integer read FHeight write SetHeight default 200;
    property Font: TFont read FFont write SetFont;
    property TimePrint : Boolean read FTimePrint write SetTimePrint;
  end;



implementation

procedure TPrintf.SetActive(A: boolean);
begin
   FActive := A;
   if not (csDesigning in ComponentState) then
     if A then begin
        PrintfForm.Show;
        PrintfList.Font := FFont;
     end
     else
       PrintfForm.Hide;
end;

constructor TPrintf.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FActive  := True;
  FFont    := TFont.Create;
  FWidth   := 400;
  FHeight  := 120;
  FCaption := 'Monitering Window';
  FSaveToFile := False;
  FItemCount  := 0;
  FTimePrint := True;
  FColor   := clWhite;
  FFont.Name := '굴림체';
  FFont.Size := 9;
  FFont.Color:= clBlack;

  if not (csDesigning in ComponentState) then
    begin
      PrintfForm := TForm.Create(Application);
      with PrintfForm do
        begin
          Caption := FCaption;
          BorderStyle := bsSizeable;
          onClose:= PrintfFormClose;
        end;


      pStatusBar := TStatusBar.Create(PrintfForm);
      with pStatusBar do begin
        Parent := PrintfForm;
        Font.Name := '굴림체';
        Font.Size := 9;
        Panels.Add;
        Panels.Add;
        Panels[0].Width := 120;
        Panels[0].Text  := '윈도우 상태: 표준';
        Panels[1].Width := 200;
        Panels[1].Text  := '더블클릭:메시지추적';
        OnDblClick := DblClick;
      end;

      PrintfList := TListBox.Create(PrintfForm);
      with PrintfList do
      begin
        Parent     := PrintfForm;
        Align      := alClient;
        Font       := FFont;
        Color      := FColor;
        MultiSelect:= True;
        OnDrawItem := ListBoxDrawItem;
        Style      := lbOwnerDrawFixed;
      end;

      PopupMenu1:= TPopupMenu.Create(PrintfForm);
      N1:= TMenuItem.Create(PopupMenu1);
      N1.Caption := '시간표시';
      N1.onClick := N1Click;
      N1.Checked:= True;
      PopupMenu1.Items.Add(N1);

      N2:= TMenuItem.Create(PopupMenu1);
      N2.Caption := '클립보드로 복사';
      N2.onClick := N2Click;
      PopupMenu1.Items.Add(N2);

      N3:= TMenuItem.Create(PopupMenu1);
      N3.Caption := '화면 초기화';
      N3.onClick := N3Click;
      PopupMenu1.Items.Add(N3);

      N4:= TMenuItem.Create(PopupMenu1);
      N4.Caption := '파일저장';
      N4.onClick := N4Click;
      PopupMenu1.Items.Add(N4);

      N5:= TMenuItem.Create(PopupMenu1);
      N5.Caption := '화면조회';
      N5.onClick := N5Click;
      N5.Checked:= False;
      PopupMenu1.Items.Add(N5);
      ViewMode:= False;

      PrintfForm.PopupMenu := PopupMenu1;
    end;
end;

destructor TPrintf.Destroy;
begin
    FFont.Free;
    PrintfList.Free;
    inherited destroy;
end;


procedure TPrintf.PrintfFormClose(Sender: TObject; var Action: TCloseAction);
begin
  FActive:= False;
end;

procedure TPrintf.Clear;
begin
    if FActive then begin
      PrintfList.Clear;
      FItemCount := 0;
    end;
end;

procedure TPrintf.SetStayOnTop(A: TWinStyle);
begin
  FStayOnTop := A;
  if not (csDesigning in ComponentState) then
     if A = fwsNormal then PrintfForm.FormStyle := fsNormal
     else PrintfForm.FormStyle := fsStayOnTop;

end;

procedure TPrintf.SetTopIndex;
begin
    PrintfList.TopIndex := FItemCount-1;
end;

procedure TPrintf.DblClick;
begin
  if Assigned(OnDblClick) then OnDblClick(pStatusBar);
  FTopIndex := not FTopIndex;
  if FTopIndex then
    pStatusBar.Panels[1].Text  := '메시지 추적 모드'
  else
    pStatusBar.Panels[1].Text  := '메시지 추적 해제';

end;

procedure TPrintf.Init;
begin
    if FActive then begin
      PrintfForm.Show;
      PrintfList.Font := FFont;
      if StayOnTop = fwsNormal then
        pStatusBar.Panels[0].Text  := '윈도우 상태: 표준'
      else
        pStatusBar.Panels[0].Text  := '윈도우 상태: 항상 위';
    end;
end;

procedure TPrintf.Save;
var
  filename : string;
begin
     if Factive then begin
       filename :='c:\sams'+FormatDateTime('yymmdd',Now)+'.TXT';
       PrintfList.Items.SaveToFile(filename);
     end;
end;

procedure TPrintf.Printf(Str : string; Args : array of const);
var
   s : string;
begin
    {if FActive then begin}
      if ViewMode then Exit;

      if FTimePrint then
          S := Format(FormatDateTime('yyyy/mm/dd hh:nn:ss:zzz',Now)+'  '+Str, Args)
      else
          S := Format(Str, Args);
      try
        //PrintfList.Items.Add(s);
        PrintfList.Items.Insert(0,s);

        if FItemCount > 1000 then PrintfList.Items.Delete(FItemCount)
        else inc(FItemCount);

        if FTopIndex then SetTopIndex;
      except
        on EOutOfResources do begin
          if FSaveToFile then Save;
          PrintfList.Clear;
        end;
      end;
    {end;}
end;

procedure TPrintf.Trace(Str : string);
begin
    if ViewMode then Exit;
    
    if FActive then begin
      try
        if FTimePrint then
          PrintfList.Items.Insert(0,FormatDateTime('yyyy/mm/dd hh:nn:ss:zzz',Now)+'  '+Str)
        else
          PrintfList.Items.Insert(0,Str);

        if FItemCount > 1000 then PrintfList.Items.Delete(FItemCount)
        else inc(FItemCount);

        if FTopIndex then
           SetTopIndex;
      except
        on EOutOfResources do begin
          if FSaveToFile then Save;
          PrintfList.Clear;
        end;
      end;
    end;
end;



procedure TPrintf.ListBoxDrawItem(Control: TWinControl; Index: Integer; Rect:TRect;State: TOwnerDrawState);
var
  st: string;
begin

  st:= PrintfList.Items[Index];
  with (Control as TListBox).Canvas do
  begin
    if Pos('[TX]',st) > 0 then
    begin
      Font.Color:=clBlue;
      TextOut(Rect.Left + 2, Rect.Top,st);
    end else if Pos('[RX]',st) > 0 then
    begin
      Font.Color:= clGreen;
      TextOut(Rect.Left + 2, Rect.Top,st);
    end else if Pos('OFF',st) > 0 then
    begin
      Font.Color:= clRed;
      TextOut(Rect.Left + 2, Rect.Top,st);
    end  else
    begin
      Font.Color:= clBlack;
      TextOut(Rect.Left + 2, Rect.Top,st);
    end;

    if  odSelected in State then
    begin
      Font.Color:= clWhite;
      TextOut(Rect.Left + 2, Rect.Top,st);
    end;

  end;

end;
procedure TPrintf.SetSaveToLogFile(A: Boolean);
begin
    FSaveToFile := A;
end;

procedure TPrintf.SetPosition(A: TPositions);
begin
  FPosition := A;
  if not (csDesigning in ComponentState) then
    case A of
      poTopLeft     : PrintfForm.SetBounds(0,0,Width,Height);
      poBottomLeft  : PrintfForm.SetBounds(0,Screen.Height-Height,Width,Height);
      poTopRight    : PrintfForm.SetBounds(Screen.Width-Width,0,Width,Height);
      poBottomRight : PrintfForm.SetBounds(Screen.Width-Width,Screen.Height-Height,Width,Height);
    end;
end;

procedure TPrintf.SetWidth(A: Integer);
begin
  FWidth := A;
  if not (csDesigning in ComponentState) then
    begin
      PrintfForm.Width := FWidth;
      SetPosition(FPosition);
    end;
end;

procedure TPrintf.SetHeight(A: Integer);
begin
  FHeight := A;
  if not (csDesigning in ComponentState) then
    begin
       PrintfForm.Height := FHeight;
      SetPosition(FPosition);
    end;
end;

procedure TPrintf.SetCaption(A: String);
begin
  FCaption := A;
  if not (csDesigning in ComponentState) then
    PrintfForm.Caption := FCaption;
end;

procedure TPrintf.SetFont(A: TFont);
begin
  FFont.Assign(A);
end;

procedure TPrintf.SetColor(A: TColor);
begin
  FColor := A;
  if not (csDesigning in ComponentState) then
    PrintfList.Color := FColor;
end;

procedure TPrintf.SetTimePrint(A: Boolean);
begin
  FTimePrint := A;
end;

procedure TPrintf.N1Click(Sender: TObject);
begin
{시간표시}
  if N1.Checked then
  begin
    N1.Checked:= False;
    TimePrint:= False;
  end else
  begin
    N1.Checked:= True;
    TimePrint := True;
  end;

end;

procedure TPrintf.N2Click(Sender: TObject);
var
  st: string;
begin
  {클립보드 복사}
  //ListBoxToClipBoard(PrintfList,4096,False);
  st:= PrintfList.Items[PrintfList.ItemIndex];
  ClipBoard.SetTextBuf(PChar(st));

end;

procedure TPrintf.N3Click(Sender: TObject);
begin
  {화면 CLear}
  Clear;
end;

procedure TPrintf.N4Click(Sender: TObject);
begin
  {저장}
  Save;
end;

procedure TPrintf.N5Click(Sender: TObject);
begin
  if ViewMode then
  begin
    ViewMode:= False;
    N5.Checked:= False;
  end else
  begin
    ViewMode:= True;
    N5.Checked:= True;
  end;

end;

end.



