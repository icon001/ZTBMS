unit uJavara;

interface

uses
  SysUtils, Classes,DB,ADODB,ActiveX;

type
  TdmJavara = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    JavaraList : TStringList;
    { Private declarations }
  public
    { Public declarations }
    procedure JavaraLoad;
    function JavaraCheck(aNodeNo:integer;aEcuID:string):Boolean;
  end;

var
  dmJavara: TdmJavara;

implementation

uses
  uDataModule1,
  uLomosUtil;

{$R *.dfm}

procedure TdmJavara.DataModuleCreate(Sender: TObject);
begin
  JavaraList := TStringList.Create;
end;

procedure TdmJavara.DataModuleDestroy(Sender: TObject);
begin
  JavaraList.Free;
end;

function TdmJavara.JavaraCheck(aNodeNo: integer; aEcuID: string): Boolean;
var
  stDeviceID : string;
begin
  result := False;
  stDeviceID := FillZeroNumber(aNodeNo,3) + aEcuID;
  if JavaraList.IndexOf(stDeviceID) < 0 then Exit;
  result := True;

end;

procedure TdmJavara.JavaraLoad;
var
  stSql : string;
  TempQuery :TADOQuery;
begin
  JavaraList.Clear;

  stSql := 'Select * from TB_ACCESSDEVICE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_JAVARATYPE = ''1'' ';
  Try
    CoInitialize(nil);
    TempQuery := TADOQuery.Create(nil);
    TempQuery.Connection := DataModule1.ADOConnection;
    TempQuery.DisableControls;
    with TempQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if recordcount < 1 then Exit;
      while Not Eof do
      begin
        JavaraList.Add(FillZeroNumber(FindField('AC_NODENO').AsInteger,3) + FindField('AC_ECUID').AsString);
        Next;
      end;
    end;
  Except
    Exit;
  End;

end;

end.
