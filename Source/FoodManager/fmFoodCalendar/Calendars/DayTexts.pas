unit DayTexts;

interface

uses
  Windows, Classes, SysUtils, Forms;

//Date날짜에 메모가 있으면 True 없으면 False
function GetDayTextExists( Date: TDateTime ): Boolean;

//Date날짜의 메모를 Strings에 넣어준다. 성공하면 True를 리턴해준다.
function GetDayText( Date: TDateTime; Strings: TStrings ): Boolean;

//Strings에 있는 내용을 Date날짜에 저장한다.
procedure SetDayText( Date: TDateTime; Strings: TStrings );

//Date날짜의 내용을 삭제한다.
procedure DeleteDayText( Date: TDateTime );

//데이터가 저장되는 경로..
function GetDBPath: String;

//Date날짜에 해당하는 파일명(경로없음)을 리턴한다.
function GetDBName( Date: TDateTime ): String;

//Date날짜에 해당하는 전체 파일명(경로있음)을 리턴한다.
function GetDBFullName( Date: TDateTime ): String;

implementation

function GetDBPath: String;
begin
  Result := ExtractFilePath( Application.ExeName );
end;

function GetDBName( Date: TDateTime ): String;
var
  Y, M, D: Word;
begin
  DecodeDate( Date, Y, M, D );
  Result := FormatFloat( '####0000', Y ) + FormatFloat( '##00', M ) + FormatFloat( '##00', D ) + '.txt';
end;

function GetDBFullName( Date: TDateTime ): String;
begin
  Result := GetDBPath + GetDBName( Date );
end;

function GetDayTextExists( Date: TDateTime ): Boolean;
begin
  Result := FileExists( GetDBPath + GetDBName( Date ) );
end;

function GetDayText( Date: TDateTime; Strings: TStrings ): Boolean;
var
  FileName: String;
begin
  Result := False;

  FileName := GetDBPath + GetDBName( Date );
  if FileExists( FileName ) then
   begin
     Strings.LoadFromFile( FileName );
     Result := True;
   end;
end;

procedure SetDayText( Date: TDateTime; Strings: TStrings );
var
  FileName: String;
begin
  FileName := GetDBPath + GetDBName( Date );
  Strings.SaveToFile( FileName );
end;

procedure DeleteDayText( Date: TDateTime );
var
  FileName: String;
begin
  FileName := GetDBPath + GetDBName( Date );
  if FileExists( FileName ) then DeleteFile( FileName );
end;

end.
