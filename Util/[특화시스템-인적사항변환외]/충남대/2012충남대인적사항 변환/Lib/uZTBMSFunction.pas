{*******************************************************}
{                                                       }
{         ȭ�ϸ�: uZTBMSFunction.pas                        }
{         ��  ��: ZTBMS �Լ�                              }
{         �ۼ���:                                       }
{         �ۼ���: ��ȫ��                               }
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


//ī�� �������� ������� üũ�ؼ� �������̷� �������
function GetFixedCardNoCheck(aCardNo:string;bCardFixedUse:Boolean;
         aCardFixedFillChar:string;nCardFixedPosition,nCardFixedLength:integer):string;
var
  bFront : Boolean;
begin
  result := aCardNo;
  if Not bCardFixedUse then Exit; //�������� ������� ������ �� ī�嵥���� ����
  bFront := True;
  if nCardFixedPosition <> 0 then bFront := False;//�ڿ� ä���� ä��� ���
  result := FillCharString(aCardNo,aCardFixedFillChar[1],nCardFixedLength,bFront);
end;

end.
