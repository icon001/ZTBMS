unit uDataBase;

interface
uses Classes,SysUtils;

type
  TDataBase = Class
  private
  public
    procedure ExecuteBase(aSql:string);
    procedure ExecuteEvent(aSql:string);
    procedure ExecuteLog(aSql:string);
  end;

implementation

{ TDataBase }

procedure TDataBase.ExecuteBase(aSql: string);
begin

end;

procedure TDataBase.ExecuteEvent(aSql: string);
begin

end;

procedure TDataBase.ExecuteLog(aSql: string);
begin

end;

end.
