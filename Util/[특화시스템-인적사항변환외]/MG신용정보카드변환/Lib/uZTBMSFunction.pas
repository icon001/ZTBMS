{*******************************************************}
{                                                       }
{         화일명: uZTBMSFunction.pas                        }
{         설  명: ZTBMS 함수                              }
{         작성일:                                       }
{         작성자: 이홍규                               }
{         Copyright                                     }
{                                                       }
{*******************************************************}

unit uZTBMSFunction;

interface
uses
  uLomosUtil;
  
function GetFixedCardNoCheck(aCardNo:string;bCardFixedUse:Boolean;
         aCardFixedFillChar:string;nCardFixedPosition,nCardFixedLength:integer):string;


implementation


//카드 고정길이 사용유무 체크해서 고정길이로 만들어줌
function GetFixedCardNoCheck(aCardNo:string;bCardFixedUse:Boolean;
         aCardFixedFillChar:string;nCardFixedPosition,nCardFixedLength:integer):string;
var
  bFront : Boolean;
begin
  result := aCardNo;
  if Not bCardFixedUse then Exit; //고정길이 사용하지 않으면 원 카드데이터 리턴
  bFront := True;
  if nCardFixedPosition <> 0 then bFront := False;//뒤에 채움문자 채우는 경우
  result := FillCharString(aCardNo,aCardFixedFillChar[1],nCardFixedLength,bFront);
end;

end.
