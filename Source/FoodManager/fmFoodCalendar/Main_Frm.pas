unit Main_Frm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, 
  Grids, ExtCtrls, StdCtrls, Menus, Registry, Buttons, ImgList, BKCalendar;

type
  TMain_Form = class(TForm)
    Panel_Top: TPanel;
    StaticText_Month: TStaticText;
    StaticText_Year: TStaticText;
    Button_PrevMonth: TSpeedButton;
    Button_NextMonth: TSpeedButton;
    Button_Today: TSpeedButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Button_Edit: TSpeedButton;
    Button_Delete: TSpeedButton;
    Button_About: TSpeedButton;
    PopupMenu_Month: TPopupMenu;
    Menu_Month01: TMenuItem;
    Menu_Month02: TMenuItem;
    Menu_Month03: TMenuItem;
    Menu_Month04: TMenuItem;
    Menu_Month05: TMenuItem;
    Menu_Month06: TMenuItem;
    Menu_Month07: TMenuItem;
    Menu_Month08: TMenuItem;
    Menu_Month09: TMenuItem;
    Menu_Month10: TMenuItem;
    Menu_Month11: TMenuItem;
    Menu_Month12: TMenuItem;
    Button_Skin: TSpeedButton;
    PopupMenu_Skin: TPopupMenu;
    Menu_Skin1: TMenuItem;
    Menu_Skin2: TMenuItem;
    ImageList1: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure CalendarChange(Sender: TObject);
    procedure CalendarDblClick(Sender: TObject);
    procedure CalendarKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Menu_SkinClick(Sender: TObject);
    procedure Menu_MonthClick(Sender: TObject);
    procedure PopupMenu_MonthPopup(Sender: TObject);
    procedure Button_PrevMonthClick(Sender: TObject);
    procedure Button_NextMonthClick(Sender: TObject);
    procedure Button_PrevYearClick(Sender: TObject);
    procedure Button_NextYearClick(Sender: TObject);
    procedure Button_TodayClick(Sender: TObject);
    procedure Button_CloseClick(Sender: TObject);
    procedure Button_DeleteClick(Sender: TObject);
    procedure Button_EditClick(Sender: TObject);
    procedure Button_AboutClick(Sender: TObject);
    procedure Button_SkinClick(Sender: TObject);
  private
    Calendar: TBKCalendar;
    procedure UpdateDate;
    procedure LoadConfig;
    procedure SaveConfig;
    procedure EditText;
  public
  end;

var
  Main_Form: TMain_Form;

implementation

uses
  DayTexts, Memo_Frm, Utils;

{$R *.dfm}

procedure TMain_Form.UpdateDate;
begin
  StaticText_Year.Caption := IntToStr( Calendar.Year ) + ' ';
  StaticText_Month.Caption := IntToStr( Calendar.Month );
  Button_Delete.Enabled := FileExists( GetDBFullName( Calendar.CalendarDate ) );
end;

procedure TMain_Form.CalendarChange(Sender: TObject);
begin
  UpdateDate;
end;

procedure TMain_Form.Button_PrevMonthClick(Sender: TObject);
begin
  Calendar.PrevMonth;
end;

procedure TMain_Form.Button_NextMonthClick(Sender: TObject);
begin
  Calendar.NextMonth;
end;

type
  AControl = class(TControl);
  
procedure TMain_Form.FormCreate(Sender: TObject);
begin
  Calendar := TBKCalendar.Create( nil );
  Calendar.Align := alClient;
  Calendar.Parent := Self;
  Calendar.OnChange := CalendarChange;
  Calendar.OnDblClick := CalendarDblClick;
  Calendar.OnKeyDown := CalendarKeyDown;

  LoadConfig;
  UpdateDate;

  AControl( Button_NextMonth ).PopupMenu := PopupMenu_Month;
  AControl( Button_PrevMonth ).PopupMenu := PopupMenu_Month;

  Screen.Cursors[1] := LoadCursor( HInstance, 'blackcursor' );
  Screen.Cursors[2] := LoadCursor( HInstance, 'redcursor' );
end;

procedure TMain_Form.Button_PrevYearClick(Sender: TObject);
begin
  Calendar.PrevYear;
end;

procedure TMain_Form.Button_NextYearClick(Sender: TObject);
begin
  Calendar.NextYear;
end;

procedure TMain_Form.Button_TodayClick(Sender: TObject);
begin
  Calendar.CalendarDate := Date;
end;

procedure TMain_Form.FormResize(Sender: TObject);
begin
  StaticText_Month.Left := ( Calendar.Width - StaticText_Month.Width ) div 2;
  StaticText_Year.Left := StaticText_Month.Left - StaticText_Year.Width;
end;

procedure TMain_Form.EditText;
begin
  with TMemo_Form.Create( nil ) do
   try
     GetDayText( Calendar.CalendarDate, Memo.Lines );
     if ShowModal = mrOK then
      begin
        SetDayText( Calendar.CalendarDate, Memo.Lines );
        Calendar.Repaint;
      end;
   finally
     Free;
   end;
end;

procedure TMain_Form.CalendarDblClick(Sender: TObject);
begin
  EditText;
end;

procedure TMain_Form.LoadConfig;
begin
  with CreateConfig do
   try
     Calendar.Skin := ReadInteger( 'Calendar', 'Skin', 1 );
     WindowState := TWindowState( ReadInteger( 'Window', 'State', Ord( wsNormal ) ) );
     SetBounds( ReadInteger( 'Window', 'Left', 0 ),
                ReadInteger( 'Window', 'Top', 0 ),
                ReadInteger( 'Window', 'Width', Screen.Width ),
                ReadInteger( 'Window', 'Height', Screen.Height ) );
   finally
     Free;
   end;
end;

procedure TMain_Form.SaveConfig;
begin
  with TRegIniFile.Create do
   try
     WriteInteger( 'Calendar', 'Skin', Calendar.Skin );
     WriteInteger( 'Window', 'State', Ord( WindowState ) );
     if WindowState = wsNormal then
      begin
        WriteInteger( 'Window', 'Left', Left );
        WriteInteger( 'Window', 'Top', Top );
        WriteInteger( 'Window', 'Width', Width );
        WriteInteger( 'Window', 'Height', Height );
      end;
   finally
     Free;
   end;
end;

procedure TMain_Form.FormDestroy(Sender: TObject);
begin
  SaveConfig;
  Calendar.Free;
end;

procedure TMain_Form.Button_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TMain_Form.Button_DeleteClick(Sender: TObject);
begin
  if MessageBox( Handle, '메모를 지울거냐?', '^^;', MB_YESNO or MB_ICONQUESTION ) = IDYES then
   begin
     DeleteDayText( Calendar.CalendarDate );
     Calendar.Repaint;
     UpdateDate;
   end;
end;

procedure TMain_Form.Button_EditClick(Sender: TObject);
begin
  EditText;
end;

procedure TMain_Form.Button_AboutClick(Sender: TObject);
begin
  ShowMessage( #13'고구마 v0.0001'#13#13'이거는 꽁짜다'#13#13'양병규 delmadang@hanmail.net' );
end;

type
  AGrid = class(TCustomGrid);
  
procedure TMain_Form.CalendarKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
  VK_RETURN: begin
               EditText;
             end;
  VK_DOWN: begin
             if Calendar.DaysThisMonth - Calendar.Day < 7 then
              begin
                Calendar.NextMonth;
                Calendar.Day := 1;
                Key := 0;
              end;
           end;
  VK_UP:   begin
             if Calendar.Day <= 7 then
              begin
                Calendar.PrevMonth;
                Calendar.Day := Calendar.DaysThisMonth;
                Key := 0;
              end;
           end;
  VK_LEFT: begin
             if Calendar.Day = 1 then
              begin
                Calendar.PrevMonth;
                Calendar.Day := Calendar.DaysThisMonth;
                Key := 0;
              end
             else
              begin
                Calendar.Day := Calendar.Day - 1;
                Key := 0;
              end;
           end;
  VK_RIGHT: begin
              if Calendar.Day = Calendar.DaysThisMonth then
               begin
                 Calendar.NextMonth;
                 Calendar.Day := 1;
                 Key := 0;
               end
              else
               begin
                 Calendar.Day := Calendar.Day + 1;
                 Key := 0;
               end;
            end;
  end;
end;

procedure TMain_Form.Menu_MonthClick(Sender: TObject);
begin
  Calendar.Month := StrToInt( TMenuItem( Sender ).Caption );
end;

procedure TMain_Form.PopupMenu_MonthPopup(Sender: TObject);
var
  i: Integer;
  M: String;
begin
  M := IntToStr( Calendar.Month );
  for i := 0 to TMenu( Sender ).Items.Count - 1 do
   if TMenu( Sender ).Items[i].Caption = M then
    begin
      TMenu( Sender ).Items[i].Checked := True;
      Exit;
    end;
end;

procedure TMain_Form.Button_SkinClick(Sender: TObject);
var
  APoint: TPoint;
begin
  APoint := TControl( Sender ).ClientToScreen( Point(0,0) );
  Inc( APoint.Y, TControl( Sender ).Height );
  PopupMenu_Skin.Popup( APoint.X, APoint.Y );
end;

procedure TMain_Form.Menu_SkinClick(Sender: TObject);
begin
  Calendar.Skin :=  TMenuItem( Sender ).MenuIndex;
end;

end.
