unit MyCalendar;

interface
uses
Windows, Messages, SysUtils, Classes, Controls, Grids, Calendar;
type
TMyCalendar = class(TCalendar)
private
{ Private declarations }
FOnDrawCell: TDrawCellEvent;
protected
{ Protected declarations }
procedure DrawCell(ACol, ARow: Longint; ARect: TRect; AState: TGridDrawState); override;
public
{ Public declarations }
property Canvas;
published
property OnDrawCell: TDrawCellEvent read FOnDrawCell write FOnDrawCell;
{ Published declarations }
end;

procedure Register;

implementation

procedure Register;
begin
RegisterComponents('Samples', [TMyCalendar]);
end;

{ TMyCalendar }

procedure TMyCalendar.DrawCell(ACol, ARow: Integer; ARect: TRect;
  AState: TGridDrawState);
begin
  inherited;
  if Assigned(FOnDrawCell) then FOnDrawCell(Self,ACol, ARow,ARect,AState);

end;

end.
