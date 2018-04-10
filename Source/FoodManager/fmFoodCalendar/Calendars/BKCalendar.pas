unit BKCalendar;

interface

uses
  Windows, Classes, Controls, StdCtrls, Messages, Graphics, Forms, Grids, SysUtils, Calendar;

type
  TBKCalendar = class(TCalendar)
  private
    FSkin: Integer;
    procedure UpdateRowHeights;
    procedure SetSkin(const Value: Integer);
  protected
    procedure Change; override;
    procedure DrawCell(ACol, ARow: Longint; ARect: TRect; AState: TGridDrawState); override;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    function DoMouseWheelDown(Shift: TShiftState; MousePos: TPoint): Boolean; override;
    function DoMouseWheelUp(Shift: TShiftState; MousePos: TPoint): Boolean; override;
  public
    constructor Create(AOwner: TComponent); override;
    function DaysThisMonth: Integer; override;
  published
    property Skin: Integer read FSkin write SetSkin;
  end;

implementation

uses
  DayTexts, SolarLunar;

type
  TLegalHoliday = record
    M: Word;
    D: Word;
    Name: String;
    Lunar: Boolean;
    Red: Boolean;
  end;

  TLegalHolidayTable = array[0..18] of TLegalHoliday;

const
  LegalHolidayTbl: TLegalHolidayTable = (
{���}
   ( M: 1 ; D: 1 ; Name: '����'        ; Lunar: False; Red: True  ),
   ( M: 3 ; D: 1 ; Name: '3.1��'       ; Lunar: False; Red: True  ),
   ( M: 4 ; D: 5 ; Name: '�ĸ���'      ; Lunar: False; Red: True  ),
   ( M: 5 ; D: 1 ; Name: '�ٷ����ǳ�'  ; Lunar: False; Red: False ),
   ( M: 5 ; D: 5 ; Name: '��̳�'    ; Lunar: False; Red: True  ),
   ( M: 5 ; D: 8 ; Name: '����̳�'    ; Lunar: False; Red: False ),
   ( M: 5 ; D: 15; Name: '�����ǳ�'    ; Lunar: False; Red: False ),
   ( M: 5 ; D: 19; Name: '�����ǳ�'    ; Lunar: False; Red: False ),
   ( M: 6 ; D: 6 ; Name: '������'      ; Lunar: False; Red: True  ),
   ( M: 6 ; D: 25; Name: '���̿�'      ; Lunar: False; Red: False ),
   ( M: 7 ; D: 17; Name: '������'      ; Lunar: False; Red: True  ),
   ( M: 8 ; D: 15; Name: '������'      ; Lunar: False; Red: True  ),
   ( M: 10; D: 1 ; Name: '�����ǳ�'    ; Lunar: False; Red: False ),
   ( M: 10; D: 3 ; Name: '��õ��'      ; Lunar: False; Red: True  ),
   ( M: 10; D: 9 ; Name: '�ѱ۳�'      ; Lunar: False; Red: False ),
   ( M: 12; D: 25; Name: 'ũ��������'  ; Lunar: False; Red: True  ),

{����}
   ( M: 1 ; D: 1 ; Name: '����'        ; Lunar: True ; Red: True  ),
   ( M: 4 ; D: 8 ; Name: '����ź����'  ; Lunar: True ; Red: True  ),
   ( M: 8 ; D: 15; Name: '�߼�'        ; Lunar: True ; Red: True  )
   );

var
  LegalHolidays: TLegalHolidayTable;
  CurrentYear: Word = 0;

procedure UpdateLegalHolidays;
var
  i: Integer;
  ADate: TDateTime;
  Y: Word;
begin
  for i := Low( LegalHolidays ) to High( LegalHolidays ) do
   begin
     LegalHolidays[i] := LegalHolidayTbl[i];
     if LegalHolidayTbl[i].Lunar then
      begin
        if LunarToSolar( EncodeDate( CurrentYear, LegalHolidayTbl[i].M, LegalHolidayTbl[i].D ), False, ADate ) then
             DecodeDate( ADate, Y, LegalHolidays[i].M, LegalHolidays[i].D )
        else LegalHolidays[i].M := 0;
      end;
   end;
end;

function IsLegalHoliday( Year, Month, Day: Word; var DayName: String ): Boolean;
var
  i: Integer;
  Y, M, D: Word;
  Yun: Boolean;
begin
  if CurrentYear <> Year then
   begin
     CurrentYear := Year;
     UpdateLegalHolidays;
   end;

  Result := False;
  for i := Low( LegalHolidays ) to High( LegalHolidays ) do
   if ( LegalHolidays[i].M = Month ) and ( LegalHolidays[i].D = Day ) then
    begin
      if LegalHolidays[i].Red then Result := True;
      DayName := DayName + ' ' + LegalHolidays[i].Name;
    end;

  if Day > 0 then
   begin
     if SolarToLunar( EncodeDate( Year, Month, Day ), Y, M, D, Yun ) then
      begin
        if D in [1, 10, 20] then
         begin
           if ( D = 1 ) and Yun then
            begin
              if DayName = '' then DayName := '��'
                              else DayName := DayName + ' ��';
            end;
           if DayName = '' then DayName := IntToStr( M ) + '.' + IntToStr( D )
                           else DayName := DayName + ' ' + IntToStr( M ) + '.' + IntToStr( D );
         end;
      end;
   end;
end;

constructor TBKCalendar.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  BorderStyle := bsNone;
  FixedColor := clWindow;
  GridLineWidth := 0;
  ParentFont := False;
  Options := Options - [goRangeSelect] + [goDrawFocusSelected] - [goVertLine] - [goHorzLine] - [goFixedVertLine] - [goFixedHorzLine];

  UpdateCalendar;

  FSkin := 1;
end;

procedure TBKCalendar.Change;
begin
  UpdateRowHeights;
  inherited Change;
end;

function TBKCalendar.DaysThisMonth: Integer;
begin
  Result := inherited DaysThisMonth;
end;

procedure TBKCalendar.DrawCell(ACol, ARow: Longint; ARect: TRect; AState: TGridDrawState);
type
  TCellType = ( ctBlank, ctWeekNor, ctWeekSun, ctWeekSat, ctDayNor, ctDaySun, ctDaySat );
var
  TheText: string;
  WeekText: String;

  BRect, CRect: TRect;
  Strings: TStrings;
  Day, i, DayHeight: Integer;
  DayName: String;

  CellType: TCellType;
  Selected: Boolean;
  IsWeek: Boolean;

function GetDay: Integer;
  begin
    try
      Result := StrToInt( TheText );
    except
      Result := 0;
    end;
  end;

function IsToDay: Boolean;
  var
    ADate: TDateTime;
  begin
    try
      ADate := EncodeDate( Year, Month, Day );
    except
      ADate := 0;
    end;
    Result := ADate = Date;
  end;
begin
  TheText := CellText[ACol, ARow];
  WeekText := ShortDayNames[ ( StartOfWeek + ACol ) mod 7 + 1 ];

  DayName := '';
  Day := GetDay;

  Selected := gdSelected in AState;
  IsWeek := ARow = 0;

  case ARow of
    0: begin
         case ACol of
           0: CellType := ctWeekSun;
           6: CellType := ctWeekSat;
         else CellType := ctWeekNor;
         end;
       end;
  else begin
         case ACol of
           0: CellType := ctDaySun;
           6: CellType := ctDaySat;
         else CellType := ctDayNor;
         end;
         if IsLegalHoliday( Year, Month, Day, DayName ) then CellType := ctDaySun;
         if Day = 0 then CellType := ctBlank;
       end;
  end;

  case Skin of
  0: begin
      {$I �⺻.inc}
     end;
  1: begin
      {$I �Ե�����.inc}
     end;
  end;
end;

procedure TBKCalendar.UpdateRowHeights;
var
  DOW, DayCount: Integer;
  IsLastBlank: Boolean;
  LastLine: Integer;
begin
  DOW := DayOfWeek( EncodeDate( Year, Month, 1 ) );
  DayCount := DaysThisMonth;

  IsLastBlank := not( ( ( DOW >= 6 ) and ( DayCount >= 31 ) ) or ( ( DOW = 7 ) and ( DayCount >= 30 ) ) );

  if IsLastBlank then LastLine := 5
                 else LastLine := 6;

  DefaultRowHeight := ( Height div LastLine ) - 4;

  RowHeights[0] := 20;
end;


procedure TBKCalendar.WMSize(var Message: TWMSize);
begin
  DefaultColWidth := Message.Width div 7;
  UpdateRowHeights;

  RowHeights[0] := 20;

  ColWidths[6] := DefaultColWidth + Message.Width mod 7;
end;

procedure TBKCalendar.SetSkin(const Value: Integer);
begin
  if FSkin <> Value then
   begin
     FSkin := Value;
     Invalidate;
   end;
end;

function TBKCalendar.DoMouseWheelDown(Shift: TShiftState; MousePos: TPoint): Boolean;
begin
  Result := True;
  if ssCtrl in Shift then NextMonth
  else
   begin
     if Day = DaysThisMonth then
      begin
        NextMonth;
        Day := 1;
      end
     else
      Day := Day + 1;
   end;
end;

function TBKCalendar.DoMouseWheelUp(Shift: TShiftState; MousePos: TPoint): Boolean;
begin
  Result := True;
  if ssCtrl in Shift then PrevMonth
  else
   begin
     if Day = 1 then
      begin
        PrevMonth;
        Day := DaysThisMonth;
      end
     else
      Day := Day - 1;
   end;
end;




end.
