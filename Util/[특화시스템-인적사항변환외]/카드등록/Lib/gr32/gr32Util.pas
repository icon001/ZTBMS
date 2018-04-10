unit gr32Util;

interface

uses
 Graphics,GR32,SysUtils,
 uLomosUtil;

function NormalizeRect(r: TRect): TRect;

implementation

//------------------------------------------------------------------------------

function NormalizeRect(r: TRect): TRect;
begin
  result := r;
  if r.Left > r.Right then
  begin
    result.Left := r.Right; result.Right := r.Left;
  end;
  if r.Top > r.Bottom then
  begin
    result.Top := r.Bottom; result.Bottom := r.Top;
  end;
end;

//------------------------------------------------------------------------------


end.
 