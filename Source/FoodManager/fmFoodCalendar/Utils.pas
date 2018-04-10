unit Utils;

interface

uses
  Registry;

function CreateConfig: TRegIniFile;

implementation

function CreateConfig: TRegIniFile;
begin
  Result := TRegIniFile.Create;
  Result.OpenKey( 'SOFTWARE\BKCalendar\', True );
end;

end.
