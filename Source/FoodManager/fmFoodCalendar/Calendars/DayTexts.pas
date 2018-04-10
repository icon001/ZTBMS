unit DayTexts;

interface

uses
  Windows, Classes, SysUtils, Forms;

//Date��¥�� �޸� ������ True ������ False
function GetDayTextExists( Date: TDateTime ): Boolean;

//Date��¥�� �޸� Strings�� �־��ش�. �����ϸ� True�� �������ش�.
function GetDayText( Date: TDateTime; Strings: TStrings ): Boolean;

//Strings�� �ִ� ������ Date��¥�� �����Ѵ�.
procedure SetDayText( Date: TDateTime; Strings: TStrings );

//Date��¥�� ������ �����Ѵ�.
procedure DeleteDayText( Date: TDateTime );

//�����Ͱ� ����Ǵ� ���..
function GetDBPath: String;

//Date��¥�� �ش��ϴ� ���ϸ�(��ξ���)�� �����Ѵ�.
function GetDBName( Date: TDateTime ): String;

//Date��¥�� �ش��ϴ� ��ü ���ϸ�(�������)�� �����Ѵ�.
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
